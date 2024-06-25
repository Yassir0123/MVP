<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<style>
body {
    margin: 0;
}

.page-content {
    width: 100%;
    margin: 0 auto;
    background-image: -moz-linear-gradient(-136deg, rgb(126, 64, 246) 0%, rgb(80, 139, 252) 100%);
    background-image: -webkit-linear-gradient(-136deg, rgb(126, 64, 246) 0%, rgb(80, 139, 252) 100%);
    background-image: -ms-linear-gradient(-136deg, rgb(126, 64, 246) 0%, rgb(80, 139, 252) 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.form-v7-content {
    width: 910px;
    margin: 175px 0;
    font-family: 'Open Sans', sans-serif;
    position: relative;
    display: flex;
}

.form-v7-content .form-left {
    position: relative;
    color: #fff;
    font-weight: 400;
    width: 50%;
    margin-top: 32px;
}

.form-v7-content .form-left img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.form-v7-content .form-left .text-1,
.form-v7-content .form-left .text-2 {
    position: absolute;
    text-align: center;
    width: 100%;
}

.form-v7-content .form-left .text-1 {
    font-size: 38px;
    top: 1.5%;
}

.form-v7-content .form-left .text-2 {
    font-size: 16px;
    bottom: 11%;
}

.form-v7-content .form-left .text-2::after {
    position: absolute;
    content: "";
    background: #fff;
    height: 1px;
    width: 228px;
    bottom: -50%;
    left: 50%;
    transform: translateX(-50%);
    opacity: 0.5;
}

.form-v7-content .form-detail {
    padding: 73px 80px 41px;
    position: relative;
    width: 50%;
    background: #fff;
    box-shadow: 0px 8px 20px 0px rgba(0, 0, 0, 0.15);
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.form-v7-content .form-detail h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 30px;
}

.form-v7-content .form-detail .form-row {
    width: 100%;
    position: relative;
    margin-bottom: 25px;
}

.form-v7-content .form-detail .form-row label {
    color: #666;
    font-weight: 600;
    font-size: 15px;
    margin-bottom: 8px;
    display: block;
    font-family: 'Open Sans', sans-serif;
}

.form-v7-content .form-detail .input-text {
    margin-bottom: 28px;
}

.form-v7-content .form-detail input {
    width: 100%;
    padding: 10px 15px;
    border: 2px solid transparent;
    border-bottom: 2px solid #e5e5e5;
    outline: none;
    font-family: 'Open Sans', sans-serif;
    font-size: 16px;
    font-weight: 700;
    color: #333;
    box-sizing: border-box;
}

.form-v7-content .form-detail .form-row input:focus {
    border-bottom: 2px solid #2bb33e;
}

.form-v7-content .form-detail .register {
    background: #373be3;
    border-radius: 4px;
    width: 100%;
    border: none;
    margin: 20px 0;
    cursor: pointer;
    font-family: 'Open Sans', sans-serif;
    color: #fff;
    font-weight: 700;
    font-size: 15px;
}

.form-v7-content .form-detail .register:hover {
    background: #2a2cb0;
}

.form-v7-content .form-detail .form-row-last {
    margin-top: 35px;
    text-align: center;
}

.form-v7-content .form-detail .form-row-last input {
    padding: 15px;
}

.form-v7-content .form-detail .form-row-last p {
    font-weight: 600;
    font-size: 14px;
    color: #666;
}

.form-v7-content .form-detail .form-row-last a {
    font-size: 16px;
    color: #373be3;
    padding-left: 15px;
}

/* Responsive */
@media screen and (max-width: 991px) {
    .form-v7-content {
        margin: 180px 20px;
        flex-direction: column;
    }
    .form-v7-content .form-left {
        width: 100%;
        margin-bottom: -5px;
    }
    .form-v7-content .form-detail {
        padding: 50px;
        width: auto;
    }
    .form-v7-content .form-detail .register {
        margin-bottom: 80px;
    }
}
@media screen and (max-width: 575px) {
    .form-v7-content .form-detail {
        padding: 30px 20px;
        width: auto;
    }
    .form-v7-content .form-detail .register {
        float: none;
        margin-bottom: 10px;
    }
    .form-v7-content .form-detail .form-row-last p {
        margin-left: 0px;
        margin-bottom: 50px;
    }
}
@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-ExtraBold.ttf') format('truetype');
    font-weight: 800;
    font-style: normal;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-Regular.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-ExtraBoldItalic.ttf') format('truetype');
    font-weight: 800;
    font-style: italic;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-Light.ttf') format('truetype');
    font-weight: 300;
    font-style: normal;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-SemiBold.ttf') format('truetype');
    font-weight: 600;
    font-style: normal;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-SemiBoldItalic.ttf') format('truetype');
    font-weight: 600;
    font-style: italic;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-BoldItalic.ttf') format('truetype');
    font-weight: bold;
    font-style: italic;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-Bold.ttf') format('truetype');
    font-weight: bold;
    font-style: normal;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-LightItalic.ttf') format('truetype');
    font-weight: 300;
    font-style: italic;
}

@font-face {
    font-family: 'Open Sans';
    src: url('../fonts/Open_Sans/OpenSans-Italic.ttf') format('truetype');
    font-weight: normal;
    font-style: italic;
}

.back-button {
    position: absolute;
    top: 10px;
    left: 10px;
    z-index: 1000;
}

.back-button .btn {
    display: flex;
    align-items: center;
}

.back-button .btn i {
    margin-right: 5px;
}
</style>
</head>
<body class="form-v7">
<div class="back-button">
    <a class="btn btn-dark" href="home.jsp">
        <i class="fas fa-arrow-left"></i> Go Back
    </a>
</div>
<div class="page-content">
    <div class="form-v7-content">
        <div class="form-left">
            <img src="C:/Users/SAMSUNG/Documents/web/colorlib-regform-33/images/form-v7.jpg" alt="form">
             <p class="text-1">Sign in</p>
            <p class="text-2">Privacy policy & Term of service</p>
        </div>

        <!-- Form -->
        <div class="form-detail">
       
            <form method="post" action="loginservlet">
                <div class="form-row">
                    <label for="your_email">E-MAIL</label>
                    <input type="email" name="email" id="your_email" class="input-text" required>
                </div>
                <div class="form-row">
                    <label for="password">PASSWORD</label>
                    <input type="password" name="password" id="password" class="input-text" required>
                </div>
                <div class="form-row-last">
                    <input type="submit" name="login" class="register" value="Sign In">
                    <p>Or<a href="register.jsp"> Register</a></p>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
