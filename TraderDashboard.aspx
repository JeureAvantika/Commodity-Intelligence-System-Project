

<%--26th may--%>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TraderDashboard.aspx.cs" Inherits="NewCISProject.TraderDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trader Dashboard</title>
  
   <style>
    /* Modern Base Styles */
    body {
        font-family: 'Inter', 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8fafc;
        color: #1e293b;
        line-height: 1.6;
        min-height: 100vh;
    }

    /* Container for centered layout */
    .dashboard-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 2rem;
    }

    /* Header with subtle glass morphism effect */
    .dashboard-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 2.5rem;
        padding: 1.5rem;
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(10px);
        border-radius: 12px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.05);
        border: 1px solid rgba(255, 255, 255, 0.3);
        animation: fadeIn 0.6s ease-out;
    }

    /* Welcome text with gradient animation */
    .welcome {
        font-size: 2rem;
        font-weight: 700;
        background: linear-gradient(90deg, #f59e0b, #f97316, #f59e0b);
        background-size: 200% auto;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        animation: gradientShift 3s linear infinite;
        margin: 0;
    }

    @keyframes gradientShift {
        0% { background-position: 0% center; }
        100% { background-position: 200% center; }
    }

    /* User info styling */
    .user-info {
        display: flex;
        align-items: center;
        gap: 1.5rem;
    }

    #lblPhone {
        font-weight: 500;
        color: #475569;
        background: #f1f5f9;
        padding: 0.5rem 1rem;
        border-radius: 8px;
        font-size: 0.9rem;
    }

    /* Modern button with pulse animation */
    #btnLogout {
        padding: 0.65rem 1.5rem;
        background: linear-gradient(135deg, #ef4444, #dc2626);
        border: none;
        border-radius: 8px;
        color: white;
        cursor: pointer;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 12px rgba(239, 68, 68, 0.2);
        position: relative;
        overflow: hidden;
    }

    #btnLogout:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(239, 68, 68, 0.3);
    }

    #btnLogout:active {
        transform: translateY(0);
    }

    #btnLogout::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(135deg, rgba(255,255,255,0.3), rgba(255,255,255,0));
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    #btnLogout:hover::after {
        opacity: 1;
    }

    /* Section title with animated underline */
    .section-title {
        font-size: 1.5rem;
        margin: 2.5rem 0 1.5rem;
        color: #1e293b;
        font-weight: 700;
        position: relative;
        display: inline-block;
    }

    .section-title::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -6px;
        width: 60px;
        height: 4px;
        background: linear-gradient(90deg, #3b82f6, #6366f1);
        border-radius: 2px;
        transform-origin: left;
        animation: underlineGrow 0.8s cubic-bezier(0.65, 0, 0.35, 1) forwards;
    }

    @keyframes underlineGrow {
        0% { transform: scaleX(0); }
        100% { transform: scaleX(1); }
    }

    /* Modern table design with hover animations */
    #gvCommodities {
        max-width: 1000px;
        border-collapse: separate;
        border-spacing: 0;
        margin: 0 auto;
         padding: 0 30px; /* Space on left and right */
         box-sizing: border-box;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
        background: white;
        border: 1px solid #e2e8f0;
        animation: fadeInUp 0.6s ease-out;
        transform-origin: top;
    }

    #gvCommodities th {
        background: linear-gradient(135deg, #3b82f6, #6366f1);
        color: white;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.5px;
        padding: 1rem 1.25rem;
        text-align: left;
        position: relative;
    }

    #gvCommodities th::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 1px;
        background: rgba(255,255,255,0.2);
    }

    #gvCommodities td {
        padding: 1rem 1.25rem;
        border-bottom: 1px solid #f1f5f9;
        font-size: 0.95rem;
        transition: all 0.3s ease;
    }

    #gvCommodities tr:last-child td {
        border-bottom: none;
    }

    #gvCommodities tr {
        transition: all 0.3s ease;
    }

    #gvCommodities tr:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    }

    #gvCommodities tr:hover td {
        background: #f8fafc;
    }

    /* Farmer link with animated chevron */
    #gvCommodities a {
        color: #3b82f6;
        text-decoration: none;
        font-weight: 600;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        transition: all 0.3s ease;
        position: relative;
    }

    #gvCommodities a::after {
        content: '→';
        display: inline-block;
        transition: transform 0.3s ease;
        opacity: 0.7;
    }

    #gvCommodities a:hover {
        color: #2563eb;
        transform: translateX(4px);
    }

    #gvCommodities a:hover::after {
        transform: translateX(3px);
        opacity: 1;
    }

    /* Enhanced popup with morph animation */
    #farmerPopup {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 85%;
        max-width: 900px;
        background: white;
        border-radius: 16px;
        padding: 2rem;
        z-index: 1000;
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
        overflow-y: auto;
        max-height: 90vh;
        animation: popupMorph 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        border: 1px solid #e2e8f0;
    }

    @keyframes popupMorph {
        0% {
            opacity: 0;
            transform: translate(-50%, -50%) scale(0.9);
        }
        100% {
            opacity: 1;
            transform: translate(-50%, -50%) scale(1);
        }
    }

    #popupFarmerName {
        margin: 0 0 1.5rem;
        color: #1e293b;
        font-size: 1.8rem;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    #popupFarmerName::before {
        content: '';
        display: inline-block;
        width: 24px;
        height: 24px;
        background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="%2310b981"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"/></svg>') no-repeat center;
    }

    #farmerPopup table {
        width: 100%;
        margin: 1.5rem 0;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        border: 1px solid #e2e8f0;
        transform-origin: top;
        animation: tableGrow 0.6s cubic-bezier(0.22, 1, 0.36, 1);
    }

    @keyframes tableGrow {
        0% { transform: scaleY(0.8); opacity: 0; }
        100% { transform: scaleY(1); opacity: 1; }
    }

    #farmerPopup th {
        background: linear-gradient(135deg, #10b981, #34d399);
        padding: 0.85rem 1.25rem;
        font-size: 0.75rem;
    }

    #farmerPopup td {
        padding: 0.85rem 1.25rem;
        font-size: 0.9rem;
    }

    #farmerPopup img {
        max-width: 100px;
        max-height: 100px;
        height: auto;
        border-radius: 8px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        border: 1px solid #e2e8f0;
    }

    #farmerPopup img:hover {
        transform: scale(1.05) rotate(1deg);
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
    }

    #farmerPopup button {
        padding: 0.75rem 1.5rem;
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        border: none;
        border-radius: 8px;
        color: white;
        cursor: pointer;
        font-weight: 600;
        font-size: 0.9rem;
        transition: all 0.3s ease;
        box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);
        margin-top: 1.5rem;
    }

    #farmerPopup button:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 16px rgba(59, 130, 246, 0.3);
    }

    /* Overlay with fade-in effect */
    .popup-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(15, 23, 42, 0.7);
        z-index: 999;
        backdrop-filter: blur(8px);
        animation: fadeIn 0.4s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .dashboard-container {
            padding: 1.5rem;
        }
        
        .dashboard-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 1.5rem;
        }
        
        #farmerPopup {
            width: 90%;
            padding: 1.5rem;
        }
    }

    @media (max-width: 480px) {
        .welcome {
            font-size: 1.6rem;
        }
        
        .section-title {
            font-size: 1.3rem;
        }
        
        #farmerPopup {
            width: 95%;
            padding: 1.25rem;
        }
        
        #farmerPopup img {
            max-width: 80px;
        }
    }

    /*new code for img large view*/
    /* Full image viewer styles */
img {
    transition: transform 0.3s ease;
}

img:hover {
    transform: scale(1.05);
}

/* Animation for full image */
@keyframes zoomIn {
    from { transform: scale(0.8); opacity: 0; }
    to { transform: scale(1); opacity: 1; }
}

/* Animation for overlay */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}
</style>

 
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 class="welcome">Welcome Trader!</h1>
            <p>Phone: <asp:Label ID="lblPhone" runat="server" /></p>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />

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

        <!-- POPUP WINDOW -->
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
                <tbody id="popupDetailsBody">
                    <!-- Details will be inserted here dynamically -->
                </tbody>
            </table>
            <button type="button" onclick="closePopup()">Close</button>
        </div>


        <script type="text/javascript">
            function loadFarmerDetails(phone) {
                fetch('GetFarmerDetails.ashx?phone=' + phone)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Network response was not ok");
                        }
                        return response.json();
                    })
                    .then(data => {
                        console.log("Farmer details:", data);

                        document.getElementById("farmerPopup").style.display = "block";

                        if (data.length > 0) {
                            document.getElementById("popupFarmerName").innerText = data[0].FarmerName || "Farmer Details";
                        } else {
                            document.getElementById("popupFarmerName").innerText = "No data found";
                        }

                        let tbody = document.getElementById("popupDetailsBody");
                        tbody.innerHTML = "";

                        data.forEach(item => {
                            let tr = document.createElement("tr");

                            let tdPhone = document.createElement("td");
                            tdPhone.innerText = item.PhoneNumber || "";
                            tr.appendChild(tdPhone);

                            let tdFruit = document.createElement("td");
                            tdFruit.innerText = item.FruitType || "";
                            tr.appendChild(tdFruit);

                            let tdQty = document.createElement("td");
                            tdQty.innerText = item.Quantity || "";
                            tr.appendChild(tdQty);

                            let tdImg = document.createElement("td");
                            let img = document.createElement("img");

                            // Fix image src path here
                            // Assuming your images are physically inside your project folder 'Uploads' (next to /bin, etc)
                            //img.src = '/Uploads/' + item.ImagePath;
                            img.src = '<%= ResolveUrl("~/Uploads/") %>' + item.ImagePath;
                            img.alt = item.FruitType || "Image";

                            //new code for img large view 
                            img.style.cursor = 'pointer';
                            img.addEventListener('click', function () {
                                showFullImage(this.src);
                            });

                            tdImg.appendChild(img);
                            tr.appendChild(tdImg);

                            let tdFresh = document.createElement("td");
                            tdFresh.innerText = item.Freshness || "";
                            tr.appendChild(tdFresh);

                            let tdDate = document.createElement("td");
                            tdDate.innerText = item.SubmittedAt || "";
                            tr.appendChild(tdDate);

                            tbody.appendChild(tr);
                        });
                    })
                    .catch(error => {
                        console.error("Failed to load farmer details:", error);
                    });
            }
         
            function closePopup() {
                document.getElementById("farmerPopup").style.display = "none";
                document.getElementById("popupFarmerName").innerText = "";
                document.getElementById("popupDetailsBody").innerHTML = "";
            }
        </script>
    </form>
</body>
</html>

--%>




<%--30th may--%>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TraderDashboard.aspx.cs" Inherits="NewCISProject.TraderDashboard" %>

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

        /* Sidebar styles */
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

        /* Main content */
        .main-content {
            flex-grow: 1;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin: 20px;
        }

        /* Table Styling */
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

        /* Popup window */
        #farmerPopup {
            display: none; /* hide by default */
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

        /* Popup overlay */
        #popupOverlay {
            display: none; /* hide by default */
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.4);
            z-index: 999;
        }

        /* Buttons */
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

        /* Popup table styling */
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
            <!-- Simple Sidebar -->
            <div class="sidebar">
                <h2>Trader Panel</h2>
                <ul>
                    <li><a href="#" class="active">Dashboard</a></li>
                    <li><a href="#">Farmers</a></li>
                    <li><a href="#">Commodities</a></li>
                    <li><a href="LoginPage.aspx">Logout</a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <h1 class="welcome">Welcome Trader!</h1>
                <p>Phone: <asp:Label ID="lblPhone" runat="server" /></p>

                <!-- GridView -->
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

        <!-- Popup Overlay -->
        <div id="popupOverlay" onclick="closePopup()"></div>

        <!-- POPUP WINDOW -->
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
                <tbody id="popupDetailsBody">
                    <!-- Details will be inserted here dynamically -->
                </tbody>
            </table>
            <button type="button" onclick="closePopup()">Close</button>
        </div>

        <script type="text/javascript">
            function loadFarmerDetails(phone) {
                fetch('GetFarmerDetails.ashx?phone=' + phone)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Network response was not ok");
                        }
                        return response.json();
                    })
                    .then(data => {
                        console.log("Farmer details:", data);

                        // Show overlay and popup
                        document.getElementById("popupOverlay").style.display = "block";
                        document.getElementById("farmerPopup").style.display = "block";

                        if (data.length > 0) {
                            document.getElementById("popupFarmerName").innerText = data[0].FarmerName || "Farmer Details";
                        } else {
                            document.getElementById("popupFarmerName").innerText = "No data found";
                        }

                        let tbody = document.getElementById("popupDetailsBody");
                        tbody.innerHTML = "";

                        data.forEach(item => {
                            let tr = document.createElement("tr");

                            let tdPhone = document.createElement("td");
                            tdPhone.innerText = item.PhoneNumber || "";
                            tr.appendChild(tdPhone);

                            let tdFruit = document.createElement("td");
                            tdFruit.innerText = item.FruitType || "";
                            tr.appendChild(tdFruit);

                            let tdQty = document.createElement("td");
                            tdQty.innerText = item.Quantity || "";
                            tr.appendChild(tdQty);

                            let tdImg = document.createElement("td");
                            let img = document.createElement("img");
                            var uploadPath = '<%: ResolveUrl("~/Uploads/") %>';
                            img.src = uploadPath + item.ImagePath;

                            img.alt = item.FruitType || "Image";
                            img.style.cursor = 'pointer';
                            img.style.maxWidth = '80px';
                            img.style.height = 'auto';

                            img.addEventListener('click', function () {
                                showFullImage(this.src);
                            });
                            tdImg.appendChild(img);
                            tr.appendChild(tdImg);

                            let tdFresh = document.createElement("td");
                            tdFresh.innerText = item.Freshness || "";
                            tr.appendChild(tdFresh);

                            let tdDate = document.createElement("td");
                            tdDate.innerText = item.SubmittedAt || "";
                            tr.appendChild(tdDate);

                            tbody.appendChild(tr);
                        });
                    })
                    .catch(error => {
                        console.error("Failed to load farmer details:", error);
                    });
            }

            function closePopup() {
                document.getElementById("farmerPopup").style.display = "none";
                document.getElementById("popupOverlay").style.display = "none";
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

--%>



<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TraderDashboard.aspx.cs" Inherits="NewCISProject.TraderDashboard" %>

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

        /* Sidebar styles */
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

        /* Main content */
        .main-content {
            flex-grow: 1;
            padding: 30px;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin: 20px;
        }

        /* Profile Section */
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

        /* Table Styling */
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

        /* Popup window */
        #farmerPopup {
            display: none; /* hide by default */
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

        /* Popup overlay */
        #popupOverlay {
            display: none; /* hide by default */
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(0,0,0,0.4);
            z-index: 999;
        }

        /* Buttons */
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

        /* Popup table styling */
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
            <!-- Simple Sidebar -->
            <div class="sidebar">
                <h2>Trader Panel</h2>
                <ul>
                    <li><a href="#" class="active">Dashboard</a></li>
                    <li><a href="#">Farmers</a></li>
                    <li><a href="#">Commodities</a></li>
                    <li><a href="LoginPage.aspx">Logout</a></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <!-- Profile Section -->
                <div class="profile-section">
                    <div class="profile-header">
                        <h2>My Profile</h2>
                    </div>
                    <div class="profile-info">
                        <div class="profile-item">
                            <span class="profile-label">Full Name</span>
                            <span class="profile-value"><asp:Label ID="lblFullName" runat="server" /></span>
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

                <!-- GridView -->
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

        <!-- Popup Overlay -->
        <div id="popupOverlay" onclick="closePopup()"></div>

        <!-- POPUP WINDOW -->
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
                <tbody id="popupDetailsBody">
                    <!-- Details will be inserted here dynamically -->
                </tbody>
            </table>
            <button type="button" onclick="closePopup()">Close</button>
        </div>

        <script type="text/javascript">
            function loadFarmerDetails(phone) {
                fetch('GetFarmerDetails.ashx?phone=' + phone)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error("Network response was not ok");
                        }
                        return response.json();
                    })
                    .then(data => {
                        console.log("Farmer details:", data);

                        // Show overlay and popup
                        document.getElementById("popupOverlay").style.display = "block";
                        document.getElementById("farmerPopup").style.display = "block";

                        if (data.length > 0) {
                            document.getElementById("popupFarmerName").innerText = data[0].FarmerName || "Farmer Details";
                        } else {
                            document.getElementById("popupFarmerName").innerText = "No data found";
                        }

                        let tbody = document.getElementById("popupDetailsBody");
                        tbody.innerHTML = "";

                        data.forEach(item => {
                            let tr = document.createElement("tr");

                            let tdPhone = document.createElement("td");
                            tdPhone.innerText = item.PhoneNumber || "";
                            tr.appendChild(tdPhone);

                            let tdFruit = document.createElement("td");
                            tdFruit.innerText = item.FruitType || "";
                            tr.appendChild(tdFruit);

                            let tdQty = document.createElement("td");
                            tdQty.innerText = item.Quantity || "";
                            tr.appendChild(tdQty);

                            let tdImg = document.createElement("td");
                            let img = document.createElement("img");
                            var uploadPath = '<%: ResolveUrl("~/Uploads/") %>';
                            img.src = uploadPath + item.ImagePath;

                            img.alt = item.FruitType || "Image";
                            img.style.cursor = 'pointer';
                            img.style.maxWidth = '80px';
                            img.style.height = 'auto';

                            img.addEventListener('click', function () {
                                showFullImage(this.src);
                            });
                            tdImg.appendChild(img);
                            tr.appendChild(tdImg);

                            let tdFresh = document.createElement("td");
                            tdFresh.innerText = item.Freshness || "";
                            tr.appendChild(tdFresh);

                            let tdDate = document.createElement("td");
                            tdDate.innerText = item.SubmittedAt || "";
                            tr.appendChild(tdDate);

                            tbody.appendChild(tr);
                        });
                    })
                    .catch(error => {
                        console.error("Failed to load farmer details:", error);
                    });
            }

            function closePopup() {
                document.getElementById("farmerPopup").style.display = "none";
                document.getElementById("popupOverlay").style.display = "none";
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
</html>--%>