
//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Configuration;
//using System.Web.UI.WebControls;
//using System.Web.UI;

//namespace NewCISProject
//{
//    public partial class TraderDashboard : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["PhoneNumber"] == null || Session["UserType"] == null || Session["UserType"].ToString() != "Trader")
//            {
//                Response.Redirect("LoginPage.aspx");
//            }

//            lblPhone.Text = Session["PhoneNumber"].ToString();

//            if (!IsPostBack)
//            {
//                LoadFarmerCommodities();
//            }
//        }
//        protected void btnLogout_Click(object sender, EventArgs e)
//        {
//            Session.Clear();
//            Response.Redirect("LoginPage.aspx");
//        }


//        protected void gvCommodities_RowCommand(object sender, GridViewCommandEventArgs e)
//        {
//            if (e.CommandName == "SomeCommandName")
//            {
//                // Handle the command, for example:
//                // int index = Convert.ToInt32(e.CommandArgument);
//                // GridViewRow row = gvCommodities.Rows[index];
//                // string phoneNumber = gvCommodities.DataKeys[index].Value.ToString();

//                // Your logic here...
//            }
//        }


//        private void LoadFarmerCommodities()
//        {
//            string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

//            using (SqlConnection conn = new SqlConnection(connStr))
//            {
//                string query = @"
//                    SELECT 
//                        u.FullName AS FarmerName,
//                        u.PhoneNumber,
//                        fd.FruitType,
//                        u.Location
//                    FROM FarmerDashboard fd
//                    INNER JOIN Users u ON fd.PhoneNumber = u.PhoneNumber
//                    WHERE u.UserType = 'Farmer'
//                    GROUP BY u.FullName, u.PhoneNumber, fd.FruitType, u.Location
//                    ORDER BY u.FullName";


//                using (SqlCommand cmd = new SqlCommand(query, conn))
//                {
//                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
//                    DataTable dt = new DataTable();
//                    adapter.Fill(dt);

//                    gvCommodities.DataSource = dt;
//                    gvCommodities.DataBind();
//                }
//            }
//        }

//        // Handles click on farmer's name link
//        protected void lnkFarmer_Click(object sender, EventArgs e)
//        {
//            LinkButton linkButton = sender as LinkButton;

//            // Null checks to prevent crash
//            if (linkButton == null || string.IsNullOrEmpty(linkButton.CommandArgument))
//            {
//                ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('Invalid farmer link clicked.');", true);
//                return;
//            }

//            string phone = linkButton.CommandArgument;

//            // Inject JS to fetch data and show the popup
//            string script = $@"
//                fetch('GetFarmerDetails.ashx?phone={phone}')
//                .then(response => response.json())
//                .then(data => {{
//                    if(data.error) {{
//                        alert('Error: ' + data.error);
//                        return;
//                    }}

//                    document.getElementById('popupFarmerName').innerText = 'Details for Farmer Phone: {phone}';
//                    var tbody = document.getElementById('popupDetailsBody');
//                    tbody.innerHTML = '';

//                    data.forEach(item => {{
//                        var tr = document.createElement('tr');

//                        var tdPhone = document.createElement('td');
//                        tdPhone.textContent = item.PhoneNumber;
//                        tr.appendChild(tdPhone);

//                        var tdFruit = document.createElement('td');
//                        tdFruit.textContent = item.FruitType;
//                        tr.appendChild(tdFruit);

//                        var tdQuantity = document.createElement('td');
//                        tdQuantity.textContent = item.Quantity;
//                        tr.appendChild(tdQuantity);

//                        var tdImage = document.createElement('td');
//                        if(item.ImagePath && item.ImagePath.trim() !== '') {{
//                            var img = document.createElement('img');
//                            img.src = './Uploads/' + item.ImagePath;
//                            img.alt = item.FruitType;
//                            img.style.maxWidth = '80px';
//                            tdImage.appendChild(img);
//                        }} else {{
//                            tdImage.textContent = 'No Image';
//                        }}
//                        tr.appendChild(tdImage);

//                        var tdFreshness = document.createElement('td');
//                        tdFreshness.textContent = item.Freshness;
//                        tr.appendChild(tdFreshness);

//                        var tdDate = document.createElement('td');
//                        tdDate.textContent = item.SubmissionDate;
//                        tr.appendChild(tdDate);

//                        tbody.appendChild(tr);
//                    }});

//                    document.getElementById('farmerPopup').style.display = 'block';
//                }})
//                .catch(err => {{
//                    alert('Failed to load farmer details: ' + err);
//                }});";

//            ScriptManager.RegisterStartupScript(this, GetType(), "ShowPopupScript", script, true);
//        }
//    }
//}




