<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PricePrediction.aspx.cs" Inherits="NewCISProject.PricePrediction1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Price Prediction</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding:20px">
            <h2>Commodity Price Prediction</h2>

            <asp:Label ID="Label1" runat="server" Text="Commodity: " />
            <asp:TextBox ID="CommodityTextBox" runat="server" /><br /><br />

            <asp:Label ID="Label2" runat="server" Text="Month (1-12): " />
            <asp:TextBox ID="MonthTextBox" runat="server" /><br /><br />

            <asp:Button ID="PredictButton" runat="server" Text="Predict Price" OnClick="PredictButton_Click" /><br /><br />

            <asp:Label ID="ResultLabel" runat="server" Font-Bold="true" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
