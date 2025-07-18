<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLoginPage.aspx.cs" Inherits="NewCISProject.AdminLoginPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Portal - Commodity Intelligence System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-dark: #0d3b1e;
            --primary: #2e7d32;
            --primary-light: #60ad5e;
            --primary-extra-light: #e8f5e9;
            --accent: #689f38;
            --text-dark: #212121;
            --text-medium: #424242;
            --text-light: #757575;
            --white: #ffffff;
            --gray-light: #fafafa;
            --border-radius: 8px;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.12);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            font-family: 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
        }

        body {
            margin: 0;
            background: linear-gradient(135deg, var(--primary-extra-light) 0%, var(--gray-light) 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text-dark);
            line-height: 1.6;
        }

        .login-wrapper {
            display: flex;
            width: 900px;
            height: 550px;
            background: var(--white);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow-lg);
            overflow: hidden;
        }

        .login-banner {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
            color: var(--white);
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .login-banner::before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .login-banner::after {
            content: '';
            position: absolute;
            bottom: -80px;
            right: -30px;
            width: 250px;
            height: 250px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }

        .banner-content {
            position: relative;
            z-index: 1;
        }

        .banner-content h1 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 15px;
            letter-spacing: 0.5px;
        }

        .banner-content p {
            font-size: 16px;
            opacity: 0.9;
            margin-bottom: 30px;
        }

        .system-features {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .system-features li {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .system-features i {
            margin-right: 12px;
            font-size: 18px;
            color: var(--accent);
        }

        .login-container {
            flex: 1;
            padding: 60px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-header {
            margin-bottom: 40px;
            text-align: center;
        }

        .login-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: var(--primary-dark);
            margin-bottom: 8px;
        }

        .login-header p {
            color: var(--text-light);
            font-size: 14px;
        }

        .input-group {
            margin-bottom: 25px;
            position: relative;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--text-medium);
            font-size: 14px;
        }

        .input-field {
            position: relative;
        }

        .input-field i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-light);
            font-size: 16px;
        }

        .input-group input {
            width: 100%;
            padding: 12px 12px 12px 40px;
            border: 1px solid #e0e0e0;
            border-radius: var(--border-radius);
            font-size: 15px;
            transition: var(--transition);
            background-color: var(--gray-light);
        }

        .input-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(46, 125, 50, 0.2);
            outline: none;
            background-color: var(--white);
        }

        .login-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .remember-me {
            display: flex;
            align-items: center;
        }

        .remember-me input {
            margin-right: 8px;
        }

        .forgot-password a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
        }

        .forgot-password a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            background-color: var(--primary);
            border: none;
            border-radius: var(--border-radius);
            color: var(--white);
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            box-shadow: var(--shadow-sm);
        }

        .btn-login:hover {
            background-color: var(--primary-dark);
            box-shadow: var(--shadow-md);
        }

        .btn-login i {
            margin-right: 8px;
        }

        .error-message {
            color: #d32f2f;
            background-color: #fde8e8;
            padding: 12px 15px;
            border-radius: var(--border-radius);
            margin-bottom: 20px;
            font-weight: 500;
            font-size: 14px;
            display: none;
            text-align: center;
            border-left: 4px solid #d32f2f;
        }

        .copyright {
            text-align: center;
            margin-top: 30px;
            color: var(--text-light);
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="login-wrapper">
            <div class="login-banner">
                <div class="banner-content">
                    <h1>Commodity Intelligence System</h1>
                    <p>Advanced analytics and reporting for commodity market professionals</p>
                    
                    <ul class="system-features">
                        <li><i class="fas fa-chart-line"></i> Real-time market analytics</li>
                        <li><i class="fas fa-database"></i> Comprehensive commodity database</li>
                        <li><i class="fas fa-shield-alt"></i> Enterprise-grade security</li>
                        <li><i class="fas fa-cogs"></i> Advanced administration tools</li>
                    </ul>
                </div>
            </div>
            
            <div class="login-container">
                <div class="login-header">
                    <h2><i class="fas fa-user-shield"></i> Administrator Portal</h2>
                    <p>Sign in to access the management dashboard</p>
                </div>
                
                <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>

                <div class="input-group">
                    <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtUsername" Text="Username"></asp:Label>
                    <div class="input-field">
                        <i class="fas fa-user"></i>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="" AutoComplete="off" placeholder="Enter your username"></asp:TextBox>
                    </div>
                </div>

                <div class="input-group">
                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password"></asp:Label>
                    <div class="input-field">
                        <i class="fas fa-lock"></i>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="" AutoComplete="off" placeholder="Enter your password"></asp:TextBox>
                    </div>
                </div>

                <div class="login-actions">
                 <%--   <div class="remember-me">
                        <asp:CheckBox ID="chkRemember" runat="server" />
                        <asp:Label ID="lblRemember" runat="server" AssociatedControlID="chkRemember" Text="Remember me"></asp:Label>
                    </div>
                    <div class="forgot-password">
                        <a href="#">Forgot password?</a>
                    </div>--%>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-login" OnClick="btnLogin_Click" />

                <div class="copyright">
                    &copy; 2023 Commodity Intelligence System. All rights reserved.
                </div>
            </div>
        </div>
    </form>
</body>
</html>



