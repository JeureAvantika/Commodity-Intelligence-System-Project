
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelpPage.aspx.cs" Inherits="NewCISProject.HelpPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Help & Support - CIS</title>

    <!-- Fonts and Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />

    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #f1f8e9, #dcedc8); /* light olive green gradient */
            position: relative;
            overflow-x: hidden;
        }

        body::after {
            content: '';
            background: url('https://www.transparenttextures.com/patterns/leaf.png');
            opacity: 0.06;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }

        .container {
            max-width: 720px;
            margin: 70px auto;
            padding: 35px 30px;
            background: rgba(237, 245, 233, 0.85); /* very light greenish white */
            backdrop-filter: blur(12px);
            border-radius: 24px;
            box-shadow: 0 12px 45px rgba(0, 0, 0, 0.1);
            transition: transform 0.4s ease;
        }

        h1 {
            text-align: center;
            color: #4caf50; /* fresh green */
            margin-bottom: 35px;
            font-weight: 700;
        }

        .section {
            margin-bottom: 45px;
        }

        .section h2 {
            font-size: 22px;
            color: #33691e; /* dark olive green */
            margin-bottom: 18px;
            border-left: 5px solid #9ccc65; /* lighter olive accent */
            padding-left: 14px;
        }

        .feedback-form textarea,
        .feedback-form input[type="text"] {
            width: 100%;
            padding: 12px 14px;
            margin-bottom: 20px;
            border: 1px solid #c5e1a5;
            border-radius: 12px;
            font-size: 14px;
            background-color: #f9fbe7; /* very light olive */
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);
            color: #33691e;
        }

        .feedback-form button,
        .feedback-form input[type="submit"] {
            background-color: #7cb342; /* olive green */
            color: #fff;
            padding: 10px 26px;
            font-size: 15px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .feedback-form button:hover,
        .feedback-form input[type="submit"]:hover {
            background-color: #558b2f; /* darker olive on hover */
        }

        .admin-contact {
            background-color: #f1f8e9;
            border: 1px solid #c5e1a5;
            border-radius: 14px;
            padding: 22px;
            perspective: 1000px; /* gives depth */
             transform-style: preserve-3d;
        }

        .admin-contact ul {
            list-style: none;
            padding: 0;
        }

        .admin-contact li {
            margin-bottom: 14px;
            font-size: 15px;
            color: #33691e;
        }

        .admin-contact i {
            margin-right: 10px;
            color: #689f38;
        }

        @media (max-width: 600px) {
            .container {
                margin: 30px 15px;
                padding: 25px;
            }

            .section h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" data-aos="zoom-in">
            <h1 data-aos="fade-up">Help & Support</h1>

            <!-- Feedback Section -->
            <div class="section feedback-form" data-aos="fade-up-right">
                <h2>Send Us Your Feedback</h2>
                <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Rows="5" placeholder="Write your feedback here..."></asp:TextBox>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Your email"></asp:TextBox>
                <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" CssClass="btn" OnClick="btnSubmitFeedback_Click" />
            </div>

            <!-- Admin Contact Section -->


            <div class="section admin-contact" data-aos="flip-left" data-aos-anchor-placement="top-bottom">
                <h2>Administrator Contact</h2>
                <ul>
                    <li><i class="fas fa-envelope"></i> admin@agrismart.com</li>
                    <li><i class="fas fa-phone-alt"></i> +91 98765 43210</li>
                    <li><i class="fas fa-map-marker-alt"></i> HQ: Nashik, Maharashtra</li>
                </ul>
            </div>

        </div>
    </form>

    <!-- Animation Library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            once: true
        });
    </script>
</body>
</html>
