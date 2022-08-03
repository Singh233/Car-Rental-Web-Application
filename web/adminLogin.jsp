<%-- 
    Document   : adminLogin
    Created on : 19 Feb, 2022, 11:42:47 AM
    Author     : Sanam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>    
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-186875127-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-186875127-1');
        </script>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="./css/loader.css">
        <link rel="stylesheet" href="./css/popup.css">
        <link rel="stylesheet" href="./css/adminlogin.css">
        <link href="css/navigationBarLogin.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link href="https://fonts.googleapis.com/css?family=Ma+Shan+Zheng&display=swap" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=WindSong&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
        </style>


    </head>
    <body>

        <header style="font-family: Poppins" class="header">


            <nav style="font-family: Poppins"  class="nav-bar">
                <img style="height: 70px; width: 175px; margin-top: -1.2rem;" src="img/logo2.png" alt="alt"/>

                <ul style="font-family: Poppins; font-size: 25px">

                    <li><a class="nav-link" href="#oxygenos">Offers</a></li>
                    <li><a class="nav-link" href="#resistance">About Us</a></li>
                    <li><a class="nav-link" href="#headphones">Subscription</a></li>
                </ul>
                <button onClick="location.href = 'loginnew.jsp'" style="text-transform: none; font-family: Poppins; " class="custom-btn btn-7"><span><b>User</b> <i class="fas fa-chevron-right"></i></span></button>
            </nav>
        </header>


        <div class="main">

            <div class="wrapper">
                <div class="content">
                    <div class="buttons">
                        <div class="close">
                        </div>
                        <div class="minimize">
                        </div>
                        <div class="zoom">
                        </div>
                    </div>
                    <h2 style="color:black; margin-bottom: 40px">Admin Login</h2>

                    <form style="background: rgba(255, 255, 255, 0);" action="AdminLoginServlet" method="post" >


                        <label style="color:black;" for="uname"><b>Username</b></label>
                        <input type="text" placeholder="Enter Username" name="adminUserName" required>

                        <label style="color:black" for="psw"><b>Password</b></label>
                        <input type="password" placeholder="Enter Password" name="adminPassword" required>

                        <button class="login-button" type="submit">Login</button>
                        <br>
                        
                        
                    </form>


                </div>
            </div>

        </div>


        <footer>
            <p>
                Car Rental System. Made with <i class="fa fa-heart"></i> by
                <a target="_blank" href="#">Group</a>
                - ©2021
                <a target="_blank" href="#">All Rights Reserved.</a>.
            </p>
        </footer> 


    </body>

</html>
