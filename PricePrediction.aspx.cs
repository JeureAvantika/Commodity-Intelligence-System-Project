//using System;
//using System.Diagnostics;
//using System.IO;

//namespace NewCISProject
//{
//    public partial class PricePrediction1 : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//        }

//        protected void PredictButton_Click(object sender, EventArgs e)
//        {
//            string commodity = CommodityTextBox.Text.Trim();
//            string month = MonthTextBox.Text.Trim();

//            string inputJson = $"{{\"commodity\": \"{commodity}\", \"month\": {month}}}";

//            // Paths
//            string scriptDirectory = @"C:\Users\harsh\source\repos\NewCISProject\NewCISProject";
//            string pythonExe = @"C:\Users\harsh\AppData\Local\Programs\Python\Python310\python.exe";
//            string scriptPath = Path.Combine(scriptDirectory, "PricePrediction.py");
//            string inputJsonPath = Path.Combine(scriptDirectory, "input.json");

//            // Write the input JSON to file
//            File.WriteAllText(inputJsonPath, inputJson);

//            // Setup Python process
//            ProcessStartInfo psi = new ProcessStartInfo();
//            psi.FileName = pythonExe;
//            //psi.Arguments = $"\"{scriptPath}\""; // No input JSON argument needed
//            psi.Arguments = $"\"{scriptPath}\" \"{inputJson}\"";

//            psi.WorkingDirectory = scriptDirectory;
//            psi.UseShellExecute = false;
//            psi.RedirectStandardOutput = true;
//            psi.RedirectStandardError = true;
//            psi.CreateNoWindow = true;

//            try
//            {
//                using (Process process = Process.Start(psi))
//                {
//                    string output = process.StandardOutput.ReadToEnd();
//                    string error = process.StandardError.ReadToEnd();
//                    process.WaitForExit();

//                    if (!string.IsNullOrWhiteSpace(error))
//                    {
//                        ResultLabel.Text = $"Error from Python: {error}";
//                    }
//                    else
//                    {
//                        ResultLabel.Text = $"Predicted Farm Price: ₹{output.Trim()}";
//                    }
//                }
//            }
//            catch (Exception ex)
//            {
//                ResultLabel.Text = $"Execution error: {ex.Message}";
//            }
//        }
//    }
//}





using System;
using System.Diagnostics;
using System.IO;

namespace NewCISProject
{
    public partial class PricePrediction1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void PredictButton_Click(object sender, EventArgs e)
        {
            // Get input values
            string commodity = CommodityTextBox.Text.Trim();
            string month = MonthTextBox.Text.Trim();

            if (string.IsNullOrEmpty(commodity) || string.IsNullOrEmpty(month))
            {
                ResultLabel.Text = "Please enter both commodity and month.";
                return;
            }

            // Prepare JSON input
            string inputJson = $"{{\"commodity\": \"{commodity}\", \"month\": {month}}}";

            // Define paths
            string scriptDirectory = @"C:\Users\harsh\source\repos\NewCISProject\NewCISProject";
            string pythonExe = @"C:\Users\harsh\AppData\Local\Programs\Python\Python310\python.exe";
            string scriptPath = Path.Combine(scriptDirectory, "PricePrediction.py");
            string inputJsonPath = Path.Combine(scriptDirectory, "input.json");

            try
            {
                // Write input to input.json
                File.WriteAllText(inputJsonPath, inputJson);

                // Configure the Python process
                ProcessStartInfo psi = new ProcessStartInfo
                {
                    FileName = pythonExe,
                    Arguments = $"\"{scriptPath}\"",
                    WorkingDirectory = scriptDirectory,
                    UseShellExecute = false,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    CreateNoWindow = true
                };

                using (Process process = Process.Start(psi))
                {
                    string output = process.StandardOutput.ReadToEnd();
                    string error = process.StandardError.ReadToEnd();
                    process.WaitForExit();

                    if (!string.IsNullOrWhiteSpace(error))
                    {
                        ResultLabel.Text = $"Error from Python: {error}";
                    }
                    else
                    {
                        ResultLabel.Text = $"Predicted Farm Price: ₹{output.Trim()}";
                    }
                }
            }
            catch (Exception ex)
            {
                ResultLabel.Text = $"Execution error: {ex.Message}";
            }
        }
    }
}

