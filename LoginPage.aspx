


<%--code5--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="NewCISProject.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FarmConnect - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            max-width: 500px;
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

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }

        .form-group input:focus {
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

        .btn-secondary {
            background-color: var(--earth-brown);
        }

        .btn-secondary:hover {
            background-color: #7b5c4b;
        }

        .error {
            color: var(--error-red);
            font-size: 13px;
            margin-top: 5px;
            display: block;
            animation: fadeIn 0.3s ease;
        }

        .toggle-form {
            text-align: center;
            margin-top: 20px;
            color: var(--earth-brown);
        }

        .toggle-form a {
            color: var(--primary-green);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .toggle-form a:hover {
            text-decoration: underline;
            color: var(--dark-green);
        }

        .farm-icon {
            text-align: center;
            margin-bottom: 15px;
            color: var(--primary-green);
            font-size: 40px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
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
    <form id="form2" runat="server">
        <div class="container">
            <div class="farm-icon">
                <i class="fas fa-sign-in-alt"></i>
            </div>
            <h2>Welcome Back</h2>
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Phone Number"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Phone" required="true" placeholder="Enter your registered phone number"></asp:TextBox>
                <!-- Changed ControlToValidate to match TextBox1 -->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" 
                    ErrorMessage="Phone number is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" required="true" placeholder="Enter your password"></asp:TextBox>
                <!-- Changed ControlToValidate to match TextBox2 -->
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" 
                    ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            
            <!-- Changed Button ID to match code-behind -->
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            <%--<asp:Button ID="btnForgotPassword" runat="server" Text="Forgot Password?" CssClass="btn btn-secondary" style="margin-top:15px;"/>
            --%>
            <div class="toggle-form">
                Don't have an account? <a href="RegistrationPage.aspx">Register here</a>
            </div>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
        </div>
    </form>
</body>
</html>










































<%--code3--%>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="NewCISProject.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AgriConnect - Farmer & Trader Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        :root {
            --primary-color: #4CAF50;
            --primary-dark: #3d8b40;
            --secondary-color: #FFA500;
            --dark-color: #333;
            --light-color: #f9f9f9;
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
            

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4f0f5 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Changed from center to flex-start for scroll */
        }

        .main-container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: white;
            border-radius: 15px;
            box-shadow: var(--shadow);
            overflow: hidden;
            animation: fadeIn 0.8s ease;
            margin: 20px 0; /* Added margin for better spacing */
        }

        .illustration {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            color: white;
            position: relative;
            overflow: hidden;
            min-height: 100vh; /* Changed to min-height for scroll */
        }

        .illustration::before {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: -100px;
            right: -100px;
        }

        .illustration::after {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            bottom: -50px;
            left: -50px;
        }

        .illustration img {
            width: 80%;
            max-width: 300px;
            margin-bottom: 30px;
            animation: float 6s ease-in-out infinite;
        }

        .illustration h2 {
            font-size: 28px;
            margin-bottom: 15px;
            text-align: center;
            z-index: 1;
        }

        .illustration p {
            text-align: center;
            opacity: 0.9;
            z-index: 1;
        }

        .form-container {
            flex: 1;
            padding: 50px;
            position: relative;
            overflow-y: auto; /* Added for scroll */
            max-height: 100vh; /* Added for scroll */
        }

        .form-title {
            font-size: 24px;
            color: var(--dark-color);
            margin-bottom: 30px;
            position: relative;
            display: inline-block;
        }

        .form-title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 3px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark-color);
            font-size: 14px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            transition: var(--transition);
        }

        .form-group input:focus, .form-group select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
            outline: none;
        }

        .form-group i {
            position: absolute;
            right: 15px;
            top: 40px;
            color: #aaa;
            font-size: 16px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            margin-top: 10px;
        }

        .btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .btn-secondary {
            background: var(--secondary-color);
            margin-top: 15px;
        }

        .btn-secondary:hover {
            background: #e69500;
            box-shadow: 0 5px 15px rgba(255, 165, 0, 0.3);
        }

        .toggle-form {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

        .toggle-form a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            cursor: pointer;
        }

        .toggle-form a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .error {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: block;
            animation: shake 0.5s ease;
        }

        .form-section {
            position: absolute;
            top: 50px;
            left: 50px;
            right: 50px;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition);
            transform: translateY(20px);
        }

        .form-section.active {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }
            
            .illustration {
                padding: 30px 20px;
                min-height: auto; /* Reset min-height for mobile */
            }
            
            .illustration img {
                width: 150px;
                margin-bottom: 15px;
            }
            
            .illustration h2 {
                font-size: 22px;
            }
            
            .form-container {
                padding: 30px;
                max-height: none; /* Remove max-height for mobile */
                overflow-y: visible; /* Remove scroll for mobile */
            }
            
            .form-section {
                position: relative;
                top: auto;
                left: auto;
                right: auto;
                margin-bottom: 30px;
            }
        }

        .status-panel {
    position: fixed;
    bottom: 20px;
    right: 20px;
    padding: 15px;
    border-radius: 5px;
    box-shadow: var(--shadow);
    z-index: 1000;
    animation: fadeIn 0.3s ease;
}

.status-message {
    color: white;
    font-weight: 500;
}

.success {
    background-color: var(--primary-color);
}

.error {
    background-color: #e74c3c;
}
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4f0f5 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .main-container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: white;
            border-radius: 15px;
            box-shadow: var(--shadow);
            overflow: hidden;
            animation: fadeIn 0.8s ease;
            margin: 20px 0;
        }

        .illustration {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            color: white;
            position: relative;
            overflow: hidden;
            min-height: 100vh;
        }

        .illustration img {
            width: 80%;
            max-width: 300px;
            margin-bottom: 30px;
            animation: float 6s ease-in-out infinite;
        }

        .form-container {
            flex: 1;
            padding: 50px;
            position: relative;
            overflow-y: auto;
            max-height: 100vh;
        }

        /* [Rest of your CSS remains exactly the same] */
        
        .status-message {
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 15px;
            border-radius: 5px;
            color: white;
            font-weight: 500;
            box-shadow: var(--shadow);
            z-index: 1000;
            animation: fadeIn 0.3s ease;
        }
        
        .success {
            background-color: var(--primary-color);
        }
        
        .error {
            background-color: #e74c3c;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <!-- Illustration Section -->
            <div class="illustration">
                <img src="https://cdn-icons-png.flaticon.com/512/3079/3079158.png" alt="Agriculture Illustration" />
                <h2>Connect Farmers & Traders</h2>
                <p>Join our platform to streamline agricultural trade</p>
            </div>

            <!-- Form Container -->
            <div class="form-container">
                <!-- Registration Form -->
                <div id="registrationForm" class="form-section active">
                    <h2 class="form-title">Create Account</h2>
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Enter your full name"></asp:TextBox>
                        <i class="fas fa-user"></i>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                            ErrorMessage="Name is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="Enter 10-digit phone number"></asp:TextBox>
                        <i class="fas fa-phone"></i>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                            ErrorMessage="Phone number is required" CssClass="error"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" 
                            ErrorMessage="Enter a valid 10-digit phone number" ValidationExpression="^[0-9]{10}$" CssClass="error"></asp:RegularExpressionValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email (optional)"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                        <i class="fas fa-envelope"></i>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblUserType" runat="server" Text="I am a"></asp:Label>
                        <asp:DropDownList ID="ddlUserType" runat="server">
                            <asp:ListItem Value="">-- Select User Type --</asp:ListItem>
                            <asp:ListItem Value="Farmer">Farmer</asp:ListItem>
                            <asp:ListItem Value="Trader">Trader</asp:ListItem>
                        </asp:DropDownList>
                        <i class="fas fa-chevron-down"></i>
                        <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="ddlUserType" 
                            InitialValue="" ErrorMessage="Please select user type" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Create password"></asp:TextBox>
                        <i class="fas fa-lock"></i>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                            ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                        <i class="fas fa-lock"></i>
                        <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPassword" 
                            ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" CssClass="error"></asp:CompareValidator>
                    </div>
                    
                    <asp:Button ID="btnRegister" runat="server" Text="Register Now" CssClass="btn" OnClick="btnRegister_Click" />
                    
                    <div class="toggle-form">
                        Already have an account? <a id="showLogin" onclick="toggleForms()">Sign In</a>
                    </div>
                </div>
                
                <!-- Login Form -->
                <div id="loginForm" class="form-section">
                    <h2 class="form-title">Welcome Back</h2>
                    <div class="form-group">
                        <asp:Label ID="lblLoginPhone" runat="server" Text="Phone Number"></asp:Label>
                        <asp:TextBox ID="txtLoginPhone" runat="server" TextMode="Phone" placeholder="Enter your phone number"></asp:TextBox>
                        <i class="fas fa-phone"></i>
                        <asp:RequiredFieldValidator ID="rfvLoginPhone" runat="server" ControlToValidate="txtLoginPhone" 
                            ErrorMessage="Phone number is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblLoginPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                        <i class="fas fa-lock"></i>
                        <asp:RequiredFieldValidator ID="rfvLoginPassword" runat="server" ControlToValidate="txtLoginPassword" 
                            ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn" OnClick="btnLogin_Click" />
                    
                    <div class="toggle-form">
                        Don't have an account? <a id="showRegister" onclick="toggleForms()">Create Account</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Status Message Panel -->
        <asp:Panel ID="pnlStatus" runat="server" CssClass="status-message" Visible="false">
            <asp:Literal ID="litStatus" runat="server"></asp:Literal>
        </asp:Panel>
        
        <!-- Debug Panel (visible when ?debug=1) -->
        <div id="debugPanel" style="position:fixed; bottom:10px; left:10px; background:#f8f9fa; padding:10px; border:1px solid #ddd; z-index:1000; display:none;">
            <h4>Debug Information</h4>
            <div id="debugContent"></div>
        </div>
    </form>
    
    <script type="text/javascript">
        // Toggle between forms
        function toggleForms() {
            const registrationForm = document.getElementById('registrationForm');
            const loginForm = document.getElementById('loginForm');

            registrationForm.classList.toggle('active');
            loginForm.classList.toggle('active');

            document.querySelector('.form-container').scrollTop = 0;
        }

        // Show debug panel if requested
        if (window.location.search.includes('debug=1')) {
            document.getElementById('debugPanel').style.display = 'block';
            window.addDebugMessage = function (message) {
                const debugDiv = document.getElementById('debugContent');
                debugDiv.innerHTML += `<p>${new Date().toLocaleTimeString()}: ${message}</p>`;
                debugDiv.scrollTop = debugDiv.scrollHeight;
            };
        }
    </script>
</body>
</html>


--%>
<%--code4--%>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="NewCISProject.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FarmConnect - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            max-width: 500px;
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

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f9f9f9;
        }

        .form-group input:focus {
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

        .btn-secondary {
            background-color: var(--earth-brown);
        }

        .btn-secondary:hover {
            background-color: #7b5c4b;
        }

        .error {
            color: var(--error-red);
            font-size: 13px;
            margin-top: 5px;
            display: block;
            animation: fadeIn 0.3s ease;
        }

        .toggle-form {
            text-align: center;
            margin-top: 20px;
            color: var(--earth-brown);
        }

        .toggle-form a {
            color: var(--primary-green);
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .toggle-form a:hover {
            text-decoration: underline;
            color: var(--dark-green);
        }

        .farm-icon {
            text-align: center;
            margin-bottom: 15px;
            color: var(--primary-green);
            font-size: 40px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
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
    <form id="form2" runat="server">
        <div class="container">
            <div class="farm-icon">
                <i class="fas fa-sign-in-alt"></i>
            </div>
            <h2>Welcome Back</h2>
            
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Phone Number"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="Phone" required="true" placeholder="Enter your registered phone number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoginPhone" 
                    ErrorMessage="Phone number is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" required="true" placeholder="Enter your password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLoginPassword" 
                    ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
            </div>
            
            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
            <asp:Button ID="btnForgotPassword" runat="server" Text="Forgot Password?" CssClass="btn btn-secondary" style="margin-top:15px;"/>
            
            <div class="toggle-form">
                Don't have an account? <a href="Example.aspx">Register here</a>
            </div>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="error"></asp:Label>
        </div>
    </form>
</body>
</html>--%>

<%--code 2--%>
<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="NewCISProject.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AgriConnect - Farmer & Trader Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style type="text/css">
        :root {
            --primary-color: #4CAF50;
            --primary-dark: #3d8b40;
            --secondary-color: #FFA500;
            --dark-color: #333;
            --light-color: #f9f9f9;
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #e4f0f5 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Changed from center to flex-start for scroll */
        }

        .main-container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background: white;
            border-radius: 15px;
            box-shadow: var(--shadow);
            overflow: hidden;
            animation: fadeIn 0.8s ease;
            margin: 20px 0; /* Added margin for better spacing */
        }

        .illustration {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            color: white;
            position: relative;
            overflow: hidden;
            min-height: 100vh; /* Changed to min-height for scroll */
        }

        .illustration::before {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: -100px;
            right: -100px;
        }

        .illustration::after {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            bottom: -50px;
            left: -50px;
        }

        .illustration img {
            width: 80%;
            max-width: 300px;
            margin-bottom: 30px;
            animation: float 6s ease-in-out infinite;
        }

        .illustration h2 {
            font-size: 28px;
            margin-bottom: 15px;
            text-align: center;
            z-index: 1;
        }

        .illustration p {
            text-align: center;
            opacity: 0.9;
            z-index: 1;
        }

        .form-container {
            flex: 1;
            padding: 50px;
            position: relative;
            overflow-y: auto; /* Added for scroll */
            max-height: 100vh; /* Added for scroll */
        }

        .form-title {
            font-size: 24px;
            color: var(--dark-color);
            margin-bottom: 30px;
            position: relative;
            display: inline-block;
        }

        .form-title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 3px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark-color);
            font-size: 14px;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            transition: var(--transition);
        }

        .form-group input:focus, .form-group select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
            outline: none;
        }

        .form-group i {
            position: absolute;
            right: 15px;
            top: 40px;
            color: #aaa;
            font-size: 16px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            margin-top: 10px;
        }

        .btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
        }

        .btn-secondary {
            background: var(--secondary-color);
            margin-top: 15px;
        }

        .btn-secondary:hover {
            background: #e69500;
            box-shadow: 0 5px 15px rgba(255, 165, 0, 0.3);
        }

        .toggle-form {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

        .toggle-form a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            cursor: pointer;
        }

        .toggle-form a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .error {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: block;
            animation: shake 0.5s ease;
        }

        .form-section {
            position: absolute;
            top: 50px;
            left: 50px;
            right: 50px;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition);
            transform: translateY(20px);
        }

        .form-section.active {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }
            
            .illustration {
                padding: 30px 20px;
                min-height: auto; /* Reset min-height for mobile */
            }
            
            .illustration img {
                width: 150px;
                margin-bottom: 15px;
            }
            
            .illustration h2 {
                font-size: 22px;
            }
            
            .form-container {
                padding: 30px;
                max-height: none; /* Remove max-height for mobile */
                overflow-y: visible; /* Remove scroll for mobile */
            }
            
            .form-section {
                position: relative;
                top: auto;
                left: auto;
                right: auto;
                margin-bottom: 30px;
            }
        }

        .status-panel {
    position: fixed;
    bottom: 20px;
    right: 20px;
    padding: 15px;
    border-radius: 5px;
    box-shadow: var(--shadow);
    z-index: 1000;
    animation: fadeIn 0.3s ease;
}

.status-message {
    color: white;
    font-weight: 500;
}

.success {
    background-color: var(--primary-color);
}

.error {
    background-color: #e74c3c;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-container">
            <!-- Illustration Section -->
            <div class="illustration">
                <img src="https://cdn-icons-png.flaticon.com/512/3079/3079158.png" alt="Agriculture Illustration" />
                <h2>Connect Farmers & Traders</h2>
                <p>Join our platform to streamline agricultural trade and create better opportunities</p>
            </div>

            <!-- Form Container -->
            <div class="form-container">
                <!-- Registration Form -->
                <div id="registrationForm" class="form-section active">
                    <h2 class="form-title">Create Account</h2>
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" placeholder="Enter your full name"></asp:TextBox>
                        <i class="fas fa-user"></i>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                            ErrorMessage="Name is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" placeholder="Enter 10-digit phone number"></asp:TextBox>
                        <i class="fas fa-phone"></i>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                            ErrorMessage="Phone number is required" CssClass="error"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" 
                            ErrorMessage="Enter a valid 10-digit phone number" ValidationExpression="^[0-9]{10}$" CssClass="error"></asp:RegularExpressionValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email (optional)"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                        <i class="fas fa-envelope"></i>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                            ErrorMessage="Enter a valid email address" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" CssClass="error"></asp:RegularExpressionValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblUserType" runat="server" Text="I am a"></asp:Label>
                        <asp:DropDownList ID="ddlUserType" runat="server">
                            <asp:ListItem Value="">-- Select User Type --</asp:ListItem>
                            <asp:ListItem Value="Farmer">Farmer</asp:ListItem>
                            <asp:ListItem Value="Trader">Trader</asp:ListItem>
                        </asp:DropDownList>
                        <i class="fas fa-chevron-down"></i>
                        <asp:RequiredFieldValidator ID="rfvUserType" runat="server" ControlToValidate="ddlUserType" 
                            InitialValue="" ErrorMessage="Please select user type" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Create password"></asp:TextBox>
                        <i class="fas fa-lock"></i>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                            ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm your password"></asp:TextBox>
                        <i class="fas fa-lock"></i>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" 
                            ErrorMessage="Please confirm password" CssClass="error"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtConfirmPassword" 
                            ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" CssClass="error"></asp:CompareValidator>
                    </div>
                    
                    <asp:Button ID="btnRegister" runat="server" Text="Register Now" CssClass="btn" OnClick="btnRegister_Click" />
                    
                    <div class="toggle-form">
                        Already have an account? <a id="showLogin" onclick="toggleForms()">Sign In</a>
                    </div>
                </div>
                
                <!-- Login Form -->
                <div id="loginForm" class="form-section">
                    <h2 class="form-title">Welcome Back</h2>
                    <div class="form-group">
                        <asp:Label ID="lblLoginPhone" runat="server" Text="Phone Number"></asp:Label>
                        <asp:TextBox ID="txtLoginPhone" runat="server" TextMode="Phone" placeholder="Enter your phone number"></asp:TextBox>
                        <i class="fas fa-phone"></i>
                        <asp:RequiredFieldValidator ID="rfvLoginPhone" runat="server" ControlToValidate="txtLoginPhone" 
                            ErrorMessage="Phone number is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <div class="form-group">
                        <asp:Label ID="lblLoginPassword" runat="server" Text="Password"></asp:Label>
                        <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                        <i class="fas fa-lock"></i>
                        <asp:RequiredFieldValidator ID="rfvLoginPassword" runat="server" ControlToValidate="txtLoginPassword" 
                            ErrorMessage="Password is required" CssClass="error"></asp:RequiredFieldValidator>
                    </div>
                    
                    <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn" OnClick="btnLogin_Click" />
                    <asp:Button ID="btnForgotPassword" runat="server" Text="Forgot Password?" CssClass="btn btn-secondary" />
                    
                    <div class="toggle-form">
                        Don't have an account? <a id="showRegister" onclick="toggleForms()">Create Account</a>
                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="pnlStatus" runat="server" CssClass="status-panel" Visible="false">
    <asp:Label ID="lblStatus" runat="server" CssClass="status-message"></asp:Label>
</asp:Panel>

        <!-- Debug Panel (visible only during development) -->
<div id="debugPanel" style="position:fixed; bottom:10px; left:10px; background:#f8f9fa; padding:10px; border:1px solid #ddd; z-index:1000; display:none;">
    <h4>Database Debug Info</h4>
    <div id="debugContent"></div>
</div>

<script>
    // Enable debug mode by adding ?debug=1 to URL
    if (window.location.search.includes('debug=1')) {
        document.getElementById('debugPanel').style.display = 'block';

        // Function to add debug messages
        function addDebugMessage(message) {
            const debugDiv = document.getElementById('debugContent');
            debugDiv.innerHTML += `<p>${new Date().toLocaleTimeString()}: ${message}</p>`;
            debugDiv.scrollTop = debugDiv.scrollHeight;
        }

        // Expose to global scope for calling from code-behind
        window.addDebugMessage = addDebugMessage;
    }
</script>
    </form>
    
    <script type="text/javascript">
        function toggleForms() {
            const registrationForm = document.getElementById('registrationForm');
            const loginForm = document.getElementById('loginForm');

            registrationForm.classList.toggle('active');
            loginForm.classList.toggle('active');

            // Scroll to top when switching forms
            document.querySelector('.form-container').scrollTop = 0;

            // Add animation class and remove it after animation completes
            if (registrationForm.classList.contains('active')) {
                registrationForm.style.animation = 'fadeIn 0.6s ease';
                setTimeout(() => { registrationForm.style.animation = ''; }, 600);
            } else {
                loginForm.style.animation = 'fadeIn 0.6s ease';
                setTimeout(() => { loginForm.style.animation = ''; }, 600);
            }
        }

        // Add input focus effects
        document.querySelectorAll('input, select').forEach(input => {
            input.addEventListener('focus', function () {
                this.parentElement.querySelector('i').style.color = 'var(--primary-color)';
            });

            input.addEventListener('blur', function () {
                this.parentElement.querySelector('i').style.color = '#aaa';
            });
        });
    </script>
</body>
</html>--%>
