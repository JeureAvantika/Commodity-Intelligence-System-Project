<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TraderDashboardPage.aspx.cs" Inherits="NewCISProject.TraderDashboardPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trader Dashboard</title>
    <style>
        .profile-section {
            background-color: #f9f9f9;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 10px;
        }

        .popup {
            display: none;
            background-color: white;
            border: 2px solid #ccc;
            padding: 15px;
            position: absolute;
            top: 100px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ccc;
        }

        img {
            max-height: 80px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="profile-section">
            <h3>Trader Profile</h3>
            <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server" /></p>
            <p><strong>Phone:</strong> <asp:Label ID="lblPhone" runat="server" /></p>
            <p><strong>Location:</strong> <asp:Label ID="lblLocation" runat="server" /></p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
        </div>

        <h4>Farmer Commodities</h4>
        <asp:GridView ID="gvCommodities" runat="server" AutoGenerateColumns="True" CssClass="table" OnRowCommand="gvCommodities_RowCommand"></asp:GridView>

        <!-- Optional: Traders List (Uncomment if needed)
        <h4>All Traders</h4>
        <asp:GridView ID="gvTraders" runat="server" AutoGenerateColumns="True" CssClass="table"></asp:GridView>
        -->

        <div id="farmerPopup" class="popup">
            <h4 id="popupFarmerName"></h4>
            <table>
                <thead>
                    <tr>
                        <th>Phone</th>
                        <th>Fruit</th>
                        <th>Quantity</th>
                        <th>Image</th>
                        <th>Freshness</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody id="popupDetailsBody"></tbody>
            </table>
        </div>
    </form>
</body>
</html>--%>



<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TraderDashboardPage.aspx.cs" Inherits="NewCISProject.TraderDashboardPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trader Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            color: #333;
        }

        .dashboard-container {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 220px;
            background-color: #2c3e50;
            color: white;
            padding: 20px;
        }

        .sidebar h2 {
            margin-top: 0;
            font-size: 22px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 15px 0;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            font-weight: 600;
        }

        .main-content {
            flex-grow: 1;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin: 20px;
        }

        .profile-section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }

        .profile-header h2 {
            margin: 0;
            color: #2c3e50;
        }

        .profile-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }

        .profile-item {
            margin-bottom: 10px;
        }

        .profile-label {
            font-weight: 600;
            color: #7f8c8d;
            display: block;
            margin-bottom: 5px;
        }

        .profile-value {
            font-size: 16px;
            color: #2c3e50;
        }

        #gvCommodities {
            width: 100% !important;
            border-collapse: collapse !important;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        #gvCommodities th, #gvCommodities td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
            font-size: 14px;
        }

        #gvCommodities th {
            background-color: #2c3e50;
            color: white;
            font-weight: 600;
        }

        #gvCommodities tr:nth-child(even) {
            background-color: #f4f6f8;
        }

        #gvCommodities tr:hover {
            background-color: #d1e7fd;
        }

        #farmerPopup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            max-width: 90%;
            max-height: 80vh;
            overflow-y: auto;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
            border-radius: 8px;
            z-index: 1000;
        }

        #popupOverlay {
            display: none;
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.4);
            z-index: 999;
        }

        .btn-logout {
            background-color: #e74c3c;
            border: none;
            color: white;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .btn-logout:hover {
            background-color: #c0392b;
        }

        #farmerPopup table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        #farmerPopup th, #farmerPopup td {
            border: 1px solid #ccc;
            padding: 8px 12px;
            text-align: left;
            font-size: 14px;
        }

        #farmerPopup th {
            background-color: #2c3e50;
            color: white;
            font-weight: 600;
        }

        #farmerPopup img {
            max-width: 80px;
            height: auto;
            cursor: pointer;
            border-radius: 4px;
        }

        #farmerPopup button {
            margin-top: 15px;
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
        }

        #farmerPopup button:hover {
            background-color: #1a2733;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="dashboard-container">
            <div class="sidebar">
                <h2>Trader Panel</h2>
                <ul>
                    <li><a href="#" class="active">Dashboard</a></li>
                    
                    <li><a href="LoginPage.aspx">Logout</a></li>
                </ul>
            </div>

            <div class="main-content">
                <div class="profile-section">
                    <div class="profile-header">
                        <h2>My Profile</h2>
                    </div>
                    <div class="profile-info">
                        <div class="profile-item">
                            <span class="profile-label">Full Name</span>
                            <span class="profile-value"><asp:Label ID="lblName" runat="server" /></span>
                        </div>
                        <div class="profile-item">
                            <span class="profile-label">Phone Number</span>
                            <span class="profile-value"><asp:Label ID="lblPhone" runat="server" /></span>
                        </div>
                        <div class="profile-item">
                            <span class="profile-label">Email</span>
                            <span class="profile-value"><asp:Label ID="lblEmail" runat="server" /></span>
                        </div>
                        <div class="profile-item">
                            <span class="profile-label">User Type</span>
                            <span class="profile-value"><asp:Label ID="lblUserType" runat="server" /></span>
                        </div>
                        <div class="profile-item">
                            <span class="profile-label">Location</span>
                            <span class="profile-value"><asp:Label ID="lblLocation" runat="server" /></span>
                        </div>
                        <div class="profile-item">
                            <span class="profile-label">Member Since</span>
                            <span class="profile-value"><asp:Label ID="lblCreatedDate" runat="server" /></span>
                        </div>
                    </div>
                </div>

                <h2 class="section-title">List of Farmers and Their Commodities</h2>
                <asp:GridView ID="gvCommodities" runat="server" AutoGenerateColumns="False" GridLines="Both">
                    <Columns>
                        <asp:TemplateField HeaderText="Farmer Name">
                            <ItemTemplate>
                                <asp:LinkButton 
                                    ID="lnkFarmer" 
                                    runat="server" 
                                    Text='<%# Eval("FarmerName") %>' 
                                    CommandArgument='<%# Eval("PhoneNumber") %>'
                                    OnClick="lnkFarmer_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="FruitType" HeaderText="Commodity" />
                        <asp:BoundField DataField="Location" HeaderText="Location" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div id="popupOverlay" onclick="closePopup()"></div>

        <div id="farmerPopup">
            <h2 id="popupFarmerName"></h2>
            <table>
                <thead>
                    <tr>
                        <th>Farmer Phone</th>
                        <th>Fruit</th>
                        <th>Quantity</th>
                        <th>Image</th>
                        <th>Freshness</th>
                        <th>Submitted At</th>
                    </tr>
                </thead>
                <tbody id="popupDetailsBody"></tbody>
            </table>
            <button type="button" onclick="closePopup()">Close</button>
        </div>

        <script type="text/javascript">
            function loadFarmerDetails(phone) {
                fetch('GetFarmerDetails.ashx?phone=' + phone)
                    .then(response => {
                        if (!response.ok) throw new Error("Network error");
                        return response.json();
                    })
                    .then(data => {
                        document.getElementById("popupOverlay").style.display = "block";
                        document.getElementById("farmerPopup").style.display = "block";

                        document.getElementById("popupFarmerName").innerText = data.length > 0 ? data[0].FarmerName : "No data found";

                        let tbody = document.getElementById("popupDetailsBody");
                        tbody.innerHTML = "";

                        data.forEach(item => {
                            let tr = document.createElement("tr");
                            tr.innerHTML = `
                                <td>${item.PhoneNumber}</td>
                                <td>${item.FruitType}</td>
                                <td>${item.Quantity}</td>
                                <td><img src='<%: ResolveUrl("~/Uploads/") %>${item.ImagePath}' alt='${item.FruitType}' onclick='showFullImage(this.src)' /></td>
                                <td>${item.Freshness}</td>
                                <td>${item.SubmittedAt}</td>
                            `;
                            tbody.appendChild(tr);
                        });
                    })
                    .catch(error => console.error("Error loading farmer details:", error));
            }

            function closePopup() {
                document.getElementById("popupOverlay").style.display = "none";
                document.getElementById("farmerPopup").style.display = "none";
                document.getElementById("popupFarmerName").innerText = "";
                document.getElementById("popupDetailsBody").innerHTML = "";
            }

            function showFullImage(src) {
                let win = window.open("");
                win.document.write("<img src='" + src + "' style='width:100%' />");
            }
        </script>
    </form>
</body>
</html>
