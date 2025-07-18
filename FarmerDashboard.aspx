


<%--code3--%>
<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="FarmerDashboard.aspx.cs" Inherits="NewCISProject.FarmerDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Farmer Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Raleway', sans-serif;
            background: linear-gradient(to bottom right, #e0f7fa, #e8f5e9);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-family: 'Playfair Display', serif;
            color: #2e7d32;
            text-align: center;
            margin-bottom: 30px;
        }

        label.form-label {
            font-weight: 600;
            color: #388e3c;
        }

        .form-control, .form-select {
            border-radius: 10px;
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 16px;
            width: 100%;
        }

        .form-control:focus, .form-select:focus {
            border-color: #66bb6a;
            outline: none;
            box-shadow: 0 0 5px rgba(102, 187, 106, 0.4);
        }

        .card {
            background: #f9fbe7;
            border-left: 6px solid #aed581;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            flex: 1;
            min-width: 300px;
        }

        .btn {
            padding: 10px 20px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background-color: #42a5f5;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #1e88e5;
        }

        .btn-success {
            background-color: #66bb6a;
            color: #fff;
            border: none;
        }

        .btn-success:hover {
            background-color: #43a047;
        }

        .btn-danger {
            background-color: #ef5350;
            color: #fff;
            border: none;
        }

        .btn-danger:hover {
            background-color: #e53935;
        }

        .text-success {
            color: #2e7d32 !important;
        }

        .fw-bold {
            font-weight: 700 !important;
        }

        .text-muted {
            color: #6c757d !important;
        }

        .mb-2, .mb-3, .mb-4, .mt-2, .mt-3 {
            margin-bottom: 1rem !important;
        }

        .mt-4 {
            margin-top: 1.5rem !important;
        }

        .p-3 {
            padding: 1rem !important;
        }

        .shadow {
            box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15) !important;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .cards-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        @media (max-width: 768px) {
            .cards-container {
                flex-direction: column;
            }
        }
    </style>

</head>
<body>
    <form id="form2" runat="server">
        <div class="container mt-4">
            <h2 class="text-success mb-3">Welcome, Farmer</h2>

            <!-- Display Phone Number -->
            <div class="mb-2">
                <label class="form-label">Logged in as:</label>
                <asp:Label ID="lblPhone" runat="server" CssClass="form-label fw-bold"></asp:Label>
            </div>

            <!-- Display Last Submission Time -->
            <div class="mb-3">
                <asp:Label ID="lblSubmissionTime" runat="server" CssClass="form-label text-muted"></asp:Label>
            </div>

            <!-- Logout Button -->
            <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-danger mb-4" Text="Logout" OnClick="btnLogout_Click" />

            <!-- Horizontal Sections Container -->
            <div class="cards-container">
                
                <!-- Section: Submit Commodity -->
                <div class="card p-3 shadow">
                    <h4>Submit Commodity for Sale</h4>
                    <div class="mb-3">
                        <label class="form-label">Select Commodity</label>
                            <asp:DropDownList ID="ddlCommodity" runat="server" CssClass="form-select">
                                <asp:ListItem Text="-- Select Commodity --" Value="" />
                                <asp:ListItem Text="Apple" Value="apple" />
                                <asp:ListItem Text="Banana" Value="banana" />
                                <asp:ListItem Text="Capsicum" Value="capsicum" />
                                <asp:ListItem Text="Potatoes" Value="potatoes" />
                                <asp:ListItem Text="Onion" Value="onion" />
                            </asp:DropDownList>
                            <%--  <asp:ListItem Text="Mango" Value="Mango" />--%>
                            <%--    <asp:ListItem Text="Broccoli Crowns" Value="broccoli crowns" />--%>
                            <%--    <asp:ListItem Text="Cantaloupe" Value="cantaloupe" />--%>
                               <%-- <asp:ListItem Text="Carrots" Value="carrots" />
                                <asp:ListItem Text="Cabbage" Value="cabbage" />
                                <asp:ListItem Text="Spinach" Value="spinach" />
                                <asp:ListItem Text="Chilli" Value="chilli" />--%>
                            <%--    <asp:ListItem Text="Green Leaf Lettuce" Value="green leaf lettuce" />--%>
<%--                                <asp:ListItem Text="Lemon" Value="lemon" />--%>
                                <%--<asp:ListItem Text="Garlic" Value="garlic" />--%>
                            <%--    <asp:ListItem Text="Oranges" Value="oranges" />--%>
                               <%-- <asp:ListItem Text="LadyFinger" Value="ladyfinger" />
                                <asp:ListItem Text="Beetroot" Value="beetroot" />--%>
                                
<%--                                <asp:ListItem Text="Watermelon" Value="watermelon" />--%>
                                
                            <%--    <asp:ListItem Text="Strawberries" Value="strawberries" />--%>
                              <%--  <asp:ListItem Text="Cucumber" Value="cucumber" />
                                <asp:ListItem Text="Tomatoes" Value="tomatoes" />--%>
                      

                    </div>

                    <div class="mb-3">
                        <label class="form-label">Quantity (in kg)</label>
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TextMode="Number" placeholder="e.g. 100"></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Upload Image</label>
                        <asp:FileUpload ID="fileCommodityImage" runat="server" CssClass="form-control" />
                    </div>

                    <asp:Button ID="btnSubmitCommodity" runat="server" Text="Submit Commodity" CssClass="btn btn-success" OnClick="btnSubmitCommodity_Click" />
                </div>
                <!-- Section: Price Prediction -->
                <div class="card p-3 shadow">
                    <h4>Predict Commodity Price</h4>
                    <div class="mb-2">
                        <label class="form-label">Commodity</label>
                        <asp:TextBox ID="txtCommodity" runat="server" CssClass="form-control" placeholder="e.g. Apple"></asp:TextBox>
                    </div>
                    <div class="mb-2">
                        <label class="form-label">Month (1-12)</label>
                        <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" placeholder="Enter month" TextMode="Number"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnPredictPrice" runat="server" Text="Predict Price" CssClass="btn btn-primary mt-2" OnClick="btnPredictPrice_Click" />
                    <div class="mt-3">
                        <asp:Label ID="lblPredictionResult" runat="server" CssClass="text-success fw-bold"></asp:Label>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>



























<%--code2--%>

<%--<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="FarmerDashboard.aspx.cs" Inherits="NewCISProject.FarmerDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Raleway:wght@400;600&display=swap" rel="stylesheet">
    <title>Farmer Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@400;600&family=Rubik:wght@400;700&display=swap');

        body {
            font-family: 'Rubik', sans-serif;
            background: linear-gradient(to bottom right, #e0f7fa, #e8f5e9);
            margin: 0;
            padding: 0;
        }

        .header {
            height: 80px;
            background-color: #4CAF50;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header .left h1 {
            margin: 0;
            font-size: 24px;
        }

        .header .right {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .btn {
            background-color: white;
            color: #4CAF50;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            font-weight: bold;
            border-radius: 5px;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 40px;
            padding: 60px 20px;
            background: #f5fbef;
            border-top: 5px solid #cddc39;
            flex-wrap: wrap;
        }

        @keyframes slideInLeft {
            0% { opacity: 0; transform: translateX(-50px); }
            100% { opacity: 1; transform: translateX(0); }
        }

        .left-section {
            flex: 1.5;
            background: #ffffff;
            border-radius: 25px;
            box-shadow: 0 14px 28px rgba(76, 175, 80, 0.25);
            padding: 40px;
            max-width: 600px;
            animation: slideInLeft 1s ease-out;
            border-left: 10px solid #43a047;
            transform: scale(1.02);
            transition: transform 0.3s ease;
        }

        .right-section {
            flex: 1;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 22px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 500px;
            animation: slideInLeft 1.2s ease-out;
            border-left: 6px solid #aed581;
            opacity: 0.95;
        }

        .left-section h2, .right-section h2 {
            font-family: 'Raleway', sans-serif;
            color: #2e7d32;
            margin-bottom: 25px;
            font-size: 28px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #388e3c;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            transition: 0.3s ease;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #66bb6a;
            outline: none;
            box-shadow: 0 0 5px rgba(102, 187, 106, 0.4);
        }

        .btn:hover {
            background-color: #2e7d32;
        }

        .timestamp {
            margin-top: 15px;
            font-style: italic;
            color: #666;
            text-align: center;
            animation: fadeIn 2s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .predict-btn {
            background-color: #ff9800;
            color: white;
            margin-top: 20px;
            width: 100%;
        }

        .predict-btn:hover {
            background-color: #f57c00;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: auto;
            padding: 30px;
            border: 1px solid #888;
            width: 400px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 24px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        #predictionResult {
            margin-top: 15px;
            font-weight: bold;
            color: #2e7d32;
        }
    </style>
</head>

<body>
    <form id="form2" runat="server">
        <div class="header">
            <div class="left">
                <h1>Welcome Farmer!</h1>
            </div>
            <div class="right">
                <p>Phone: <asp:Label ID="lblPhone" runat="server" /></p>
                <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn" />
            </div>
        </div>

        <div class="container">
            <!-- Left Section: Commodity Submission Form -->
            <div class="left-section">
                <h2>Add New Commodity</h2>
                <div class="form-group">
                    <label>Select Fruit:</label>
                    <asp:DropDownList ID="ddlCommodity" runat="server" CssClass="form-control">
                        <asp:ListItem Text="-- Select Fruit --" Value="" />
                        <asp:ListItem Text="Apple" Value="Apple" />
                        <asp:ListItem Text="Banana" Value="Banana" />
                        <asp:ListItem Text="Orange" Value="Orange" />
                        <asp:ListItem Text="Mango" Value="Mango" />
                        <asp:ListItem Text="Grapes" Value="Grapes" />
                        <asp:ListItem Text="Pineapple" Value="Pineapple" />
                        <asp:ListItem Text="Strawberry" Value="Strawberry" />
                        <asp:ListItem Text="Watermelon" Value="Watermelon" />
                        <asp:ListItem Text="Papaya" Value="Papaya" />
                        <asp:ListItem Text="Guava" Value="Guava" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Quantity (kg):</label>
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Upload Image:</label>
                    <asp:FileUpload ID="fileCommodityImage" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="Button2" runat="server" Text="Submit Commodity"
                    CssClass="btn" OnClick="btnSubmitCommodity_Click" />

                <div class="timestamp">
                    <asp:Label ID="lblSubmissionTime" runat="server" Text=""></asp:Label>
                </div>
            </div>

            <!-- Right Section -->
            <div class="right-section">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="form-control">
                    <Columns>
                        <asp:BoundField DataField="FruitType" HeaderText="Fruit Type" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity (kg)" />
                        <asp:BoundField DataField="SubmissionDate" HeaderText="Date" DataFormatString="{0:g}" />
                        <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Image" ControlStyle-Width="50px" />
                    </Columns>
                </asp:GridView>

                <!-- Predict Price Button -->
                <asp:Button ID="btnPredictPrice" runat="server" Text="Wanna predict your crop price?"
                    CssClass="btn predict-btn" OnClientClick="openModal(); return false;" />
            </div>
        </div>

        <!-- Modal Popup for Prediction -->
        <div id="priceModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Predict Crop Price</h2>
                <label>Commodity Name:</label>
                <asp:TextBox ID="txtCommodity" runat="server" CssClass="form-control" placeholder="e.g. Apple"></asp:TextBox>
                
                
                <label>Month (1-12):</label>
                    <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" placeholder="e.g. 5" TextMode="Number"></asp:TextBox>

                    <asp:Button ID="btnRunPrediction" runat="server" Text="Predict" CssClass="btn" OnClick="btnPredictPrice_Click" />

                    <asp:Label ID="lblPredictionResult" runat="server" CssClass="form-control" >Result </asp:Label>
  
            </div>
        </div>

        <script>
            function openModal() {
                document.getElementById("priceModal").style.display = "block";
            }

            function closeModal() {
                document.getElementById("priceModal").style.display = "none";
            }

            async function predictPrice() {
                const commodity = document.getElementById("txtCommodity").value;
                const month = parseInt(document.getElementById("txtMonth").value);

                const response = await fetch("http://localhost:5001/predict-price", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({ commodity, month })
                });

                const result = await response.json();
                const display = document.getElementById("predictionResult");

                if (response.ok) {
                    display.innerText = `Predicted Price: ₹${result.predicted_price}`;
                } else {
                    display.innerText = `Error: ${result.error}`;
                }
            }
        </script>
    </form>
</body>
</html>

--%>



