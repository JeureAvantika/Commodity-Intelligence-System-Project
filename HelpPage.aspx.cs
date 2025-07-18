using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; // For ConfigurationManager
using System.Web.UI;

namespace NewCISProject
{
    public partial class HelpPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            string feedback = txtFeedback.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(feedback))
            {
                // Simple validation
                Response.Write("<script>alert('Please enter both email and feedback.');</script>");
                return;
            }

            try
            {
                // Get connection string from Web.config
                string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "INSERT INTO Feedback (Email, Message, SubmittedAt) VALUES (@Email, @Message, GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Message", feedback);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                }

                // Clear form after successful insert
                txtEmail.Text = "";
                txtFeedback.Text = "";

                // Show success message
                Response.Write("<script>alert('Thank you for your feedback!');</script>");
            }
            catch (Exception ex)
            {
                // Log error here if needed
                Response.Write("<script>alert('Error saving feedback. Please try again later.');</script>");
            }
        }
    }
}
