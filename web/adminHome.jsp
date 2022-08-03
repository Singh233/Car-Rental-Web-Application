<%-- 
    Document   : adminHome
    Created on : 19 Feb, 2022, 3:30:17 PM
    Author     : Sanam
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%--<%@page import="org.apache.commons.fileupload.servlet.ServletFIleUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.*"%>--%>


<%@page import="newpackage.User" import="java.io.*" import="java.util.*" import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home Page</title>

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
        <link href="css/adminWelcome.css" rel="stylesheet" type="text/css"/>
        <link href="css/AdminMenuChange.css" rel="stylesheet" type="text/css"/>
        <link href="css/slider.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/loader.css">
        <link rel="stylesheet" href="./css/welcomeCard.css">

        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body>

       <% 



      Blob image = null;
      byte[] imgData = null;
       
      String productSql = "SELECT * FROM products";
      String cartSql = "SELECT * FROM cart";
      String bookingSql = "SELECT * FROM bookings";
      String userSql = "SELECT * FROM user";
 NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));

      int totalUsers = 0;
      int earnings = 0;
      int totalBookings = 0;
      int totalCars = 0;
      int requests = 0;
      int netIncome = 0;

       
      try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");


           Statement productStatement  = connection.createStatement();
          Statement cartStatement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
           Statement bookingStatement  = connection.createStatement();
           Statement userStatement  = connection.createStatement();

            ResultSet productResultSet    = productStatement.executeQuery(productSql);     
            ResultSet cartResultSet    = cartStatement.executeQuery(cartSql);     
            ResultSet bookingResultSet    = bookingStatement.executeQuery(bookingSql);  
            ResultSet userResultSet    = userStatement.executeQuery(userSql);
            
            while(userResultSet.next()) {
                totalUsers++;
            }
            while(bookingResultSet.next()) {
                earnings += (int) bookingResultSet.getDouble("bill");
                totalBookings++;
               if (bookingResultSet.getString("status").equals("pending")) {
                                                    requests++;
               } else if (bookingResultSet.getString("status").equals("approved"))          {
                   netIncome += (int) bookingResultSet.getDouble("bill");
               }
            }
            while(productResultSet.next()) {
                totalCars++;
            }
            
            while(cartResultSet.next()) {
                earnings += Integer.parseInt(cartResultSet.getString("price"));
            }
            cartResultSet.beforeFirst();

            

            
           
            
           

      


        
        %>
        <div class="app-container">
            <div style="  font-family: 'Poppins', sans-serif;" class="app-header">
                <div class="app-header-left">
                    <span class="app-icon"></span>

                    <img style="height: 70px; width: 175px; margin-top: -0.5rem;" src="img/logo2.png" alt="alt"/>
                    <div class="search-wrapper">

                    </div>

                    <div class="app-sidebar">


                        <div class="tabs">
                            <input type="radio" id="radio-1" name="tabs" checked />

                            <label class="tab" for="radio-1">
                                <span class="notification">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
                                    <polyline points="9 22 9 12 15 12 15 22" />
                                    </svg>
                                </span>
                                DashBoard
                            </label>
                            <input type="radio" id="radio-2" name="tabs" onClick="functionRequests()"/>
                            <label class="tab" for="radio-2">
                                <span class="notification">
                                    <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-pie-chart" viewBox="0 0 24 24">
                                    <defs />
                                    <path d="M21.21 15.89A10 10 0 118 2.83M22 12A10 10 0 0012 2v10z" />
                                    </svg>
                                </span>
                                Requests

                            </label>
                            <input type="radio" id="radio-3" name="tabs" onClick="functionEdit()"/>
                            <label class="tab" for="radio-3">
                                <span class="notification">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
                                    <line x1="16" y1="2" x2="16" y2="6" />
                                    <line x1="8" y1="2" x2="8" y2="6" />
                                    <line x1="3" y1="10" x2="21" y2="10" />
                                    </svg>
                                </span>
                                Cars</label>
                            <span class="glider"></span>
                        </div>
                    </div>
                </div>



                <div class="app-header-right">
                    <a href="cart.jsp">
                        <button class="notification-btn"> 
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" width="24" height="24" viewBox="0 0 902.86 902.86" style="enable-background:new 0 0 902.86 902.86;" xml:space="preserve">


                            <path d="M671.504,577.829l110.485-432.609H902.86v-68H729.174L703.128,179.2L0,178.697l74.753,399.129h596.751V577.829z     M685.766,247.188l-67.077,262.64H131.199L81.928,246.756L685.766,247.188z"/>
                            <path d="M578.418,825.641c59.961,0,108.743-48.783,108.743-108.744s-48.782-108.742-108.743-108.742H168.717    c-59.961,0-108.744,48.781-108.744,108.742s48.782,108.744,108.744,108.744c59.962,0,108.743-48.783,108.743-108.744    c0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107,12.59-7.928,26.342-7.928,40.742    C469.675,776.858,518.457,825.641,578.418,825.641z M209.46,716.897c0,22.467-18.277,40.744-40.743,40.744    c-22.466,0-40.744-18.277-40.744-40.744c0-22.465,18.277-40.742,40.744-40.742C191.183,676.155,209.46,694.432,209.46,716.897z     M619.162,716.897c0,22.467-18.277,40.744-40.743,40.744s-40.743-18.277-40.743-40.744c0-22.465,18.277-40.742,40.743-40.742    S619.162,694.432,619.162,716.897z"/>


                            </svg>                    
                        </button>
                    </a>
                    <button class="notification-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" />
                        <path d="M13.73 21a2 2 0 0 1-3.46 0" /></svg>
                    </button>


                    <button class="profile-btn profile-dropdown">



                        <img src="./img/defaultPro.jpg" />


                        <span style="font-weight: 600">Welcome, Admin</span>
                    </button>
                    <svg viewBox="0 0 24 24" class="dropdown-svg" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="6 9 12 15 18 9"></polyline>
                    </svg>
                    <div class="dropdown">
                        <ul class="dropdown-content">
                            <li onClick="functionProfile()" class="dropdown-item"><i class="fas fa-user-circle"></i> Profile</li>

                            <li class="divider"></li>
                            <li onClick="functionLogout()" class="dropdown-item logout"><i class="fas fa-sign-out-alt"></i> Logout</li>
                        </ul>

                    </div>



                </div>
                <button class="messages-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle">
                    <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z" /></svg>
                </button>
            </div>




            <div class="content">

                <!-- Four sections for our code -->
                <div class="section">

                    <div id="MainCard" class="card_1">


                        <div  class="s_title">
                            Estimated Earnings  <img onClick="functionHiddenInfo()" style="height: 30px; width: 30px; cursor: pointer; " src="./img/info.png"/>

                        </div>

                        <div style="font-weight: 500; font-size: 4.5rem; text-align: center; margin-top: 25px">
                            <%= formatter.format(earnings) %>

                        </div>

<div style="font-weight: 600; font-size: 1.5rem;  margin: 20px; float: right;">
                            Net Profit <%= formatter.format(netIncome) %>

                        </div>

                    </div>

                 
                    <div class="card_2">


                        <div class="s_title">
                            Users
                        </div>
                        <div style="font-weight: 500; font-size: 4.5rem; text-align: center; margin-top: 25px">
                            <%= totalUsers %>

                        </div>

                    </div>
                    <div class="card_3">

                        <div class="blur_card">
                        </div>

                        <div style="font-size: 2.5rem" class="s_title">
                            Total Bookings
                        </div>
                        <div style="font-weight: 500; font-size: 4.5rem; text-align: center; margin-top: 20px">
                            <%= totalBookings %>

                        </div>
                        <div style="font-family: 'Poppins', sans-serif; font-weight: 700; font-size: 1.5rem; text-align: center; margin-top: -5px">

                        </div>
                    </div>

                    <div class="card_4">


                        <div style="font-size: 2.5rem" class="s_title">
                            Available Cars
                        </div>
                        <div style="font-weight: 500; font-size: 4.5rem; text-align: center; margin-top: 20px">
                            <%= totalCars %>

                        </div>
                        <div style="font-family: 'Poppins', sans-serif; font-weight: 700; font-size: 1.5rem; text-align: center; margin-top: -5px">

                        </div>
                    </div>

                    <div onClick="location.href = 'AdminRequests.jsp'" class="card_5">

                        <div style="font-size: 2.5rem" class="s_title">
                            New Requests
                        </div>
                        <div style="font-weight: 500; font-size: 4.5rem; text-align: center; margin-top: 20px">
                            <%= requests %>

                        </div>
                        <div style="font-family: 'Poppins', sans-serif; font-weight: 700; font-size: 1.5rem; text-align: center; margin-top: -5px">

                        </div>

                        <img style="height: 50px; width: 50px; float: right; margin-right: 30px; margin-top: 30px" src="./img/next1.png"/>

                    </div>
                </div>





            </div>

        </div>


        <% 
} catch (Exception e) {
           
       }
        %>
        <footer>
            <p>
                Car Rental System. Made with <i class="fa fa-heart"></i> by
                <a target="_blank" href="#">Group</a>
                - ©2021
                <a target="_blank" href="#">All Rights Reserved.</a>.
            </p>
        </footer> 

        <script>
            function functionRequests() {
                window.location.href = "AdminRequests.jsp";
            }

            function functionEdit() {
                window.location.href = "AdminEdit.jsp";
            }

            function functionLogout() {
                window.location.href = "AdminLogoutServlet";
            }

            function functionHiddenInfo() {

            }
        </script>
    </body>
</html>
