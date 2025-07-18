using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class GetFarmerDetails : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";
        string phone = context.Request.QueryString["phone"];

        if (string.IsNullOrEmpty(phone))
        {
            context.Response.Write("{\"error\": \"Phone number is required\"}");
            return;
        }

        string connStr = ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString;
        List<Dictionary<string, object>> farmerData = new List<Dictionary<string, object>>();

        try
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT PhoneNumber, FruitType, Quantity, ImagePath, FreshnessStatus, SubmissionDate 
                                 FROM FarmerDashboard 
                                 WHERE PhoneNumber = @PhoneNumber 
                                 ORDER BY SubmissionDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@PhoneNumber", phone);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var row = new Dictionary<string, object>
                            {
                                { "PhoneNumber", reader["PhoneNumber"].ToString() },
                                { "FruitType", reader["FruitType"].ToString() },
                                { "Quantity", reader["Quantity"].ToString() },
                                { "ImagePath", reader["ImagePath"].ToString() },
                                { "Freshness", reader["FreshnessStatus"].ToString() },
                                { "SubmissionDate", Convert.ToDateTime(reader["SubmissionDate"]).ToString("yyyy-MM-dd HH:mm:ss") }
                            };
                            farmerData.Add(row);
                        }
                    }
                }
            }

            var serializer = new JavaScriptSerializer();
            string json = serializer.Serialize(farmerData);
            context.Response.Write(json);
        }
        catch (Exception ex)
        {
            context.Response.Write("{\"error\": \"" + ex.Message.Replace("\"", "'") + "\"}");
        }
    }

    public bool IsReusable => false;
}
