

//code3
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace NewCISProject
{
    public partial class FarmerDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PhoneNumber"] == null || Session["UserType"] == null || Session["UserType"].ToString() != "Farmer")
            {
                Response.Redirect("LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                lblPhone.Text = Session["PhoneNumber"].ToString();
                lblSubmissionTime.Text = " ";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("HomePage.aspx");
        }

        protected void btnPredictPrice_Click(object sender, EventArgs e)
        {
            try
            {
                string commodity = txtCommodity.Text.Trim().ToLower();
                int month = Convert.ToInt32(txtMonth.Text.Trim());

                string apiUrl = "http://localhost:5001/predict-price";
                var request = (HttpWebRequest)WebRequest.Create(apiUrl);
                request.Method = "POST";
                request.ContentType = "application/json";

                string jsonData = $"{{\"commodity\":\"{commodity}\",\"month\":{month}}}";
                byte[] byteData = Encoding.UTF8.GetBytes(jsonData);
                request.ContentLength = byteData.Length;

                using (Stream dataStream = request.GetRequestStream())
                {
                    dataStream.Write(byteData, 0, byteData.Length);
                }

                using (WebResponse response = request.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                    {
                        string jsonResponse = reader.ReadToEnd();
                        var js = new JavaScriptSerializer();
                        dynamic result = js.Deserialize<dynamic>(jsonResponse);

                        if (result.ContainsKey("predicted_price_inr"))
                        {
                            lblPredictionResult.Text = $"Predicted Price: {result["predicted_price_inr"]}";
                        }
                        else if (result.ContainsKey("error"))
                        {
                            lblPredictionResult.Text = "Prediction failed. " + result["error"];
                        }
                        else
                        {
                            lblPredictionResult.Text = "Unexpected response format from API.";
                        }

                    }
                }
            }
            catch (WebException ex)
            {
                using (var stream = ex.Response?.GetResponseStream())
                using (var reader = new StreamReader(stream ?? Stream.Null))
                {
                    string errorResponse = reader.ReadToEnd();
                    lblPredictionResult.Text = "Error: " + errorResponse;
                }
            }
            catch (Exception ex)
            {
                lblPredictionResult.Text = "Unexpected Error: " + ex.Message;
            }
        }

        protected async void btnSubmitCommodity_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlCommodity.SelectedValue == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a commodity');", true);
                    return;
                }

                if (string.IsNullOrEmpty(txtQuantity.Text) || !decimal.TryParse(txtQuantity.Text, out decimal quantity))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid quantity');", true);
                    return;
                }

                if (!fileCommodityImage.HasFile)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please upload an image');", true);
                    return;
                }

                string folder = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

                string fileName = $"{DateTime.Now:yyyyMMddHHmmss}_{Path.GetFileName(fileCommodityImage.FileName)}";
                string filePath = Path.Combine(folder, fileName);
                fileCommodityImage.SaveAs(filePath);

                string apiUrl = "http://127.0.0.1:5000/predict";
                string freshness = "Unknown";

                using (var client = new HttpClient())
                using (var form = new MultipartFormDataContent())
                {
                    var imageContent = new ByteArrayContent(File.ReadAllBytes(filePath));
                    imageContent.Headers.ContentType = MediaTypeHeaderValue.Parse("image/jpeg");
                    form.Add(imageContent, "file", Path.GetFileName(filePath));

                    HttpResponseMessage response = await client.PostAsync(apiUrl, form);
                    if (response.IsSuccessStatusCode)
                    {
                        freshness = await response.Content.ReadAsStringAsync();
                    }
                    else
                    {
                        throw new Exception("Failed to call Python API: " + response.StatusCode);
                    }
                }

                string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO FarmerDashboard 
                        (PhoneNumber, FruitType, Quantity, ImagePath, FreshnessStatus, SubmissionDateTime) 
                        VALUES (@PhoneNumber, @FruitType, @Quantity, @ImagePath, @FreshnessStatus, @SubmissionDateTime)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@PhoneNumber", Session["PhoneNumber"].ToString());
                        cmd.Parameters.AddWithValue("@FruitType", ddlCommodity.SelectedValue);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);
                        cmd.Parameters.AddWithValue("@ImagePath", "Uploads/" + fileName);
                        cmd.Parameters.AddWithValue("@FreshnessStatus", freshness);
                        cmd.Parameters.AddWithValue("@SubmissionDateTime", DateTime.Now);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblSubmissionTime.Text = $"Last submitted: {DateTime.Now:g}";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Commodity submitted successfully!');", true);

                ddlCommodity.SelectedIndex = 0;
                txtQuantity.Text = "";
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}




































//code2

//using System;
//using System.Configuration;
//using System.Data.SqlClient;
//using System.IO;
//using System.Net.Http;
//using System.Net.Http.Headers;
//using System.Web.Script.Serialization;
//using System.Threading.Tasks;
//using System.Web.UI;
//using System.Net;
//using System.Text;

//namespace NewCISProject
//{
//    public partial class FarmerDashboard : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (Session["PhoneNumber"] == null || Session["UserType"] == null || Session["UserType"].ToString() != "Farmer")
//            {
//                Response.Redirect("LoginPage.aspx");
//            }

//            lblPhone.Text = Session["PhoneNumber"].ToString();

//            if (!IsPostBack)
//            {
//                lblSubmissionTime.Text = "No submissions yet";
//            }
//        }

//        protected void btnLogout_Click(object sender, EventArgs e)
//        {
//            Session.Clear();
//            Response.Redirect("HomePage.aspx");
//        }



//        protected void btnPredictPrice_Click(object sender, EventArgs e)
//        {
//            string commodity = txtCommodity.Text.Trim(); // Assume you have a TextBox with ID txtCommodity
//            int month = Convert.ToInt32(txtMonth.Text.Trim()); // Assume you have a TextBox with ID txtMonth

//            string apiUrl = "http://localhost:5001/predict-price";
//            var request = (HttpWebRequest)WebRequest.Create(apiUrl);
//            request.Method = "POST";
//            request.ContentType = "application/json";

//            string jsonData = $"{{\"commodity\":\"{commodity}\",\"month\":{month}}}";
//            byte[] byteData = Encoding.UTF8.GetBytes(jsonData);
//            request.ContentLength = byteData.Length;

//            using (Stream dataStream = request.GetRequestStream())
//            {
//                dataStream.Write(byteData, 0, byteData.Length);
//            }

//            try
//            {
//                using (WebResponse response = request.GetResponse())
//                {
//                    using (StreamReader reader = new StreamReader(response.GetResponseStream()))
//                    {
//                        string jsonResponse = reader.ReadToEnd();
//                        var js = new JavaScriptSerializer();
//                        dynamic result = js.Deserialize<dynamic>(jsonResponse);

//                        if (result.ContainsKey("predicted_price"))
//                        {
//                            lblPredictionResult.Text = $"Predicted Price: ₹{result["predicted_price"]}";
//                        }
//                        else
//                        {
//                            lblPredictionResult.Text = "Prediction failed. " + result["error"];
//                        }
//                    }
//                }
//            }
//            catch (WebException ex)
//            {
//                using (var stream = ex.Response?.GetResponseStream())
//                using (var reader = new StreamReader(stream ?? Stream.Null))
//                {
//                    string errorResponse = reader.ReadToEnd();
//                    lblPredictionResult.Text = "Error: " + errorResponse;
//                }
//            }
//        }
//        protected async void btnSubmitCommodity_Click(object sender, EventArgs e)
//        {
//            try
//            {
//                // Validate fruit selection
//                if (ddlCommodity.SelectedValue == "")
//                {
//                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a fruit');", true);
//                    return;
//                }

//                // Validate quantity
//                if (string.IsNullOrEmpty(txtQuantity.Text) || !decimal.TryParse(txtQuantity.Text, out decimal quantity))
//                {
//                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid quantity');", true);
//                    return;
//                }

//                // Validate file upload
//                if (!fileCommodityImage.HasFile)
//                {
//                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please upload an image');", true);
//                    return;
//                }

//                // Save file
//                string folder = Server.MapPath("~/Uploads/");
//                if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
//                string fileName = $"{DateTime.Now:yyyyMMddHHmmss}_{fileCommodityImage.FileName}";
//                string filePath = Path.Combine(folder, fileName);
//                fileCommodityImage.SaveAs(filePath);

//                // === Call Flask API for Freshness Prediction ===
//                string apiUrl = "http://127.0.0.1:5000/predict";
//                string output = "Unknown";

//                using (var client = new HttpClient())
//                using (var form = new MultipartFormDataContent())
//                {
//                    var imageContent = new ByteArrayContent(File.ReadAllBytes(filePath));
//                    imageContent.Headers.ContentType = MediaTypeHeaderValue.Parse("image/jpeg");
//                    form.Add(imageContent, "file", Path.GetFileName(filePath));

//                    HttpResponseMessage response = await client.PostAsync(apiUrl, form);
//                    if (response.IsSuccessStatusCode)
//                    {
//                        output = await response.Content.ReadAsStringAsync();
//                    }
//                    else
//                    {
//                        throw new Exception("Failed to call Python API: " + response.StatusCode);
//                    }
//                }

//                // === Save to database ===
//                string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;

//                using (SqlConnection conn = new SqlConnection(connStr))
//                {
//                    string query = @"INSERT INTO FarmerDashboard 
//                        (PhoneNumber, FruitType, Quantity, ImagePath, FreshnessStatus, SubmissionDateTime) 
//                        VALUES (@PhoneNumber, @FruitType, @Quantity, @ImagePath, @FreshnessStatus, @SubmissionDateTime)";

//                    using (SqlCommand cmd = new SqlCommand(query, conn))
//                    {
//                        cmd.Parameters.AddWithValue("@PhoneNumber", Session["PhoneNumber"].ToString());
//                        cmd.Parameters.AddWithValue("@FruitType", ddlCommodity.SelectedValue);
//                        cmd.Parameters.AddWithValue("@Quantity", quantity);
//                        cmd.Parameters.AddWithValue("@ImagePath", "Uploads/" + fileName); // Store relative path
//                        cmd.Parameters.AddWithValue("@FreshnessStatus", output);
//                        cmd.Parameters.AddWithValue("@SubmissionDateTime", DateTime.Now);

//                        conn.Open();
//                        cmd.ExecuteNonQuery();
//                    }
//                }

//                lblSubmissionTime.Text = $"Last submitted: {DateTime.Now:g}";
//                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Commodity submitted successfully!');", true);

//                // Clear form
//                ddlCommodity.SelectedIndex = 0;
//                txtQuantity.Text = "";
//            }
//            catch (Exception ex)
//            {
//                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
//            }
//        }
//    }
//}






//code3



