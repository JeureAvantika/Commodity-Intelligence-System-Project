//using System;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.Data;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace NewCISProject
//{
//    public partial class TraderDashboardPage : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}

using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace NewCISProject
{
    public partial class TraderDashboardPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PhoneNumber"] == null || Session["UserType"] == null || Session["UserType"].ToString() != "Trader")
            {
                Response.Redirect("LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                LoadTraderProfile();
                LoadFarmerCommodities();
                // LoadAllTraders(); // Optional
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        private void LoadTraderProfile()
        {
            string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT FullName, PhoneNumber, Location, Email FROM Users WHERE PhoneNumber = @Phone AND UserType = 'Trader'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Phone", Session["PhoneNumber"].ToString());
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblName.Text = reader["FullName"].ToString();
                            lblPhone.Text = reader["PhoneNumber"].ToString();
                            lblLocation.Text = reader["Location"].ToString();
                            lblEmail.Text= reader["Email"].ToString();
                        }
                    }
                }
            }
        }

        private void LoadFarmerCommodities()
        {
            string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT 
                        u.FullName AS FarmerName,
                        u.PhoneNumber,
                        fd.FruitType,
                        u.Location
                    FROM FarmerDashboard fd
                    INNER JOIN Users u ON fd.PhoneNumber = u.PhoneNumber
                    WHERE u.UserType = 'Farmer'
                    GROUP BY u.FullName, u.PhoneNumber, fd.FruitType, u.Location
                    ORDER BY u.FullName";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    gvCommodities.DataSource = dt;
                    gvCommodities.DataBind();
                }
            }
        }

        // Optional: Load all traders into GridView
        private void LoadAllTraders()
        {
            string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT FullName, PhoneNumber, Location FROM Users WHERE UserType = 'Trader'";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    gvCommodities.DataSource = dt;
                    gvCommodities.DataBind();
                }
            }
        }

        protected void gvCommodities_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // Handle row command if needed
        }

        protected void lnkFarmer_Click(object sender, EventArgs e)
        {
            LinkButton linkButton = sender as LinkButton;

            if (linkButton == null || string.IsNullOrEmpty(linkButton.CommandArgument))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('Invalid farmer link clicked.');", true);
                return;
            }

            string phone = linkButton.CommandArgument;

            string script = $@"
                fetch('GetFarmerDetails.ashx?phone={phone}')
                .then(response => response.json())
                .then(data => {{
                    if(data.error) {{
                        alert('Error: ' + data.error);
                        return;
                    }}

                    document.getElementById('popupFarmerName').innerText = 'Details for Farmer Phone: {phone}';
                    var tbody = document.getElementById('popupDetailsBody');
                    tbody.innerHTML = '';

                    data.forEach(item => {{
                        var tr = document.createElement('tr');

                        var tdPhone = document.createElement('td');
                        tdPhone.textContent = item.PhoneNumber;
                        tr.appendChild(tdPhone);

                        var tdFruit = document.createElement('td');
                        tdFruit.textContent = item.FruitType;
                        tr.appendChild(tdFruit);

                        var tdQuantity = document.createElement('td');
                        tdQuantity.textContent = item.Quantity;
                        tr.appendChild(tdQuantity);

                        var tdImage = document.createElement('td');
                        if(item.ImagePath && item.ImagePath.trim() !== '') {{
                            var img = document.createElement('img');
                            img.src = './Uploads/' + item.ImagePath;
                            img.alt = item.FruitType;
                            img.style.maxWidth = '80px';
                            tdImage.appendChild(img);
                        }} else {{
                            tdImage.textContent = 'No Image';
                        }}
                        tr.appendChild(tdImage);

                        var tdFreshness = document.createElement('td');
                        tdFreshness.textContent = item.Freshness;
                        tr.appendChild(tdFreshness);

                        var tdDate = document.createElement('td');
                        tdDate.textContent = item.SubmissionDate;
                        tr.appendChild(tdDate);

                        tbody.appendChild(tr);
                    }});

                    document.getElementById('farmerPopup').style.display = 'block';
                }})
                .catch(err => {{
                    alert('Failed to load farmer details: ' + err);
                }});";

            ScriptManager.RegisterStartupScript(this, GetType(), "ShowPopupScript", script, true);
        }
    }
}
