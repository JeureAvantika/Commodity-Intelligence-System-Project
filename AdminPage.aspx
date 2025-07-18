
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="NewCISProject.AdminPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-dark: #1e5631;
            --primary: #4CAF50;
            --primary-light: #a4de9e;
            --primary-extra-light: #e8f5e9;
            --accent: #8bc34a;
            --text-dark: #263238;
            --text-light: #607d8b;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            background-color: var(--gray-light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background-color: var(--primary-dark);
            color: var(--white);
            height: 100vh;
            position: fixed;
            box-shadow: var(--shadow);
            transition: var(--transition);
            z-index: 100;
        }

        .sidebar h2 {
            text-align: center;
            padding: 25px 0;
            margin: 0;
            background-color: rgba(0, 0, 0, 0.1);
            font-size: 22px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            padding: 15px 25px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            transition: var(--transition);
        }

        .sidebar ul li:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .sidebar ul li a,
        .sidebar ul li asp\:LinkButton {
            color: var(--white);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 15px;
            font-weight: 500;
        }

        .sidebar ul li i {
            width: 24px;
            text-align: center;
            font-size: 18px;
        }

        /* Main Content Styles */
        .main-content {
            margin-left: 280px;
            padding: 30px;
            flex-grow: 1;
            min-height: 100vh;
        }

        /* Panel Styles */
        .panel {
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: var(--shadow);
            padding: 25px;
            margin-bottom: 30px;
        }

        .panel-header {
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--primary-extra-light);
            padding-bottom: 15px;
        }

        .panel-header h2 {
            font-size: 24px;
            color: var(--primary-dark);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .panel-header h2 i {
            color: var(--primary);
        }

        /* Stats Cards */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: var(--white);
            padding: 20px;
            border-radius: 8px;
            display: flex;
            gap: 20px;
            align-items: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
            border-left: 4px solid var(--primary);
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            background-color: var(--primary-extra-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            color: var(--primary);
        }

        .stat-content {
            flex: 1;
        }

        .stat-title {
            font-size: 14px;
            color: var(--text-light);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 5px;
        }

        .stat-value {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary-dark);
            margin: 0;
        }

        /* Table Styles */
        .table-container {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th {
            background-color: var(--primary-dark);
            color: var(--white);
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }

        .table td {
            padding: 12px 15px;
            border-bottom: 1px solid var(--primary-extra-light);
            vertical-align: middle;
        }

        .table tr:hover {
            background-color: var(--primary-extra-light);
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        /* Dashboard Welcome Panel */
        .welcome-panel {
            text-align: center;
            padding: 40px 20px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: var(--white);
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .welcome-panel h1 {
            font-size: 36px;
            margin-bottom: 15px;
        }

        .welcome-panel p {
            font-size: 18px;
            opacity: 0.9;
            max-width: 700px;
            margin: 0 auto;
        }

        /* Active State for Navigation */
        .active-nav {
            background-color: rgba(255, 255, 255, 0.15);
            border-left: 4px solid var(--accent);
        }

        .active-nav a {
            color: var(--white) !important;
            font-weight: 600;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .sidebar {
                width: 220px;
            }
            .main-content {
                margin-left: 220px;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
            .stats-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h2><i class="fas fa-leaf"></i> Admin Panel</h2>
            <ul>
                <li id="liDashboard" runat="server" class="active-nav">
                    <asp:LinkButton ID="lnkDashboard" runat="server" OnClick="lnkDashboard_Click">
                        <i class="fas fa-home"></i> Dashboard
                    </asp:LinkButton>
                </li>
                <li id="liFeedback" runat="server">
                    <asp:LinkButton ID="lnkFeedback" runat="server" OnClick="lnkFeedback_Click">
                        <i class="fas fa-comment-alt"></i> Feedback
                    </asp:LinkButton>
                </li>
                <li id="liUserList" runat="server">
                    <asp:LinkButton ID="lnkUserlst" runat="server" OnClick="lnkUserList_Click">
                        <i class="fas fa-users"></i> User List
                    </asp:LinkButton>
                </li>
            </ul>
        </div>

        <div class="main-content">
            <!-- Dashboard Panel -->
            <asp:Panel ID="pnlDashboard" runat="server" Visible="true">
                <div class="welcome-panel">
                    <h1><i class="fas fa-leaf"></i> Welcome to the Admin Dashboard</h1>
                    <p>Manage your system efficiently with this comprehensive admin panel. View statistics, user feedback, and system information.</p>
                </div>

                <div class="panel">
                    <div class="panel-header">
                        <h2><i class="fas fa-chart-line"></i> Quick Stats</h2>
                    </div>
                    <div class="stats-row">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Users</div>
                                <div class="stat-value" id="lblDashboardTotalUsers" runat="server">0</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-comments"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Feedback</div>
                                <div class="stat-value" id="lblDashboardTotalFeedback" runat="server">0</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Resolved Issues</div>
                                <div class="stat-value" id="lblDashboardResolvedIssues" runat="server">0</div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <!-- Feedback Panel -->
            <asp:Panel ID="pnlFeedback" runat="server" Visible="false">
                <div class="panel">
                    <div class="panel-header">
                        <h2><i class="fas fa-comment-alt"></i> User Feedback Dashboard</h2>
                    </div>
                    
                    <div class="stats-row">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-inbox"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Feedback</div>
                                <div class="stat-value">
                                    <asp:Label ID="totalFeedback" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Today's</div>
                                <div class="stat-value">
                                    <asp:Label ID="todaysFeedback" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Urgent</div>
                                <div class="stat-value">
                                    <asp:Label ID="urgentFeedback" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-container">
                        <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="true" CssClass="table">
                            <HeaderStyle CssClass="table-header" />
                            <RowStyle CssClass="table-row" />
                            <AlternatingRowStyle CssClass="table-alt-row" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>

            <!-- User List Panel -->
            <asp:Panel ID="pnlUserList" runat="server" Visible="false">
                <div class="panel">
                    <div class="panel-header">
                        <h2><i class="fas fa-users"></i> User Management</h2>
                    </div>
                    
                    <div class="stats-row">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Traders</div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalTraders" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-tractor"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Farmers</div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalFarmers" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Users</div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-container">
                        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" CssClass="table">
                            <Columns>
                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="UserType" HeaderText="User Type" />
                                <asp:BoundField DataField="CreatedDate" HeaderText="Registration Date" DataFormatString="{0:dd/MM/yyyy}" />
                            </Columns>
                            <HeaderStyle CssClass="table-header" />
                            <RowStyle CssClass="table-row" />
                            <AlternatingRowStyle CssClass="table-alt-row" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>














<%--code1--%>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="NewCISProject.AdminPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-dark: #1e5631;
            --primary: #4CAF50;
            --primary-light: #a4de9e;
            --primary-extra-light: #e8f5e9;
            --accent: #8bc34a;
            --text-dark: #263238;
            --text-light: #607d8b;
            --white: #ffffff;
            --gray-light: #f5f5f5;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            background-color: var(--gray-light);
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background-color: var(--primary-dark);
            color: var(--white);
            height: 100vh;
            position: fixed;
            box-shadow: var(--shadow);
            transition: var(--transition);
            z-index: 100;
        }

        .sidebar h2 {
            text-align: center;
            padding: 25px 0;
            margin: 0;
            background-color: rgba(0, 0, 0, 0.1);
            font-size: 22px;
            font-weight: 600;
            letter-spacing: 1px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            padding: 15px 25px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            transition: var(--transition);
        }

        .sidebar ul li:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .sidebar ul li a,
        .sidebar ul li asp\:LinkButton {
            color: var(--white);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 15px;
            font-weight: 500;
        }

        .sidebar ul li i {
            width: 24px;
            text-align: center;
            font-size: 18px;
        }

        /* Main Content Styles */
        .main-content {
            margin-left: 280px;
            padding: 30px;
            flex-grow: 1;
            min-height: 100vh;
        }

        /* Panel Styles */
        .panel {
            background-color: var(--white);
            border-radius: 8px;
            box-shadow: var(--shadow);
            padding: 25px;
            margin-bottom: 30px;
        }

        .panel-header {
            margin-bottom: 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--primary-extra-light);
            padding-bottom: 15px;
        }

        .panel-header h2 {
            font-size: 24px;
            color: var(--primary-dark);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .panel-header h2 i {
            color: var(--primary);
        }

        /* Stats Cards */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: var(--white);
            padding: 20px;
            border-radius: 8px;
            display: flex;
            gap: 20px;
            align-items: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
            border-left: 4px solid var(--primary);
        }

        .stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            background-color: var(--primary-extra-light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            color: var(--primary);
        }

        .stat-content {
            flex: 1;
        }

        .stat-title {
            font-size: 14px;
            color: var(--text-light);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 5px;
        }

        .stat-value {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary-dark);
            margin: 0;
        }

        /* Table Styles */
        .table-container {
            overflow-x: auto;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th {
            background-color: var(--primary-dark);
            color: var(--white);
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }

        .table td {
            padding: 12px 15px;
            border-bottom: 1px solid var(--primary-extra-light);
            vertical-align: middle;
        }

        .table tr:hover {
            background-color: var(--primary-extra-light);
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        /* Dashboard Welcome Panel */
        .welcome-panel {
            text-align: center;
            padding: 40px 20px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: var(--white);
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .welcome-panel h1 {
            font-size: 36px;
            margin-bottom: 15px;
        }

        .welcome-panel p {
            font-size: 18px;
            opacity: 0.9;
            max-width: 700px;
            margin: 0 auto;
        }

        /* Active State for Navigation */
        .active-nav {
            background-color: rgba(255, 255, 255, 0.15);
            border-left: 4px solid var(--accent);
        }

        .active-nav a {
            color: var(--white) !important;
            font-weight: 600;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .sidebar {
                width: 220px;
            }
            .main-content {
                margin-left: 220px;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
            .stats-row {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h2><i class="fas fa-leaf"></i> Admin Panel</h2>
            <ul>
                <li id="liDashboard" runat="server" class="active-nav">
                    <asp:LinkButton ID="lnkDashboard" runat="server" OnClick="lnkDashboard_Click">
                        <i class="fas fa-home"></i> Dashboard
                    </asp:LinkButton>
                </li>
                <li id="liFeedback" runat="server">
                    <asp:LinkButton ID="lnkFeedback" runat="server" OnClick="lnkFeedback_Click">
                        <i class="fas fa-comment-alt"></i> Feedback
                    </asp:LinkButton>
                </li>
                <li id="liUserList" runat="server">
                    <asp:LinkButton ID="lnkUserlst" runat="server" OnClick="lnkUserList_Click">
                        <i class="fas fa-users"></i> User List
                    </asp:LinkButton>
                </li>
            </ul>
        </div>

        <div class="main-content">
            <!-- Dashboard Panel -->
            <asp:Panel ID="pnlDashboard" runat="server" Visible="true">
                <div class="welcome-panel">
                    <h1><i class="fas fa-leaf"></i> Welcome to the Admin Dashboard</h1>
                    <p>Manage your system efficiently with this comprehensive admin panel. View statistics, user feedback, and system information.</p>
                </div>

                <div class="panel">
                    <div class="panel-header">
                        <h2><i class="fas fa-chart-line"></i> Quick Stats</h2>
                    </div>
                    <div class="stats-row">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Users</div>
                                <div class="stat-value">1,248</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-comments"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Feedback</div>
                                <div class="stat-value">356</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Resolved Issues</div>
                                <div class="stat-value">289</div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>

            <!-- Feedback Panel -->
            <asp:Panel ID="pnlFeedback" runat="server" Visible="false">
                <div class="panel">
                    <div class="panel-header">
                        <h2><i class="fas fa-comment-alt"></i> User Feedback Dashboard</h2>
                    </div>
                    
                    <div class="stats-row">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-inbox"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Feedback</div>
                                <div class="stat-value">
                                    <asp:Label ID="totalFeedback" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Today's</div>
                                <div class="stat-value">
                                    <asp:Label ID="todaysFeedback" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-exclamation-triangle"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Urgent</div>
                                <div class="stat-value">
                                    <asp:Label ID="urgentFeedback" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-container">
                        <asp:GridView ID="gvFeedback" runat="server" AutoGenerateColumns="true" CssClass="table">
                            <HeaderStyle CssClass="table-header" />
                            <RowStyle CssClass="table-row" />
                            <AlternatingRowStyle CssClass="table-alt-row" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>

            <!-- User List Panel -->
            <asp:Panel ID="pnlUserList" runat="server" Visible="false">
                <div class="panel">
                    <div class="panel-header">
                        <h2><i class="fas fa-users"></i> User Management</h2>
                    </div>
                    
                    <div class="stats-row">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-user-tie"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Traders</div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalTraders" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-tractor"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Farmers</div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalFarmers" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <div class="stat-content">
                                <div class="stat-title">Total Users</div>
                                <div class="stat-value">
                                    <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="table-container">
                        <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" CssClass="table">
                            <Columns>
                                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                                <asp:BoundField DataField="Email" HeaderText="Email" />
                                <asp:BoundField DataField="UserType" HeaderText="User Type" />
                                <asp:BoundField DataField="CreatedDate" HeaderText="Registration Date" DataFormatString="{0:dd/MM/yyyy}" />
                            </Columns>
                            <HeaderStyle CssClass="table-header" />
                            <RowStyle CssClass="table-row" />
                            <AlternatingRowStyle CssClass="table-alt-row" />
                        </asp:GridView>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
--%>


