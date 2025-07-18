//code5

using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace NewCISProject
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: clear previous session if needed
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string connectionString = WebConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = @"SELECT UserType FROM Users 
                                       WHERE PhoneNumber = @PhoneNumber 
                                       AND Password = @Password";

                        using (SqlCommand cmd = new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@PhoneNumber", TextBox1.Text.Trim());
                            cmd.Parameters.AddWithValue("@Password", TextBox2.Text.Trim()); // Note: Hash this in production

                            con.Open();
                            object result = cmd.ExecuteScalar();

                            if (result != null)
                            {
                                string userType = result.ToString();
                                Session["PhoneNumber"] = TextBox1.Text.Trim();
                                Session["UserType"] = userType;

                                // Show success message before redirect
                                lblMessage.Text = "Login successful! Redirecting...";
                                lblMessage.ForeColor = System.Drawing.Color.Green;

                                // Redirect based on user type
                                string redirectPage = userType == "Farmer" ? "FarmerDashboard.aspx" : "TraderDashboardPage.aspx";
                                Response.AddHeader("REFRESH", "2;URL=" + redirectPage);
                            }
                            else
                            {
                                lblMessage.Text = "Invalid phone number or password";
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Login failed. Please try again.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
































//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace NewCISProject
//{
//    public partial class LoginPage : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}


//using System;
//using System.Web.UI;

//namespace NewCISProject
//{
//    public partial class LoginPage : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//        }

//        protected void btnRegister_Click(object sender, EventArgs e)
//        {
//            if (Page.IsValid)
//            {
//                // Here you would typically save the registration data to a database
//                string name = txtName.Text;
//                string phone = txtPhone.Text;
//                string email = txtEmail.Text;
//                string userType = ddlUserType.SelectedValue;
//                string password = txtPassword.Text;

//                // TODO: Add your registration logic here
//                // For example, save to database, hash password, etc.

//                // After successful registration, show login form
//                ClientScript.RegisterStartupScript(this.GetType(), "showLogin", "toggleForms();", true);
//            }
//        }

//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            if (Page.IsValid)
//            {
//                string phone = txtLoginPhone.Text;
//                string password = txtLoginPassword.Text;

//                // TODO: Add your login authentication logic here
//                // For example, check credentials against database

//                // If login is successful, redirect to another page
//                // Response.Redirect("Dashboard.aspx");
//            }
//        }
//    }
//}


////code2
//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.Configuration;
//using System.Web.UI;

//namespace NewCISProject
//{
//    public partial class LoginPage : System.Web.UI.Page
//    {
//        private string connectionString = WebConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                // Test database connection on first load
//                TestDatabaseConnection();
//            }
//        }

//        //private void TestDatabaseConnection()
//        //{
//        //    try
//        //    {
//        //        using (SqlConnection con = new SqlConnection(connectionString))
//        //        {
//        //            con.Open();
//        //            ClientScript.RegisterStartupScript(this.GetType(), "dbSuccess",
//        //                "console.log('Database connection successful');", true);
//        //        }
//        //    }
//        //    catch (Exception ex)
//        //    {
//        //        ClientScript.RegisterStartupScript(this.GetType(), "dbError",
//        //            $"console.error('Database connection failed: {ex.Message}');", true);
//        //    }
//        //}

//        private void TestDatabaseConnection()
//        {
//            try
//            {
//                using (SqlConnection con = new SqlConnection(connectionString))
//                {
//                    con.Open();
//                    // Log to debug panel
//                    ClientScript.RegisterStartupScript(this.GetType(), "dbDebug",
//                        "if(window.addDebugMessage) addDebugMessage('Database connection successful');", true);

//                    // Check if table exists
//                    string tableCheck = "IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users') SELECT 1 ELSE SELECT 0";
//                    SqlCommand cmd = new SqlCommand(tableCheck, con);
//                    bool tableExists = (int)cmd.ExecuteScalar() == 1;

//                    ClientScript.RegisterStartupScript(this.GetType(), "tableDebug",
//                        $"if(window.addDebugMessage) addDebugMessage('Users table exists: {tableExists}');", true);
//                }
//            }
//            catch (Exception ex)
//            {
//                ClientScript.RegisterStartupScript(this.GetType(), "dbError",
//                    $"if(window.addDebugMessage) addDebugMessage('Connection failed: {ex.Message.Replace("'", "\\'")}');", true);
//            }
//        }

//        protected void btnRegister_Click(object sender, EventArgs e)
//        {
//            if (Page.IsValid)
//            {
//                try
//                {
//                    using (SqlConnection con = new SqlConnection(connectionString))
//                    {
//                        // Check if phone number exists
//                        string checkQuery = "SELECT COUNT(*) FROM Users WHERE PhoneNumber = @PhoneNumber";
//                        SqlCommand checkCmd = new SqlCommand(checkQuery, con);
//                        checkCmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());

//                        con.Open();
//                        int userCount = (int)checkCmd.ExecuteScalar();

//                        if (userCount > 0)
//                        {
//                            ShowErrorMessage("Phone number already registered!");
//                            return;
//                        }

//                        // Insert new user
//                        string insertQuery = @"INSERT INTO Users 
//                                            (PhoneNumber, FullName, Email, UserType, Password) 
//                                            VALUES 
//                                            (@PhoneNumber, @FullName, @Email, @UserType, @Password)";

//                        SqlCommand cmd = new SqlCommand(insertQuery, con);
//                        cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
//                        cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
//                        cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(txtEmail.Text) ? DBNull.Value : (object)txtEmail.Text.Trim());
//                        cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
//                        cmd.Parameters.AddWithValue("@Password", HashPassword(txtPassword.Text.Trim()));

//                        int rowsAffected = cmd.ExecuteNonQuery();

//                        if (rowsAffected > 0)
//                        {
//                            // Show success message and switch to login
//                            ClientScript.RegisterStartupScript(this.GetType(), "regSuccess",
//                                "alert('Registration successful!'); toggleForms();", true);
//                            ClearRegistrationForm();
//                        }
//                    }
//                }
//                catch (SqlException sqlEx)
//                {
//                    ShowErrorMessage($"Database error: {sqlEx.Number} - {sqlEx.Message}");
//                    LogError(sqlEx);
//                }
//                catch (Exception ex)
//                {
//                    ShowErrorMessage("Registration failed. Please try again.");
//                    LogError(ex);
//                }
//            }
//            else
//            {
//                ShowErrorMessage("Please fix the validation errors");
//            }
//        }

//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            if (Page.IsValid)
//            {
//                try
//                {
//                    using (SqlConnection con = new SqlConnection(connectionString))
//                    {
//                        string query = @"SELECT UserType FROM Users 
//                                       WHERE PhoneNumber = @PhoneNumber 
//                                       AND Password = @Password";

//                        SqlCommand cmd = new SqlCommand(query, con);
//                        cmd.Parameters.AddWithValue("@PhoneNumber", txtLoginPhone.Text.Trim());
//                        cmd.Parameters.AddWithValue("@Password", HashPassword(txtLoginPassword.Text.Trim()));

//                        con.Open();
//                        object result = cmd.ExecuteScalar();

//                        if (result != null)
//                        {
//                            string userType = result.ToString();
//                            Session["PhoneNumber"] = txtLoginPhone.Text.Trim();
//                            Session["UserType"] = userType;

//                            // Show success before redirect
//                            ClientScript.RegisterStartupScript(this.GetType(), "loginSuccess",
//                                $"alert('Welcome! Redirecting to your dashboard...'); window.location.href='{(userType == "Farmer" ? "FarmerDashboard.aspx" : "TraderDashboard.aspx")}';", true);
//                        }
//                        else
//                        {
//                            ShowErrorMessage("Invalid credentials. Please try again.");
//                        }
//                    }
//                }
//                catch (Exception ex)
//                {
//                    ShowErrorMessage("Login failed. Please try again.");
//                    LogError(ex);
//                }
//            }
//        }

//        private string HashPassword(string password)
//        {
//            // Use better hashing in production (like BCrypt)
//            using (var sha256 = System.Security.Cryptography.SHA256.Create())
//            {
//                var hashedBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
//                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
//            }
//        }

//        private void ShowErrorMessage(string message)
//        {
//            ScriptManager.RegisterStartupScript(this, this.GetType(), "errorAlert",
//                $"alert('{message.Replace("'", "\\'")}');", true);
//        }

//        private void LogError(Exception ex)
//        {
//            // Implement proper logging (to file/database)
//            System.Diagnostics.Debug.WriteLine($"ERROR: {ex.Message}\n{ex.StackTrace}");
//        }

//        private void ClearRegistrationForm()
//        {
//            txtName.Text = "";
//            txtPhone.Text = "";
//            txtEmail.Text = "";
//            ddlUserType.SelectedIndex = 0;
//            txtPassword.Text = "";
//            txtConfirmPassword.Text = "";
//        }
//    }
//}





////code3
//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.Configuration;
//using System.Web.UI;

//namespace NewCISProject
//{
//    public partial class LoginPage : System.Web.UI.Page
//    {
//        private string connectionString = WebConfigurationManager.ConnectionStrings["CISConnectionString"].ConnectionString;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                TestDatabaseConnection();

//                // Enable debug mode if requested
//                if (Request.QueryString["debug"] == "1")
//                {
//                    RegisterDebugScript("Debug mode enabled");
//                }
//            }
//        }

//        protected void btnRegister_Click(object sender, EventArgs e)
//        {
//            RegisterDebugScript("Register button clicked");

//            if (Page.IsValid)
//            {
//                RegisterDebugScript("Page validation passed");

//                try
//                {
//                    using (SqlConnection con = new SqlConnection(connectionString))
//                    {
//                        RegisterDebugScript("Attempting database connection");
//                        con.Open();
//                        RegisterDebugScript("Database connection established");

//                        // Check if phone exists
//                        string checkQuery = "SELECT COUNT(*) FROM Users WHERE PhoneNumber = @PhoneNumber";
//                        using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
//                        {
//                            checkCmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
//                            int userCount = (int)checkCmd.ExecuteScalar();
//                            RegisterDebugScript($"User check completed. Count: {userCount}");

//                            if (userCount > 0)
//                            {
//                                ShowStatusMessage("This phone number is already registered.", "error");
//                                return;
//                            }
//                        }

//                        // Insert new user
//                        string insertQuery = @"INSERT INTO Users 
//                                            (PhoneNumber, FullName, Email, UserType, Password) 
//                                            VALUES 
//                                            (@PhoneNumber, @FullName, @Email, @UserType, @Password)";

//                        using (SqlCommand cmd = new SqlCommand(insertQuery, con))
//                        {
//                            cmd.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text.Trim());
//                            cmd.Parameters.AddWithValue("@FullName", txtName.Text.Trim());
//                            cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(txtEmail.Text) ? DBNull.Value : (object)txtEmail.Text.Trim());
//                            cmd.Parameters.AddWithValue("@UserType", ddlUserType.SelectedValue);
//                            cmd.Parameters.AddWithValue("@Password", HashPassword(txtPassword.Text.Trim()));

//                            int rowsAffected = cmd.ExecuteNonQuery();
//                            RegisterDebugScript($"Insert executed. Rows affected: {rowsAffected}");
//                            if (rowsAffected > 0)
//                            {
//                                ShowStatusMessage("Registration successful!", "success");
//                                ClearRegistrationForm();
//                                RegisterDebugScript("Registration completed successfully");

//                                // Show popup alert and switch to login after 2 seconds
//                                string script = @"alert('Registration successful!');
//                                    setTimeout(function() {
//                                        toggleForms();
//                                    }, 2000);";

//                                ClientScript.RegisterStartupScript(this.GetType(), "SuccessPopup", script, true);
//                            }
//                            else
//                            {
//                                ShowStatusMessage("Registration failed - no rows affected", "error");
//                            }

//                            //if (rowsAffected > 0)
//                            //{
//                            //    ShowStatusMessage("Registration successful!", "success");
//                            //    ClearRegistrationForm();
//                            //    RegisterDebugScript("Registration completed successfully");

//                            //    // Auto-switch to login after 2 seconds
//                            //    ClientScript.RegisterStartupScript(this.GetType(), "switchToLogin",
//                            //        "setTimeout(function() { toggleForms(); }, 2000);", true);
//                            //}
//                            //else
//                            //{
//                            //    ShowStatusMessage("Registration failed - no rows affected", "error");
//                            //}
//                        }
//                    }
//                }
//                catch (SqlException ex)
//                {
//                    RegisterDebugScript($"SQL Error: {ex.Message}");
//                    ShowStatusMessage($"Database error: {ex.Message}", "error");
//                }
//                catch (Exception ex)
//                {
//                    RegisterDebugScript($"Error: {ex.Message}");
//                    ShowStatusMessage("Registration failed. Please try again.", "error");
//                }
//            }
//            else
//            {
//                RegisterDebugScript("Page validation failed");
//                ShowStatusMessage("Please fix validation errors", "error");
//            }
//        }

//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            RegisterDebugScript("Login button clicked");

//            if (Page.IsValid)
//            {
//                try
//                {
//                    using (SqlConnection con = new SqlConnection(connectionString))
//                    {
//                        con.Open();
//                        string query = @"SELECT UserType FROM Users 
//                                       WHERE PhoneNumber = @PhoneNumber 
//                                       AND Password = @Password";

//                        using (SqlCommand cmd = new SqlCommand(query, con))
//                        {
//                            cmd.Parameters.AddWithValue("@PhoneNumber", txtLoginPhone.Text.Trim());
//                            cmd.Parameters.AddWithValue("@Password", HashPassword(txtLoginPassword.Text.Trim()));

//                            object result = cmd.ExecuteScalar();
//                            RegisterDebugScript($"Login query executed. Result: {result}");

//                            if (result != null)
//                            {
//                                string userType = result.ToString();
//                                Session["PhoneNumber"] = txtLoginPhone.Text.Trim();
//                                Session["UserType"] = userType;
//                                RegisterDebugScript($"Login successful. User type: {userType}");

//                                ShowStatusMessage("Login successful! Redirecting...", "success");

//                                // Redirect after 2 seconds
//                                string redirectPage = userType == "Farmer" ? "FarmerDashboard.aspx" : "TraderDashboard.aspx";
//                                ClientScript.RegisterStartupScript(this.GetType(), "redirect",
//                                    $"setTimeout(function() {{ window.location.href = '{redirectPage}'; }}, 2000);", true);
//                            }
//                            else
//                            {
//                                ShowStatusMessage("Invalid phone number or password", "error");
//                            }
//                        }
//                    }
//                }
//                catch (Exception ex)
//                {
//                    RegisterDebugScript($"Login error: {ex.Message}");
//                    ShowStatusMessage("Login failed. Please try again.", "error");
//                }
//            }
//        }

//        private string HashPassword(string password)
//        {
//            using (var sha256 = System.Security.Cryptography.SHA256.Create())
//            {
//                var hashedBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
//                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
//            }
//        }

//        private void TestDatabaseConnection()
//        {
//            try
//            {
//                using (SqlConnection con = new SqlConnection(connectionString))
//                {
//                    con.Open();
//                    RegisterDebugScript("Database connection test successful");

//                    // Verify table exists
//                    string tableCheck = "SELECT COUNT(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Users'";
//                    using (SqlCommand cmd = new SqlCommand(tableCheck, con))
//                    {
//                        int tableExists = (int)cmd.ExecuteScalar();
//                        RegisterDebugScript($"Users table exists: {tableExists == 1}");
//                    }
//                }
//            }
//            catch (Exception ex)
//            {
//                RegisterDebugScript($"Connection test failed: {ex.Message}");
//            }
//        }

//        private void ShowStatusMessage(string message, string type)
//        {
//            pnlStatus.Visible = true;
//            pnlStatus.CssClass = $"status-message {type}";
//            litStatus.Text = message;

//            // Hide after 5 seconds
//            ClientScript.RegisterStartupScript(this.GetType(), "hideStatus",
//                $"setTimeout(function() {{ document.getElementById('{pnlStatus.ClientID}').style.display = 'none'; }}, 5000);", true);
//        }

//        private void RegisterDebugScript(string message)
//        {
//            if (Request.QueryString["debug"] == "1")
//            {
//                ClientScript.RegisterStartupScript(this.GetType(), $"debug_{DateTime.Now.Ticks}",
//                    $"if(window.addDebugMessage) addDebugMessage('{message.Replace("'", "\\'")}');", true);
//            }
//            System.Diagnostics.Debug.WriteLine(message);
//        }

//        private void ClearRegistrationForm()
//        {
//            txtName.Text = "";
//            txtPhone.Text = "";
//            txtEmail.Text = "";
//            ddlUserType.SelectedIndex = 0;
//            txtPassword.Text = "";
//            txtConfirmPassword.Text = "";
//        }
//    }
//}





////code4
//using System;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Web.Configuration;
//using System.Web.UI;
////using System.Web.HttpException
//namespace NewCISProject
//{
//    public partial class LoginPage : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            // Optional: clear previous session if needed
//        }



//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            if (Page.IsValid)
//            {
//                try
//                {
//                    string connectionString = WebConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

//                    using (SqlConnection con = new SqlConnection(connectionString))
//                    {
//                        string query = @"SELECT UserType FROM Users 
//                                       WHERE PhoneNumber = @PhoneNumber 
//                                       AND Password = @Password";

//                        using (SqlCommand cmd = new SqlCommand(query, con))
//                        {
//                            cmd.Parameters.AddWithValue("@PhoneNumber", TextBox1.Text.Trim());
//                            cmd.Parameters.AddWithValue("@Password", TextBox2.Text.Trim()); // Note: Hash this in production

//                            con.Open();
//                            object result = cmd.ExecuteScalar();

//                            if (result != null)
//                            {
//                                string userType = result.ToString();
//                                Session["PhoneNumber"] = TextBox1.Text.Trim();
//                                Session["UserType"] = userType;

//                                // Show success message before redirect
//                                lblMessage.Text = "Login successful! Redirecting...";
//                                lblMessage.ForeColor = System.Drawing.Color.Green;

//                                // Redirect based on user type
//                                string redirectPage = userType == "Farmer" ? "FarmerDashboard.aspx" : "TraderDashboard.aspx";
//                                Response.AddHeader("REFRESH", "2;URL=" + redirectPage);
//                            }
//                            else
//                            {
//                                lblMessage.Text = "Invalid phone number or password";
//                                lblMessage.ForeColor = System.Drawing.Color.Red;
//                            }
//                        }
//                    }
//                }
//                catch (SqlException ex)
//                {
//                    lblMessage.Text = "Database error: " + ex.Message;
//                    lblMessage.ForeColor = System.Drawing.Color.Red;
//                }
//                catch (Exception ex)
//                {
//                    lblMessage.Text = "Login failed. Please try again.";
//                    lblMessage.ForeColor = System.Drawing.Color.Red;
//                }
//            }
//        }
//    }
//}




//code5