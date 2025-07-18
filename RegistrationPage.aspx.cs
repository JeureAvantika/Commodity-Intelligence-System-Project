using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewCISProject
{
    public partial class Example : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string connectionString = WebConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        // First check if phone number already exists
                        string checkQuery = "SELECT COUNT(*) FROM Users WHERE PhoneNumber = @PhoneNumber";
                        SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                        checkCmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());

                        con.Open();
                        int userCount = (int)checkCmd.ExecuteScalar();

                        if (userCount > 0)
                        {
                            lblMessage.Text = "This phone number is already registered.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }

                        // Insert new user
                        string insertQuery = @"INSERT INTO Users 
                            (PhoneNumber, FullName, Email, UserType, Password, Location) 
                            VALUES 
                            (@PhoneNumber, @FullName, @Email, @UserType, @Password, @Location)";


                        using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                        {
                            cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
                            cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
                            cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(txtEmail.Text) ? DBNull.Value : (object)txtEmail.Text.Trim());
                            cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
                            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim()); // Note: Hash this in production
                            cmd.Parameters.AddWithValue("@Location", string.IsNullOrEmpty(txtSelectedAddress.Text) ? DBNull.Value : (object)txtSelectedAddress.Text.Trim());

                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                lblMessage.Text = "Registration successful!";
                                lblMessage.ForeColor = System.Drawing.Color.Green;

                                // Clear form
                                txtName.Text = "";
                                txtPhone.Text = "";
                                txtEmail.Text = "";
                                ddlUserType.SelectedIndex = 0;
                                txtPassword.Text = "";
                                txtConfirmPassword.Text = "";

                                // Redirect to login page after 2 seconds
                                ClientScript.RegisterStartupScript(this.GetType(), "redirectToLogin",
                                    "setTimeout(function() { window.location.href = 'LoginPage.aspx'; }, 2000);", true);

                            }
                            else
                            {
                                lblMessage.Text = "Registration failed - no rows affected";
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                }
                catch (SqlException sqlEx)
                {
                    // Show specific SQL errors
                    lblMessage.Text = "Database Error: " + sqlEx.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;

                    // Log detailed error
                    System.Diagnostics.Debug.WriteLine("SQL Error Number: " + sqlEx.Number);
                    System.Diagnostics.Debug.WriteLine("SQL Error Message: " + sqlEx.Message);
                }
                catch (Exception ex)
                {
                    // Show general errors
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;

                    // Log full error details
                    System.Diagnostics.Debug.WriteLine("Error: " + ex.ToString());
                }
            }
        }


        protected void btnTestConnection_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    lblMessage.Text = "Database connection successful!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    // Verify table exists
                    string tableCheck = "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users'";
                    SqlCommand cmd = new SqlCommand(tableCheck, con);
                    int tableExists = (int)cmd.ExecuteScalar();

                    lblMessage.Text += tableExists == 1 ? " (Users table exists)" : " (Users table MISSING)";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Connection failed: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}