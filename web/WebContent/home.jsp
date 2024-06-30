<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TASKERR</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body, html {
            height: 100%;
            line-height: 1.8;
        }
        #SQ:hover {
            background-color: rgb(17, 7, 30);
            font-size: 18px;
        }
        .bgimg-1 {
            background-position: center;
            background-size: cover;
            background-image: url("/w3images/mac.jpg");
            min-height: 100%;
        }
        .w3-bar .w3-button {
            padding: 16px;
        }
        body {
            background: linear-gradient(to right, rgba(126, 64, 246, 1), rgba(80, 139, 252, 1));
        }
        a:hover {
            text-decoration: none;
            font-size: 15px;
            border: none;
        }
        a {
            font-size: 14px;
            font-weight: bold;
        }
        /* Added CSS for teal background */
        #about {
            background-color: teal;
            padding: 80px 16px;
        }
        /* Additional styling */
        #about h3 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 16px;
        }
        .contact-icons {
            margin-top: 24px;
        }
        .contact-icons a {
            margin-right: 16px;
            padding:15px;
            
        }
    </style>
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top" id="top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <a href="home.jsp" class="w3-bar-item w3-button w3-wide" style="text-decoration: none;">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-todo-list/check1.webp" alt="TASKERR" width="30">
            <b>TASKERR</b>
        </a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
            <a href="tasks.jsp" class="w3-bar-item w3-button"><i class="fa fa-tasks"></i> Tasks</a>
            <a href="groups.jsp" class="w3-bar-item w3-button"><i class="fa fa-users"></i> Groups</a>
            <a href="#features" class="w3-bar-item w3-button">Features</a>
            <!-- Added About link -->
            <a href="#about" class="w3-bar-item w3-button">About</a>

        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->
        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close ×</a>
    <a href="tasks.jsp" class="w3-bar-item w3-button"><i class="fa fa-tasks"></i> Tasks</a>
    <a href="groups.jsp" class="w3-bar-item w3-button"><i class="fa fa-users"></i> Groups</a>
    <a href="#features" class="w3-bar-item w3-button">Features</a>
    <!-- Added About link -->
    <a href="#about" class="w3-bar-item w3-button">About</a>

</nav>

<!-- Header with full-height image -->
<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
    <div class="w3-display-left w3-text-white" style="padding: 48px;">
        <span class="w3-jumbo w3-hide-small">Start your TodoList account Now!</span><br>
        <span class="w3-xxlarge w3-hide-large w3-hide-medium">Start something that matters</span><br>
        <span class="w3-large">Stop wasting valuable time with no task gestion.</span>
        <p><br>
            <a href="login.jsp" class="btn btn-success" id="SQ" style="color: aliceblue; width: fit-content;">Start Today</a>
        </p>
    </div>
    <img src="https://freeiconshop.com/wp-content/uploads/edd/task-done-flat.png" class="w3-display-right w3-padding" style="width: 500px; height: auto; position: absolute; right: 10%; bottom: 20%;">
</header>


<!-- Feature Section -->
<div class="w3-container" style="padding:128px 16px; background-color: aliceblue;" id="features">
    <h3 class="w3-center" style="font-size: 24px; font-weight: bold;">OUR KEY FEATURES</h3>
    <p class="w3-center w3-large">Simplify the realization of your goals and objectives</p>
    <div class="w3-row-padding w3-center" style="margin-top:64px">
        <div class="w3-quarter" style="margin-left:250px; padding-right:90px">
            <img src="https://cdn-icons-png.flaticon.com/512/2098/2098402.png"  class="w3-margin-bottom w3-jumbo" style="width: 100px;">
            <p class="w3-large">Create and Manage Your Tasks</p>
            <p> Organize your goals efficiently by creating and managing your tasks and subtasks. Easily modify or delete tasks as your priorities change, ensuring you stay on track with your progress. Your personalized task list keeps you focused and productive.</p>
        </div>
        <div class="w3-quarter">
            <img src="https://cdn-icons-png.flaticon.com/512/559/559384.png"  class="w3-margin-bottom w3-jumbo" style="width: 100px;">
            <p class="w3-large">Track Your Achievements</p>
            <p>Review your completed tasks to celebrate your achievements and gain inspiration for future goals. Missed a deadline? You'll receive a red notification to alert you of any missed tasks, allowing you to quickly address and complete them. Stay on top of your schedule with timely reminders.</p>
        </div>
        <div class="w3-quarter" style="padding-left:90px">
             <img src="https://cdn-icons-png.flaticon.com/512/921/921347.png"  class="w3-margin-bottom w3-jumbo" style="width: 100px;">
            <p class="w3-large">Collaborate with Your Team</p>
            <p>Join or create groups to collaborate effectively on projects. Assign tasks to team members, ensuring everyone knows their responsibilities. Streamline communication and enhance productivity through structured group task management.</p>
        </div>
    </div>
</div>

<!-- About Section -->
<section id="about">
    <div class="w3-container w3-center">
        <h3 class="w3-center" style="color: white; font-size: 24px; font-weight: bold; margin-bottom: 16px;">ABOUT US</h3>
        <!-- Add your personal story and team links here -->
        <p style="color: white; margin-bottom: 24px;">The idea for Taskerr stemmed from a challenging year our team endured while juggling demanding jobs and rigorous studies. Constantly under pressure from exams, job deadlines, and ongoing projects, we often sacrificed sleep to stay on top of everything, even with early starts. Our saving grace was meticulous task scheduling and deadline management, which provided clarity and structure amidst the chaos. This approach not only helped us navigate through our academic and professional commitments but also sparked conversations with peers facing similar challenges. We realized that many struggled to adapt and plan effectively due to the lack of user-friendly web applications for task management. This gap inspired us to create Taskerr: a task management web app designed to support students and professionals alike in achieving peak productivity. Taskerr offers intuitive interfaces and robust features that empower users to plan, track progress, and collaborate seamlessly—whether working individually or in teams.</p>
        <!-- Links to team members -->
         <h3 class="w3-center" style="color: white; font-size: 24px; font-weight: bold; margin-bottom: 16px;">OUR CONTACTS</h3>
       <div class="contact-icons">
    <a href="https://www.linkedin.com/in/yassir-mzak" style="color: white;"><i class="fa fa-linkedin-square fa-3x"></i></a>
    <a href="https://www.linkedin.com/in/ztote-achraf/" style="color: white;"><i class="fa fa-linkedin-square fa-3x"></i></a>
    <a href="https://github.com/Yassir0123/MVP/tree/main/web" style="color: white;"><i class="fa fa-github-square fa-3x"></i></a>
    <a href="https://x.com/myassir2003" style="color: white;"><i class="fa fa-twitter-square fa-3x"></i></a>
    <a href="https://www.linkedin.com/in/ztote-achraf/" style="color: white;"><i class="fa fa-twitter-square fa-3x"></i></a>
</div>
        <!-- GitHub repository link -->
        <p style="color: white; margin-top: 16px;">GitHub repository: <a href="https://github.com/Yassir0123/MVP/tree/main/web" style="color: white;">https://github.com/Yassir0123/MVP/tree/main/web</a></p>
    </div>
</section>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64" id="contact">
    <a href="#top" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
    <div class="w3-xlarge w3-section">
        <a href="https://www.linkedin.com/in/yassir-mzak" class="fa fa-linkedin w3-hover-opacity"></a>
        <a href="https://www.linkedin.com/in/ztote-achraf/" class="fa fa-linkedin w3-hover-opacity"></a>
        <a href="https://github.com/Yassir0123/MVP/tree/main/web" class="fa fa-github w3-hover-opacity"></a>
        <a href="https://x.com/myassir2003" class="fa fa-twitter w3-hover-opacity"></a>
        <a href="https://www.linkedin.com/in/ztote-achraf/" class="fa fa-twitter w3-hover-opacity"></a>
    </div>
    <p>Powered by <b>ALX</b></p>
</footer>

<script>
    // Modal Image Gallery
    function onClick(element) {
        document.getElementById("img01").src = element.src;
        document.getElementById("modal01").style.display = "block";
        var captionText = document.getElementById("caption");
        captionText.innerHTML = element.alt;
    }

    // Toggle between showing and hiding the sidebar when clicking the menu icon
    var mySidebar = document.getElementById("mySidebar");

    function w3_open() {
        if (mySidebar.style.display === 'block') {
            mySidebar.style.display = 'none';
        } else {
            mySidebar.style.display = 'block';
        }
    }

    // Close the sidebar with the close button
    function w3_close() {
        mySidebar.style.display = "none";
    }
</script>

</body>
</html>
