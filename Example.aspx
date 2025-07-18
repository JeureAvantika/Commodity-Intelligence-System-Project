
<%--<%@ Page Language="C#" AutoEventWireup="true" Async="true" CodeBehind="FarmerDashboard.aspx.cs" Inherits="NewCISProject.Example" %>

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
    /*header css*/
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
        0% {
            opacity: 0;
            transform: translateX(-50px);
        }
        100% {
            opacity: 1;
            transform: translateX(0);
        }
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

    .btn {
        background-color: #43a047;
        color: white;
        border: none;
        padding: 12px 24px;
        font-size: 16px;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s ease;
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
                    <asp:DropDownList ID="ddlFruits" runat="server" CssClass="form-control">
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

            <!-- Right Section: Display Area -->
            <div class="right-section">
                <h2>Your Recent Submissions</h2>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="form-control">
                    <Columns>
                        <asp:BoundField DataField="FruitType" HeaderText="Fruit Type" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity (kg)" />
                        <asp:BoundField DataField="SubmissionDate" HeaderText="Date" DataFormatString="{0:g}" />
                        <asp:ImageField DataImageUrlField="ImagePath" HeaderText="Image" ControlStyle-Width="50px" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
--%>
