<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="NewCISProject.AboutUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - AgriSmart Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />

    <style>
        :root {
            --primary-color: #2e7d32;
            --primary-dark: #1b5e20;
            --primary-light: #81c784;
            --accent-color: #ffab00;
            --background-gradient: linear-gradient(135deg, #f5f7fa 0%, #e4f5e4 100%);
            --card-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.1);
        }

        body {
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--background-gradient);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            color: #333;
            animation: fadeInBody 1s ease-out;
            scroll-behavior: smooth;
        }

        @keyframes fadeInBody {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .container {
            max-width: 1200px;
            margin: 60px auto;
            padding: 20px;
        }

        .hero-section {
            text-align: center;
            margin-bottom: 60px;
        }

        h1 {
            font-size: 2.8rem;
            color: var(--primary-dark);
            margin-bottom: 20px;
            font-weight: 700;
            background: linear-gradient(to right, var(--primary-dark), var(--primary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            position: relative;
            display: inline-block;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--accent-color);
            border-radius: 2px;
        }

        .hero-description {
            font-size: 1.2rem;
            max-width: 800px;
            margin: 0 auto 40px;
            line-height: 1.8;
            color: #555;
        }

        .cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
            margin: 40px 0;
        }

        .card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: var(--card-shadow);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.1);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px -10px rgba(0, 0, 0, 0.15);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: var(--primary-color);
            transition: all 0.4s ease;
        }

        .card:hover::before {
            width: 8px;
            background: var(--accent-color);
        }

        h2 {
            font-size: 1.5rem;
            color: var(--primary-dark);
            margin-bottom: 20px;
            position: relative;
            padding-left: 15px;
        }

        h2::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 5px;
            height: 70%;
            background: var(--primary-light);
            border-radius: 3px;
        }

        ul, ol {
            padding-left: 20px;
        }

        ul li, ol li {
            margin-bottom: 12px;
            position: relative;
            padding-left: 25px;
            line-height: 1.6;
            transition: all 0.3s ease;
        }

        ul li::before, ol li::before {
            content: '';
            position: absolute;
            left: 0;
            top: 8px;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: var(--primary-light);
            transition: all 0.3s ease;
        }

        ul li:hover, ol li:hover {
            transform: translateX(5px);
            color: var(--primary-dark);
        }

        ul li:hover::before, ol li:hover::before {
            background: var(--accent-color);
            transform: scale(1.2);
        }

        .highlight-card {
            background: linear-gradient(135deg, #e8f5e9 0%, #f1f8e9 100%);
            border-left: 5px solid var(--accent-color);
            padding: 25px;
            border-radius: 12px;
            margin: 30px 0;
            box-shadow: 0 8px 16px rgba(46, 125, 50, 0.1);
            position: relative;
            overflow: hidden;
        }

        .highlight-card::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.8) 0%, rgba(255, 255, 255, 0) 70%);
            transform: rotate(30deg);
            pointer-events: none;
        }

        .feature-icon {
            font-size: 1.8rem;
            margin-right: 15px;
            color: var(--primary-color);
            vertical-align: middle;
        }

        .contact-section {
            text-align: center;
            margin: 60px 0 40px;
            padding: 40px;
            background: white;
            border-radius: 16px;
            box-shadow: var(--card-shadow);
        }

        .footer {
            margin-top: 80px;
            font-size: 0.9rem;
            color: #777;
            text-align: center;
            padding: 30px 0;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 3px;
            background: var(--accent-color);
            border-radius: 3px;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
            }

            h1 {
                font-size: 2rem;
            }

            .cards-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="hero-section" data-aos="fade-up">
                <h1>Welcome to AgriSmart</h1>
                <p class="hero-description">
                    AgriSmart is revolutionizing agricultural commerce by connecting farmers directly with traders through 
                    our AI-powered commodity intelligence platform. We bridge the gap between production and market with 
                    cutting-edge technology.
                </p>
            </div>

            <div class="highlight-card" data-aos="zoom-in">
                <h2 style="text-align: center; padding-left: 0;">Our Mission</h2>
                <p style="text-align: center; font-size: 1.1rem; line-height: 1.8; margin: 0;">
                    To democratize agricultural trade by empowering farmers with digital tools and providing traders 
                    with AI-driven quality insights, creating a transparent, efficient marketplace that benefits all stakeholders.
                </p>
            </div>

            <div class="cards-container">
                <div class="card" data-aos="fade-right">
                    <h2><i class="fas fa-tractor feature-icon"></i> Farmer Benefits</h2>
                    <ul>
                        <li>Showcase your produce to verified traders nationwide</li>
                        <li>Get instant quality assessments with our AI technology</li>
                        <li>Receive fair market prices without middlemen</li>
                        <li>Easy-to-use dashboard for managing your commodities</li>
                        <li>Secure communication with potential buyers</li>
                    </ul>
                </div>

                <div class="card" data-aos="fade-left">
                    <h2><i class="fas fa-chart-line feature-icon"></i> Trader Advantages</h2>
                    <ul>
                        <li>Access to quality-verified produce from trusted farmers</li>
                        <li>AI-powered freshness and quality predictions</li>
                        <li>Real-time updates on available commodities</li>
                        <li>Direct communication channels with producers</li>
                        <li>Data-driven decision making for better purchases</li>
                    </ul>
                </div>
            </div>

            <div class="cards-container">
                <div class="card" data-aos="flip-left">
                    <h2><i class="fas fa-cogs feature-icon"></i> How It Works</h2>
                    <ol>
                        <li>Farmers upload produce details and images through our portal</li>
                        <li>Our AI analyzes quality, freshness, and potential defects</li>
                        <li>Traders browse verified commodities with quality ratings</li>
                        <li>Direct communication initiates the trading process</li>
                        <li>Secure transactions with our escrow service (coming soon)</li>
                    </ol>
                </div>

                <div class="card" data-aos="flip-right">
                    <h2><i class="fas fa-star feature-icon"></i> Why AgriSmart?</h2>
                    <ul>
                        <li>Proprietary AI models with 95%+ accuracy in quality detection</li>
                        <li>Transparent pricing and quality metrics</li>
                        <li>User-friendly interface for all tech levels</li>
                        <li>Secure data handling and privacy protection</li>
                        <li>Continuous platform improvements based on user feedback</li>
                    </ul>
                </div>
            </div>

            <div class="contact-section" data-aos="zoom-in-up">
                <h2><i class="fas fa-envelope feature-icon"></i> Get In Touch</h2>
                <p style="font-size: 1.2rem;">
                    Ready to transform your agricultural trade? Have questions about our platform?<br>
                    Contact us at <strong>smartagriteam@email.com</strong> or call <strong>+1 (555) 123-4567</strong>
                </p>
            </div>

            <div class="footer" data-aos="fade-up">
                &copy; 2025 AgriSmart Commodity Intelligence System. All rights reserved.<br>
                Empowering the future of agricultural commerce.
            </div>
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({
            once: true,
            duration: 1000,
            offset: 50
        });
    </script>
</body>
</html>--%>


<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="NewCISProject.AboutUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - AgriSmart Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />

    <style>
        :root {
            --primary: #2e7d32;
            --primary-dark: #1b5e20;
            --accent: #fdd835;
            --bg-gradient: linear-gradient(to right, #f1f8e9, #dcedc8);
            --shadow: rgba(0, 0, 0, 0.1);
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: var(--bg-gradient);
            color: #333;
            scroll-behavior: smooth;
        }

        .hero {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 100px 20px;
            background: linear-gradient(to right, #a5d6a7, #81c784);
            color: #fff;
            position: relative;
            overflow: hidden;
        }

        .hero::after {
            content: '';
            background: url('https://www.transparenttextures.com/patterns/leaf.png');
            opacity: 0.08;
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
            line-height: 1.6;
        }

        .section {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card {
            background: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px var(--shadow);
            transition: transform 0.3s ease;
            position: relative;
        }

        .card:hover {
            transform: translateY(-8px);
        }

        .card h2 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--primary-dark);
        }

        .card ul, .card ol {
            padding-left: 20px;
        }

        .card li {
            margin-bottom: 10px;
            line-height: 1.6;
        }

        .highlight {
            background: linear-gradient(to right, #e8f5e9, #c8e6c9);
            padding: 40px;
            border-left: 6px solid var(--accent);
            border-radius: 16px;
            margin-bottom: 50px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .highlight h2 {
            margin: 0 0 10px;
            color: var(--primary);
        }

        .contact {
            text-align: center;
            padding: 60px 20px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 8px 30px var(--shadow);
        }

        .contact p {
            font-size: 1.2rem;
            margin: 10px 0;
        }

        .footer {
            text-align: center;
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(10px);
            color: #666;
            font-size: 0.9rem;
            margin-top: 50px;
            border-top: 1px solid #ccc;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2rem;
            }

            .hero p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="hero" data-aos="fade-up">
            <div>
                <h1>Empowering Agriculture with Intelligence</h1>
                <p>AgriSmart connects farmers and traders using cutting-edge AI to simplify, verify, and enhance produce trading across the country.</p>
            </div>
        </div>

        <div class="section">
            <div class="highlight" data-aos="fade-right">
                <h2>Our Mission</h2>
                <p>We empower farmers and traders by removing inefficiencies and creating a transparent ecosystem. Through AI, we simplify quality checks and bring trust to commodity trading.</p>
            </div>

            <div class="cards">
                <div class="card" data-aos="fade-up" data-aos-delay="100">
                    <h2><i class="fas fa-tractor"></i> Farmer Benefits</h2>
                    <ul>
                        <li>Display fresh produce with ease</li>
                        <li>AI quality checks and price suggestions</li>
                        <li>Connect with verified traders</li>
                        <li>Digital record of submissions</li>
                    </ul>
                </div>

                <div class="card" data-aos="fade-up" data-aos-delay="200">
                    <h2><i class="fas fa-chart-line"></i> Trader Benefits</h2>
                    <ul>
                        <li>View freshness & quality insights</li>
                        <li>Instant alerts for new listings</li>
                        <li>Direct farmer communication</li>
                        <li>Data-backed decisions</li>
                    </ul>
                </div>

                <div class="card" data-aos="fade-up" data-aos-delay="300">
                    <h2><i class="fas fa-cogs"></i> How It Works</h2>
                    <ol>
                        <li>Farmer uploads produce photo</li>
                        <li>AI checks for quality + freshness</li>
                        <li>Commodity listed with metrics</li>
                        <li>Trader places interest</li>
                    </ol>
                </div>

                <div class="card" data-aos="fade-up" data-aos-delay="400">
                    <h2><i class="fas fa-star"></i> Why AgriSmart?</h2>
                    <ul>
                        <li>95%+ AI accuracy</li>
                        <li>Modern dashboard experience</li>
                        <li>Seamless transactions (coming soon)</li>
                        <li>Community-first platform</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="section contact" data-aos="zoom-in">
            <h2><i class="fas fa-envelope"></i> Contact Us</h2>
            <p>Email: <strong>support@agrismart.com</strong></p>
            <p>Phone: <strong>+1 800 555 0199</strong></p>
        </div>

        <div class="footer" data-aos="fade-in">
            &copy; 2025 AgriSmart Commodity Intelligence System. All Rights Reserved.
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({ duration: 1000, once: true });
    </script>
</body>
</html>--%>




<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="NewCISProject.AboutUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - CIS Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" />

    <style>
        :root {
            --primary: #2e7d32;
            --primary-dark: #1b5e20;
            --accent: #fdd835;
            --bg-gradient: linear-gradient(to right, #f1f8e9, #dcedc8);
            --shadow: rgba(0, 0, 0, 0.1);
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: var(--bg-gradient);
            color: #333;
            scroll-behavior: smooth;
        }

        .hero {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(to right, #a5d6a7, #81c784);
            color: #fff;
            position: relative;
            overflow: hidden;
        }

        .hero::after {
            content: '';
            background: url('https://www.transparenttextures.com/patterns/leaf.png');
            opacity: 0.08;
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
        }

        .hero h1 {
            font-size: 2.4rem;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .hero p {
            font-size: 1.1rem;
            max-width: 650px;
            margin: 0 auto;
            line-height: 1.6;
        }

        .section {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .card {
            background: #fff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px var(--shadow);
            transition: transform 0.3s ease;
            position: relative;
        }

        .card:hover {
            transform: translateY(-8px);
        }

        .card h2 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--primary-dark);
        }

        .card ul, .card ol {
            padding-left: 20px;
        }

        .card li {
            margin-bottom: 10px;
            line-height: 1.6;
        }

        .highlight {
            background: linear-gradient(to right, #e8f5e9, #c8e6c9);
            padding: 40px;
            border-left: 6px solid var(--accent);
            border-radius: 16px;
            margin-bottom: 50px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .highlight h2 {
            margin: 0 0 10px;
            color: var(--primary);
        }

        .contact {
            text-align: center;
            padding: 60px 20px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 16px;
            box-shadow: 0 8px 30px var(--shadow);
        }

        .contact p {
            font-size: 1.2rem;
            margin: 10px 0;
        }

        .footer {
            text-align: center;
            padding: 40px 20px;
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(10px);
            color: #666;
            font-size: 0.9rem;
            margin-top: 50px;
            border-top: 1px solid #ccc;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 1.8rem;
            }

            .hero p {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="hero" data-aos="fade-up">
            <div>
                <h1>Empowering Agriculture with Intelligence</h1>
                <p>CIS connects farmers and traders using cutting-edge AI to simplify, verify, and enhance produce trading across the country.</p>
            </div>
        </div>

        <div class="section">
            <div class="highlight" data-aos="fade-right">
                <h2>Our Mission</h2>
                <p>We empower farmers and traders by removing inefficiencies and creating a transparent ecosystem. Through AI, we simplify quality checks and bring trust to commodity trading.</p>
            </div>

            <div class="cards">
                <div class="card" data-aos="fade-up" data-aos-delay="100">
                    <h2><i class="fas fa-tractor"></i> Farmer Benefits</h2>
                    <ul>
                        <li>Display fresh produce with ease</li>
                        <li>AI quality checks and price suggestions</li>
                        <li>Connect with verified traders</li>
                        <li>Digital record of submissions</li>
                    </ul>
                </div>

                <div class="card" data-aos="fade-up" data-aos-delay="200">
                    <h2><i class="fas fa-chart-line"></i> Trader Benefits</h2>
                    <ul>
                        <li>View freshness & quality insights</li>
                        <li>Instant alerts for new listings</li>
                        <li>Direct farmer communication</li>
                        <li>Data-backed decisions</li>
                    </ul>
                </div>

                <div class="card" data-aos="fade-up" data-aos-delay="300">
                    <h2><i class="fas fa-cogs"></i> How It Works</h2>
                    <ol>
                        <li>Farmer uploads produce photo</li>
                        <li>AI checks for quality + freshness</li>
                        <li>Commodity listed with metrics</li>
                        <li>Trader places interest</li>
                    </ol>
                </div>

<%--                <div class="card" data-aos="fade-up" data-aos-delay="400">
                    <h2><i class="fas fa-star"></i> Why AgriSmart?</h2>
                    <ul>
                        <li>95%+ AI accuracy</li>
                        <li>Modern dashboard experience</li>
                        <li>Seamless transactions (coming soon)</li>
                        <li>Community-first platform</li>
                    </ul>
                </div>--%>
            </div>
        </div>

        <div class="section contact" data-aos="zoom-in">
            <h2><i class="fas fa-envelope"></i> Contact Us</h2>
            <p>Email: <strong>support@CommodityIntelligenceSystem.com</strong></p>
            <p>Phone: <strong>+1 800 555 0199</strong></p>
        </div>

        <div class="footer" data-aos="fade-in">
            &copy; 2025  Commodity Intelligence System. All Rights Reserved.
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init({ duration: 1000, once: true });
    </script>
</body>
</html>
