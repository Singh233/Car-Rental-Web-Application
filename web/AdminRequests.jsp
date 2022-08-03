<%-- 
    Document   : AdminRequests
    Created on : 20 Feb, 2022, 11:45:02 AM
    Author     : Sanam
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>



<%@page import="newpackage.User" import="java.io.*" import="java.util.*"%><!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Requests Page</title>
        <link href="css/RequestsAdmin.css" rel="stylesheet" type="text/css"/>
        <link href="css/AdminMenuChange.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/loader.css">
        <link rel="stylesheet" href="./css/welcomeCard.css">
        <link rel="stylesheet" href="./css/AdminRequests.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>

        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
            rel="stylesheet"
            />

        <style>



            .column {
                float: left;
                width: 20%;
                padding: 20px 10px;
            }

            /* Remove extra left and right margins, due to padding */
            .row {
                width: 100%;
                margin-top: 180px;
            }

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Responsive columns */
            @media screen and (max-width: 100%) {
                .column {
                    width: 100%;
                    display: block;
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>

    <body>

        <% 



      Blob image = null;
      byte[] imgData = null;
      int pendingRequests = 0;
      int approvedRequests = 0;
      boolean empty = true;
      boolean empty2 = true;
       
       
      String bookingSql = "SELECT * FROM bookings";

      
      try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            
           Statement bookingStatement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
           ResultSet bookingResultSet = bookingStatement.executeQuery(bookingSql);

           while(bookingResultSet.next()) {
               if (bookingResultSet.getString("status").equals("pending")) {
                                                    pendingRequests++;
               }
           }
           bookingResultSet.beforeFirst();
           
while(bookingResultSet.next()) {
               if (bookingResultSet.getString("status").equals("approved")) {
                                                    approvedRequests++;
               }
           }
           
           bookingResultSet.beforeFirst();


        
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
                            <input type="radio" id="radio-1" name="tabs" onClick="functionDahsboard()" />

                            <label class="tab" for="radio-1">
                                <span class="notification">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
                                    <polyline points="9 22 9 12 15 12 15 22" />
                                    </svg>
                                </span>
                                DashBoard
                            </label>
                            <input type="radio" id="radio-2" name="tabs" checked/>
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


                    <button style="border-left: 2px solid #ddd;" class="profile-btn profile-dropdown1">



                        <img src="./img/defaultPro.jpg" />


                        <span style="font-weight: 600">Welcome, Admin</span>
                    </button>
                    <svg viewBox="0 0 24 24" class="dropdown1-svg" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="6 9 12 15 18 9"></polyline>
                    </svg>
                    <div class="dropdown1">
                        <ul class="dropdown1-content">
                            <li onClick="functionProfile()" class="dropdown1-item"><i class="fas fa-user-circle"></i> Profile</li>

                            <li class="divider"></li>
                            <li onClick="functionLogout()" class="dropdown1-item logout"><i class="fas fa-sign-out-alt"></i> Logout</li>
                        </ul>

                    </div>



                </div>
                <button class="messages-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle">
                    <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z" /></svg>
                </button>
            </div>



            <!--            <div class="row">
            
                            <div class="column">
                                <div class="card-group">
            
                                    <div class="card">
            
                                        <form action="CartServlet" method="post">
            
            
            
                                            <div class="logoDrive"><img src="./logos/drive.png" ></div>
                                            <div class="logoSeat">
                                                <img src="./logos/seat.png" >
                                            </div>
                                            <div class="logoMileage">
                                                <img src="./logos/mileage.png">
                                            </div>
                                            <div class="carModel">
            
                                                <img src="./img/totalcars.jpg">
            
            
            
                                            </div>
                                            <div class="name" name="name">0</div>
                                            <div class="price" name="price"><sup>₹</sup><span style="font-size: 2.1rem; font-weight: 700">0</span><sub>/day</sub></div>
            
            
                                            <div style="margin-left: 10px;" class="drive">0</div>
                                            <div class="seats">0</div>
                                            <div class="mileage">0</div>
                                            <button class="add-to-cart">
                                                <div class="default">Rent Now</div>
                                                <div class="success">Added</div>
                                                <div class="cart">
                                                    <div>
                                                        <div></div>
                                                        <div></div>
                                                    </div>
                                                </div>
                                                <div class="dots"></div>
            
                                            </button>
                                        </form>
                                        <div style="z-index: -1" class="ring"></div>
                                    </div>
                                </div>
            
                            </div>
            
            
                        </div>-->



            <div style="display: flex; justify-content: center; align-items: center">


                <div class="app">

                    <div class="wrapper">

                        <div id="pending" class="main-container">
                            <div class="main-header">
                                <div class="header-menu">
                                    <a class="main-header-link is-active" href="#">New Requests</a>
                                    <a class="main-header-link" onclick="functionApproved()">Approved</a>
                                </div>
                            </div>
                            <div class="content-wrapper">
                                <div class="content-wrapper-header">
                                    <div class="content-wrapper-context">
                                        <h3 style="color: white" class="img-content">
                                            <img src="img/chat.png">
                                            <span style="font-size: 1.3rem:">&nbsp; Pending Requests</span>
                                        </h3>
                                        <div class="content-text"><%= pendingRequests %></div>
                                        <!--                                    <button class="content-button">Start free trial</button>-->
                                    </div>
                                </div>
                                <div class="content-section">
                                    <div class="content-section-title">Requests</div>
                                    <ul>
                                        <%  
                                            if (bookingResultSet.next()) {
                                                bookingResultSet.beforeFirst();
                                            
                                            
                                            while(bookingResultSet.next()) {
                                                
                                                String userSql = "SELECT * FROM user WHERE id = " + Integer.toString(bookingResultSet.getInt("owner"));
                                                Statement userStatement = connection.createStatement();
                                                ResultSet userResultSet = userStatement.executeQuery(userSql);
                                                if (bookingResultSet.getString("status").equals("pending")) {
                                                    
                                                


                                        %>
                                        <li class="adobe-product">
                                            <div class="products">
                                                <button style="margin-left: -15px;" class="profile-btn profile-dropdown">

                                                    <% 
                                                if (userResultSet.next()) {
                                                    image = userResultSet.getBlob("image");
                                                    imgData = image.getBytes(1, (int) image.length());
                                                    String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                                    String pic = "data:image/png;base64," + encodedImage;
                                                        if (image.length() > 1000) {
                            
                        
                                                    %> 
                                                    <img src="<%=pic%>" />

                                                    <%  } else {
                            
                        
                                                    %> 
                                                    <img src="./img/defaultPro.jpg" />

                                                    <%  }
                            } 
                            
                        
                                                    %>  
                                                </button>
                                            </div>
                                            <span style='margin-left: -100px'><%= bookingResultSet.getString("name") %></span>
                                            <span style='margin-left: 100px'><%= bookingResultSet.getString("carname") %></span>

                                            <span class="status">
                                                <span class="status-circle gray"></span>
                                                Pending</span>
                                            <div class="button-wrapper">
                                                <form action="RequestServlet" method="post">
                                                    <input type='hidden' name='owner' value='<%= bookingResultSet.getInt("owner")%>'>


                                                    <button type="submit" name="action" value="ApproveServlet" style='margin-right: 10px' class="content-button status-button open"><span> Approve</span></button>
                                                    <button type="submit" name="action" value="RejectServlet" class="reject">Reject </button>
                                                </form>

                                            </div>
                                        </li>
                                        <%  empty = false;
                                            }

                                            
                                        %>
                                       
                                        
                                        <%  
                                             } } if (empty) {

                                            
                                        %>
                                        <div style="display: flex; justify-content: center; align-items: center">
                                            <span style='line-height:  80px'>No New Requests</span>
                                        </div>
                                         <%  
                                            } 
           bookingResultSet.beforeFirst();

                                            
                                        %>


                                    </ul>
                                </div>

                            </div>
                        </div>


                        <div id="approved" class="main-container" style="display: none">
                            <div class="main-header">
                                <div class="header-menu">
                                    <a class="main-header-link" onclick="functionPending()">New Requests</a>
                                    <a class="main-header-link is-active" >Approved</a>
                                </div>
                            </div>
                            <div class="content-wrapper">
                                <div class="content-wrapper-header">
                                    <div class="content-wrapper-context">
                                        <h3 style="color: white" class="img-content">
                                            <img src="img/chat.png">
                                            <span style="font-size: 1.3rem:">&nbsp; Approved Requests</span>
                                        </h3>
                                        <div class="content-text"><%= approvedRequests %></div>
                                        <!--                                    <button class="content-button">Start free trial</button>-->
                                    </div>
                                </div>
                                <div class="content-section">
                                    <div class="content-section-title">Requests</div>
                                    <ul>
                                       <%
                                           if (bookingResultSet.next()) {
                                                bookingResultSet.beforeFirst();
                                                
                                            while(bookingResultSet.next()) {
                                                
                                                String userSql = "SELECT * FROM user WHERE id = " + Integer.toString(bookingResultSet.getInt("owner"));
                                                Statement userStatement = connection.createStatement();
                                                ResultSet userResultSet = userStatement.executeQuery(userSql);
                                                if (bookingResultSet.getString("status").equals("approved")) {
                                                    
                                                


                                        %>
                                        <li class="adobe-product">
                                            <div class="products">
                                                <button style="margin-left: -15px;" class="profile-btn profile-dropdown">

                                                    <% 
                                                if (userResultSet.next()) {
                                                    image = userResultSet.getBlob("image");
                                                    imgData = image.getBytes(1, (int) image.length());
                                                    String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                                    String pic = "data:image/png;base64," + encodedImage;
                                                        if (image.length() > 1000) {
                            
                        
                                                    %> 
                                                    <img src="<%=pic%>" />

                                                    <%  } else {
                            
                        
                                                    %> 
                                                    <img src="./img/defaultPro.jpg" />

                                                    <%  }
                            } 
                            
                        
                                                    %>  
                                                </button>
                                            </div>
                                            <span style='margin-left: -100px'><%= bookingResultSet.getString("name") %></span>
                                            <span style='margin-left: 100px'><%= bookingResultSet.getString("carname") %></span>

                                            <span class="status">
                                                <span class="status-circle green"></span>
                                                Approved</span>

                                        </li>
                                        <%  
                                            empty2 = false;
                                            } 
                                            
                                        %>
                                        
                                        <%  
                                             } } if (empty2) {
                                            
                                        %>
                                        <div style="display: flex; justify-content: center; align-items: center">
                                            <span style='line-height:  80px'>No Approved Requests</span>
                                        </div>
                                        <%  
                                            }
                                            
                                        %>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="overlay-app"></div>
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
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script  src="./js/AdminRequests.js"></script>


        <script>
                                        function functionDahsboard() {
                                            window.location.href = "adminHome.jsp";
                                        }
                                        function functionEdit() {
                                            window.location.href = "AdminEdit.jsp";
                                        }

                                        function functionApproved() {
                                            var x = document.getElementById("approved");
                                            var y = document.getElementById("pending");
                                            if (x.style.display === "none") {
                                                x.style.display = "flex";
                                                y.style.display = "none";

                                            } else {
                                                y.style.display = "none";
                                            }

                                        }

                                        function functionPending() {
                                            var x = document.getElementById("pending");
                                            var y = document.getElementById("approved");

                                            if (x.style.display === "none") {
                                                x.style.display = "flex";
                                                y.style.display = "none";
                                            } else {
                                                x.style.display = "none";
                                            }
                                        }
                                        function functionLogout() {
                window.location.href = "AdminLogoutServlet";
            }

        </script>

    </body>
</html>
