



<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="NewCISProject.Example" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FarmConnect - Farmer Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        :root {
            --primary-green: #4CAF50;
            --dark-green: #3e8e41;
            --light-green: #e8f5e9;
            --earth-brown: #8D6E63;
            --sun-yellow: #FFC107;
            --error-red: #e74c3c;
        }

        body {
            font-family: 'Open Sans', sans-serif;
            background: url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 600px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            border: 2px solid var(--primary-green);
            margin: 20px;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary-green), var(--sun-yellow), var(--earth-brown));
        }

        h2 {
            color: var(--primary-green);
            font-family: 'Roboto', sans-serif;
            font-weight: 700;
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
            position: relative;
            padding-bottom: 10px;
        }

        h2::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-green), var(--sun-yellow));
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--earth-brown);
            font-size: 14px;
        }

        .form-group input, 
        .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }

        .form-group input:focus, 
        .form-group select:focus {
            border-color: var(--primary-green);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
            outline: none;
            background-color: white;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background-color: var(--primary-green);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
        }

        .btn:hover {
            background-color: var(--dark-green);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        #btnTestConnection {
            background-color: var(--earth-brown);
        }

        #btnTestConnection:hover {
            background-color: #7b5c4b;
        }

        .error {
            color: var(--error-red);
            font-size: 13px;
            margin-top: 5px;
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Farmer-themed decorations */
        .farm-icon {
            text-align: center;
            margin-bottom: 15px;
            color: var(--primary-green);
            font-size: 40px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                margin: 15px;
                padding: 20px;
            }
            
            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="farm-icon">
                <i class="fas fa-tractor"></i>
            </div>
            <h2>Join FarmConnect</h2>
            
            <div class="form-group">
                <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="txtName" runat="server" required="true" placeholder="Enter your full name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                    ErrorMessage="Name is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" required="true" placeholder="Enter 10-digit phone number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                    ErrorMessage="Phone number is required" CssClass="error"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" 
                    ErrorMessage="Enter a valid 10-digit phone number" ValidationExpression="^[0-9]{10}$" 
                    CssClass="error"></asp:RegularExpressionValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email (optional)"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your email (optional)"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblUserType" runat="server" Text="I am a"></asp:Label>
                <asp:DropDownList ID="ddlUserType" runat="server" required="true">
                    <asp:ListItem Value="">-- Select --</asp:ListItem>
                    <asp:ListItem Value="Farmer">Farmer</asp:ListItem>
                    <asp:ListItem Value="Trader">Trader</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="ddlUserType" 
                    InitialValue="" ErrorMessage="Please select user type" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="true" placeholder="Create your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                    ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" required="true" placeholder="Confirm your password"></asp:TextBox>
                <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPassword" 
                    ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" CssClass="error"></asp:CompareValidator>
            </div>
            


            <%--location code--%>
            <div class="form-group">
                <asp:Label ID="lblLocationSelect" runat="server" Text="Farm Location"></asp:Label>
               <asp:TextBox ID="txtSelectedAddress" runat="server"  placeholder="Click 'Select Location' to pick address" EnableViewState="true" />

                <button type="button" id="btnOpenMap" onclick="openMapModal()" class="btn" style="margin-top:10px; background-color:#8D6E63;">Select Location</button>
                <asp:HiddenField ID="hfLat" runat="server" />
                <asp:HiddenField ID="hfLng" runat="server" />
            </div>

            <!-- Map Modal -->
            <div id="mapModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background-color:rgba(0,0,0,0.6); z-index:9999;">
                <div style="position:relative; width:90%; height:80%; margin:5% auto; background:#fff; border-radius:8px; overflow:hidden;">
                    <div id="map" style="width:100%; height:100%;"></div>
                </div>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
            <%--<asp:Button ID="btnTestConnection" runat="server" Text="Test Database Connection" 
                OnClick="btnTestConnection_Click" CssClass="btn" style="margin-top:20px;"/>
            --%><asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
        </div>
    </form>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>

<script>
    let map, marker;
    const txtSelectedAddress = document.getElementById('<%= txtSelectedAddress.ClientID %>');
    const hfLat = document.getElementById('<%= hfLat.ClientID %>');
    const hfLng = document.getElementById('<%= hfLng.ClientID %>');

    function openMapModal() {
        document.getElementById("mapModal").style.display = "block";
        setTimeout(initMap, 100); // Delay to allow modal rendering
    }

    function closeMapModal() {
        document.getElementById("mapModal").style.display = "none";
    }

    function initMap() {
        if (!map) {
            map = L.map('map').setView([20.5937, 78.9629], 5); // India center

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19
            }).addTo(map);

            map.on('click', function (e) {
                const lat = e.latlng.lat;
                const lng = e.latlng.lng;

                if (marker) {
                    map.removeLayer(marker);
                }

                marker = L.marker([lat, lng]).addTo(map);

                // Reverse geocode
                fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`)
                    .then(response => response.json())
                    .then(data => {
                        const address = data.display_name || `Lat: ${lat}, Lng: ${lng}`;
                        txtSelectedAddress.value = address;
                        hfLat.value = lat;
                        hfLng.value = lng;
                        closeMapModal();
                    })
                    .catch(() => {
                        const coords = `Lat: ${lat}, Lng: ${lng}`;
                        txtSelectedAddress.value = coords;
                        hfLat.value = lat;
                        hfLng.value = lng;
                        closeMapModal();
                    });
            });
        }
    }
</script>

</body>
</html>