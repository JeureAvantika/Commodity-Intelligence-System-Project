using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewCISProject
{
    public partial class AdminLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: clear error message on load
            if (!IsPostBack)
            {
                lblError.Text = "";
                lblError.Style["display"] = "none";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Replace this with your actual admin validation logic (DB, config, etc.)
            if (username == "admin" && password == "admin123")
            {
                // Redirect to admin dashboard on success
                Response.Redirect("AdminPage.aspx");
            }
            else
            {
                lblError.Text = "Invalid username or password.";
                lblError.Style["display"] = "block";
            }
        }

    }

}