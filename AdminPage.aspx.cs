


//<% --code1-- %>
//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.UI;
//using System.Web.UI.HtmlControls;

//namespace NewCISProject
//{
//    public partial class AdminPage : System.Web.UI.Page
//    {
//        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CISDB;Integrated Security=True";

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                ShowDashboard(); // Show Dashboard by default
//            }
//        }

//        protected void lnkDashboard_Click(object sender, EventArgs e)
//        {
//            ShowDashboard();
//            SetActiveNav(liDashboard);
//        }

//        protected void lnkFeedback_Click(object sender, EventArgs e)
//        {
//            LoadFeedbackStats();
//            pnlDashboard.Visible = false;
//            pnlFeedback.Visible = true;
//            pnlUserList.Visible = false;
//            SetActiveNav(liFeedback);
//        }

//        protected void lnkUserList_Click(object sender, EventArgs e)
//        {
//            LoadUserList();
//            pnlDashboard.Visible = false;
//            pnlFeedback.Visible = false;
//            pnlUserList.Visible = true;
//            SetActiveNav(liUserList);
//        }

//        private void ShowDashboard()
//        {
//            pnlDashboard.Visible = true;
//            pnlFeedback.Visible = false;
//            pnlUserList.Visible = false;
//            SetActiveNav(liDashboard);
//        }
//        private void SetActiveNav(Control activeControl)
//        {
//            // Remove active class from all navigation items
//            if (liDashboard is HtmlControl)
//                ((HtmlControl)liDashboard).Attributes["class"] = "";
//            if (liFeedback is HtmlControl)
//                ((HtmlControl)liFeedback).Attributes["class"] = "";
//            if (liUserList is HtmlControl)
//                ((HtmlControl)liUserList).Attributes["class"] = "";

//            // Add active class to the selected navigation item
//            if (activeControl is HtmlControl)
//                ((HtmlControl)activeControl).Attributes["class"] = "active-nav";
//        }

//        private void LoadFeedbackStats()
//        {
//            DataTable dt = new DataTable();

//            using (SqlConnection con = new SqlConnection(connectionString))
//            {
//                string query = "SELECT SubmittedAt, Email, Message FROM Feedback";
//                SqlDataAdapter da = new SqlDataAdapter(query, con);
//                da.Fill(dt);
//            }

//            int total = dt.Rows.Count;

//            // Count today's feedbacks
//            DateTime todayDate = DateTime.Today;
//            int today = 0;

//            foreach (DataRow row in dt.Rows)
//            {
//                if (DateTime.TryParse(row["SubmittedAt"].ToString(), out DateTime submittedDate))
//                {
//                    if (submittedDate.Date == todayDate)
//                        today++;
//                }
//            }

//            // Update stat labels
//            totalFeedback.Text = total.ToString();
//            todaysFeedback.Text = today.ToString();
//            urgentFeedback.Text = "0"; // Urgency column removed, so default to 0

//            // Bind feedback data to GridView
//            gvFeedback.DataSource = dt;
//            gvFeedback.DataBind();
//        }

//        private void LoadUserList()
//        {
//            DataTable dt = new DataTable();

//            using (SqlConnection con = new SqlConnection(connectionString))
//            {
//                string query = "SELECT PhoneNumber, FullName, Email, UserType, CreatedDate FROM Users";
//                SqlDataAdapter da = new SqlDataAdapter(query, con);
//                da.Fill(dt);
//            }

//            int totalUsers = dt.Rows.Count;
//            int totalFarmers = 0;
//            int totalTraders = 0;

//            foreach (DataRow row in dt.Rows)
//            {
//                if (row["UserType"].ToString() == "Farmer")
//                    totalFarmers++;
//                else if (row["UserType"].ToString() == "Trader")
//                    totalTraders++;
//            }

//            // Update stat labels
//            lblTotalUsers.Text = totalUsers.ToString();
//            lblTotalFarmers.Text = totalFarmers.ToString();
//            lblTotalTraders.Text = totalTraders.ToString();

//            // Bind user data to GridView
//            gvUsers.DataSource = dt;
//            gvUsers.DataBind();
//        }
//    }
//}





using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace NewCISProject
{
    public partial class AdminPage : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=CISDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDashboard();
                LoadDashboardStats(); // Load stats when page first loads
            }
        }

        protected void lnkDashboard_Click(object sender, EventArgs e)
        {
            ShowDashboard();
            LoadDashboardStats(); // Reload stats when dashboard is clicked
            SetActiveNav(liDashboard);
        }

        protected void lnkFeedback_Click(object sender, EventArgs e)
        {
            LoadFeedbackStats();
            pnlDashboard.Visible = false;
            pnlFeedback.Visible = true;
            pnlUserList.Visible = false;
            SetActiveNav(liFeedback);
        }

        protected void lnkUserList_Click(object sender, EventArgs e)
        {
            LoadUserList();
            pnlDashboard.Visible = false;
            pnlFeedback.Visible = false;
            pnlUserList.Visible = true;
            SetActiveNav(liUserList);
        }

        private void ShowDashboard()
        {
            pnlDashboard.Visible = true;
            pnlFeedback.Visible = false;
            pnlUserList.Visible = false;
            SetActiveNav(liDashboard);
        }

        private void SetActiveNav(Control activeControl)
        {
            // Remove active class from all navigation items
            if (liDashboard is HtmlControl)
                ((HtmlControl)liDashboard).Attributes["class"] = "";
            if (liFeedback is HtmlControl)
                ((HtmlControl)liFeedback).Attributes["class"] = "";
            if (liUserList is HtmlControl)
                ((HtmlControl)liUserList).Attributes["class"] = "";

            // Add active class to the selected navigation item
            if (activeControl is HtmlControl)
                ((HtmlControl)activeControl).Attributes["class"] = "active-nav";
        }

        private void LoadDashboardStats()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Get total users count
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users", con))
                    {
                        int totalUsers = (int)cmd.ExecuteScalar();
                        lblDashboardTotalUsers.InnerText = totalUsers.ToString();
                    }

                    // Get total feedback count
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Feedback", con))
                    {
                        int totalFeedback = (int)cmd.ExecuteScalar();
                        lblDashboardTotalFeedback.InnerText = totalFeedback.ToString();
                    }

                    // Get resolved issues count (assuming you have a Status column)
                    // If you don't have this, you can modify or remove this part
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Feedback WHERE Status = 'Resolved'", con))
                    {
                        int resolvedIssues = (int)cmd.ExecuteScalar();
                        lblDashboardResolvedIssues.InnerText = resolvedIssues.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any errors (you might want to log them in a real application)
                System.Diagnostics.Debug.WriteLine("Error loading dashboard stats: " + ex.Message);
            }
        }

        private void LoadFeedbackStats()
        {
            try
            {
                DataTable dt = new DataTable();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT SubmittedAt, Email, Message FROM Feedback";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    da.Fill(dt);
                }

                int total = dt.Rows.Count;

                // Count today's feedbacks
                DateTime todayDate = DateTime.Today;
                int today = 0;

                foreach (DataRow row in dt.Rows)
                {
                    if (DateTime.TryParse(row["SubmittedAt"].ToString(), out DateTime submittedDate))
                    {
                        if (submittedDate.Date == todayDate)
                            today++;
                    }
                }

                // Update stat labels
                totalFeedback.Text = total.ToString();
                todaysFeedback.Text = today.ToString();
                urgentFeedback.Text = "0"; // Urgency column removed, so default to 0

                // Bind feedback data to GridView
                gvFeedback.DataSource = dt;
                gvFeedback.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading feedback stats: " + ex.Message);
            }
        }

        private void LoadUserList()
        {
            try
            {
                DataTable dt = new DataTable();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT PhoneNumber, FullName, Email, UserType, CreatedDate FROM Users";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    da.Fill(dt);
                }

                int totalUsers = dt.Rows.Count;
                int totalFarmers = 0;
                int totalTraders = 0;

                foreach (DataRow row in dt.Rows)
                {
                    if (row["UserType"].ToString() == "Farmer")
                        totalFarmers++;
                    else if (row["UserType"].ToString() == "Trader")
                        totalTraders++;
                }

                // Update stat labels
                lblTotalUsers.Text = totalUsers.ToString();
                lblTotalFarmers.Text = totalFarmers.ToString();
                lblTotalTraders.Text = totalTraders.ToString();

                // Bind user data to GridView
                gvUsers.DataSource = dt;
                gvUsers.DataBind();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading user list: " + ex.Message);
            }
        }
    }
}









