<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="NewCISProject.HomePage" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FarmConnect - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />


<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
    }

  
     .hero {
                height: 100vh;
                width: 100vw;  
                background: url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat center center fixed;
                
                background-repeat: no-repeat;
                background-position: center center;
                background-size: cover; 
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                color: white;
            }

    .hero h1 {
        font-size: 80px;
        font-family: 'Merriweather', serif;
        font-weight: 800;
        color: black;
        text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.6);
        position: relative;
        top: -15px;
        animation: fadeIn 2s ease;
    }

    .hero p {
        color: black;
        font-family:'Segoe UI Variable Text';
        font-size: 25px;
        max-width: 900px;
        margin-top: 20px;
        text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
        position: relative;
        top: -65px;
        animation: fadeIn 2.5s ease;
    }

    .btn {
        padding: 14px 30px;
        border: none;
        border-radius: 40px;
        background: linear-gradient(to right, #42a5f5, #1e88e5);
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        box-shadow: 0 8px 20px rgba(33, 150, 243, 0.3);
        transition: all 0.3s ease;
        position: relative;
    }

    .btn:hover {
        background: linear-gradient(to right, #64b5f6, #1565c0);
        transform: translateY(-3px);
        box-shadow: 0 12px 24px rgba(21, 101, 192, 0.4);
    }

    .btn i {
        margin-right: 8px;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
            align-items: flex-start;
        }

        .navbar ul {
            flex-direction: column;
            width: 100%;
        }

        .navbar ul li {
            margin-left: 0;
            margin-top: 10px;
        }

        .hero h1 {
            font-size: 40px;
        }

        .hero p {
            font-size: 18px;
        }
    }
</style>

</head>
<body>
    <form id="form2" runat="server">
     
      
        
        <div class="hero">
            <h1>Welcome To CIS 🌾</h1>
            <p>Your digital partner in agriculture. From crop care to smart tools, we empower every farmer.</p>
                <div class="buttons">
                    <a href="LoginPage.aspx" class="btn"><i class="fas fa-sign-in-alt"></i>Login</a>
                    <a href="RegistrationPage.aspx" class="btn"><i class="fas fa-user-plus"></i>Register</a>
                    <a href="AboutUs.aspx" class="btn"><i class="fas fa-leaf"></i>About Us</a>
                    <a href="HelpPage.aspx" class="btn"><i class="fas fa-question-circle"></i>Help</a>
                    <a href="AdminPage.aspx" class="btn"><i class="fas fa-question-circle"></i>Admin</a>
              
                    </div>
        </div>


  
    </form>
    <script>
    window.addEventListener('scroll', reveal);

    function reveal() {
        var reveals = document.querySelectorAll('.reveal');
        for (var i = 0; i < reveals.length; i++) {
            var windowHeight = window.innerHeight;
            var elementTop = reveals[i].getBoundingClientRect().top;
            var elementVisible = 100;

            if (elementTop < windowHeight - elementVisible) {
                reveals[i].classList.add("active");
            } else {
                reveals[i].classList.remove("active");
            }
        }
    }
    </script>

</body>
</html>--%>





<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="NewCISProject.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AgriFarm - Home</title>
    <meta charset="utf-8" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Roboto:wght@700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        :root {
            --primary: #4CAF50;
            --primary-dark: #388E3C;
            --secondary: #FFC107;
            --light: #F5F5F5;
            --dark: #212121;
            --white: #FFFFFF;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            overflow-x: hidden;
        }

        /* Header/Navigation */
        .header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 30px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
        }

        .logo {
            font-size: 2em;
            font-weight: 700;
            color: var(--white);
            text-decoration: none;
        }

        .navbar {
            display: flex;
            gap: 40px;
        }

        .navbar a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            font-size: 1.1em;
            transition: 0.3s;
        }

        .navbar a:hover {
            color: var(--secondary);
        }

        /* Hero Section */
        .hero {
            position: relative;
            width: 100%;
            height: 100vh;
            /*background: url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80') no-repeat;*/
           background:url(image/bgimg4.jpg);
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            padding: 0 100px;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
        }

        .hero-content {
            position: relative;
            max-width: 600px;
            color: var(--white);
            z-index: 10;
        }

        .hero-subtitle {
            font-size: 1.5em;
            font-weight: 300;
            letter-spacing: 3px;
            margin-bottom: 15px;
        }

        .hero-title {
            font-size: 4em;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 30px;
            font-family: 'Roboto', sans-serif;
        }

        .hero-description {
            font-size: 1.1em;
            margin-bottom: 40px;
            line-height: 1.6;
        }

        .hero-btn {
            display: inline-block;
            padding: 12px 35px;
            background: var(--primary);
            color: var(--white);
            text-decoration: none;
            font-size: 1.1em;
            font-weight: 500;
            border-radius: 40px;
            transition: 0.3s;
        }

        .hero-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-5px);
        }

        /* Contact Info */
        .contact-info {
            position: absolute;
            bottom: 50px;
            left: 100px;
            color: var(--white);
            font-size: 1.2em;
            z-index: 10;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .header, .hero {
                padding: 30px 50px;
            }
            
            .hero-title {
                font-size: 3em;
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 20px;
                flex-direction: column;
                align-items: flex-start;
            }
            
            .navbar {
                margin-top: 20px;
                gap: 20px;
            }
            
            .hero {
                padding: 0 20px;
                text-align: center;
                justify-content: center;
                position:absolute;
                top:200px;
               
            }
            
            .hero-content {
                max-width: 100%;
                position:relative;
                
            }
            
            .hero-title {
                font-size: 2.5em;
                position:absolute;
                top:500px;
            }
            
            .contact-info {
                left: 20px;
                bottom: 30px;
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header class="header">
            <a href="#" class="logo">Commodity Intelligent <br/> System</a>
            <nav class="navbar">
                <a href="#">Home</a>
                <a href="#">About</a>
                <a href="#">Pages</a>
                <a href="#">Projects</a>
                <a href="#">News</a>
            </nav>
        </header>

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <p class="hero-description" style="position:absolute; top:200px">Your digital partner in agriculture. From crop care to smart tools, we empower every farmer.</p>
               <h1 class="hero-title"   >Agriculture & Eco Farming</h1>

            </div>
            
            
        </section>
    </form>
</body>
</html>--%>





<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="NewCISProject.HomePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Commodity Intelligent System</title>
    <meta charset="utf-8" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Roboto:wght@700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>

        :root {
            --primary: #4CAF50;
            --primary-dark: #388E3C;
            --secondary: #FFC107;
            --light: #F5F5F5;
            --dark: #212121;
            --white: #FFFFFF;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            overflow-x: hidden;
        }

        /* Header/Navigation */
        .header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 30px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
            animation: fadeInDown 1s ease-out;
        }

        .logo {
            font-size: 2em;
            font-weight: 700;
            color: var(--white);
            text-decoration: none;
            line-height: 1.3;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: scale(1.05);
        }

        .navbar {
            display: flex;
            gap: 40px;
        }

        .navbar a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            font-size: 1.1em;
            transition: all 0.3s ease;
            position: relative;
            padding: 5px 0;
        }

        .navbar a:hover {
            color: var(--secondary);
        }

        /* Hero Section */
        .hero {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
        }

        .hero-bg {
            position: absolute;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            transition: opacity 1s ease-in-out;
            opacity: 0;
            animation: zoomIn 15s infinite alternate;
        }

        .hero-bg.active {
            opacity: 1;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2;
        }

        .hero-content {
            position: relative;
            width: 100%;
            color: var(--white);
            z-index: 10;
            padding: 0 100px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
        }

        .hero-description {
            font-size: 1.4em;
            margin-bottom: 20px;
            line-height: 1.6;
            animation: fadeInLeft 1s ease-out 0.7s both;
            max-width: 600px;
        }

        .hero-title {
            font-size: 3em;
            font-weight: 700;
            line-height: 1.2;
            margin: 20px 0;
            font-family: 'Roboto', sans-serif;
            animation: fadeInRight 1s ease-out 0.3s both;
        }

        .hero-middle-title {
            font-size: 2.5em;
            font-weight: 600;
            margin: 20px 0;
            animation: fadeIn 1.5s ease-out 1s both;
        }

        /* Background Zoom Animation */
        @keyframes zoomIn {
            0% { transform: scale(1); }
            100% { transform: scale(1.1); }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInDown {
            from { 
                opacity: 0; 
                transform: translateY(-50px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        @keyframes fadeInLeft {
            from { 
                opacity: 0; 
                transform: translateX(-50px); 
            }
            to { 
                opacity: 1; 
                transform: translateX(0); 
            }
        }

        @keyframes fadeInRight {
            from { 
                opacity: 0; 
                transform: translateX(50px); 
            }
            to { 
                opacity: 1; 
                transform: translateX(0); 
            }
        }
       

        /* Responsive Design */
        @media (max-width: 992px) {
            .header, .hero-content {
                padding: 30px 50px;
            }
            
            .hero-title {
                font-size: 3em;
              
            }
            
            .hero-middle-title {
                font-size: 2em;
            }
        }

      .hero-content {
    position: relative;
    width: 100%;
    color: var(--white);
    z-index: 10;
    padding: 0 100px;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    align-items: flex-start;
}

.hero-bottom-content {
    margin-bottom: 40px;
}

.hero-description {
    font-size: 1.4em;
    margin-bottom: 10px;
    line-height: 1.6;
    max-width: 600px;
    animation: fadeInUp 1s ease-out;
}

/* Bottom title */
.hero-bottom-title {
    font-size: 3em;
    font-weight: 700;
    font-family: 'Roboto', sans-serif;
    animation: fadeInUp 1.2s ease-out;
}

/* Animation */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .hero-content {
        align-items: center;
        padding: 0 20px;
    }

    .hero-description, .hero-bottom-title {
        text-align: center;
    }

    .hero-description {
        font-size: 1.1em;
    }

    .hero-bottom-title {
        font-size: 1.5em;
    }
}


        



    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header class="header">
            <a href="#" class="logo">Commodity Intelligent <br/> System</a>
            <nav class="navbar">
                <a href="LoginPage.aspx" class="btn">Login</a>                   <%--<i class="fas fa-sign-in-alt"></i>--%>
                <a href="RegistrationPage.aspx" class="btn">Register</a>         <%--<i class="fas fa-user-plus"></i>--%>
                <a href="AboutUs.aspx" class="btn">About Us</a>                  <%--<i class="fas fa-leaf"></i>--%>
                <a href="HelpPage.aspx" class="btn">Help</a>                     <%--<i class="fas fa-question-circle"> </i>--%>
                <a href="AdminPage.aspx" class="btn">Admin</a>                   <%--<i class="fas fa-question-circle"></i>--%>
              
              
            </nav>
        </header>

        <!-- Hero Section -->
        <section class="hero">
            <!-- Background Images with Zoom Effect -->
            <div class="hero-bg active" style="background-image: url('https://images.unsplash.com/photo-1464226184884-fa280b87c399?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');"></div>
            <div class="hero-bg" style="background-image: url('https://images.unsplash.com/photo-1523348837708-15d4a09cfac2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');"></div>
            
            <div class="hero-bg " style="background-image: url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');"></div>
            <div class="hero-bg" style="background-image: url('https://images.unsplash.com/photo-1530836369250-ef72a3f5cda8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');"></div>
            <div class="hero-bg" style="background-image: url('https://images.unsplash.com/photo-1500595046743-cd271d694d30?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');"></div>
            
            <!-- Content -->

<div class="hero-content">
    <div class="hero-bottom-content">
        <p class="hero-description">Transforming agriculture with intelligence — CIS connects farmers with future-ready solutions.</p>
        <div class="hero-bottom-title">Bringing Technology to Your Fields and Markets</div>
    </div>
</div>

<%--            <div class="hero-content">
                <p class="hero-description">Transforming agriculture with intelligence — CIS connects farmers with future-ready solutions.</p>
                <h1 class="hero-title">Bringing Technology to Your Fields and Markets</h1>
            </div>--%>

        </section>
    </form>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Background Slideshow with Zoom Effect
            const bgImages = document.querySelectorAll('.hero-bg');
            let currentIndex = 0;

            function changeBackground() {
                // Hide current background
                bgImages[currentIndex].classList.remove('active');

                // Move to next background
                currentIndex = (currentIndex + 1) % bgImages.length;

                // Show next background
                bgImages[currentIndex].classList.add('active');

                // Restart zoom animation
                bgImages[currentIndex].style.animation = 'none';
                void bgImages[currentIndex].offsetWidth; // Trigger reflow
                bgImages[currentIndex].style.animation = 'zoomIn 15s infinite alternate';
            }

            // Change background every 5 seconds
            setInterval(changeBackground, 5000);

            // Header effect on scroll
            window.addEventListener('scroll', function () {
                const header = document.querySelector('.header');
                if (window.scrollY > 100) {
                    header.style.background = 'rgba(0,0,0,0.8)';
                    header.style.padding = '15px 100px';
                } else {
                    header.style.background = 'transparent';
                    header.style.padding = '30px 100px';
                }
            });
        });
    </script>
</body>
</html>