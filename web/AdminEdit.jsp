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
        <title>Edit Page</title>
        <link href="css/RequestsAdmin.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/catalogueCard.css">
        <link href="css/AdminMenuChange.css" rel="stylesheet" type="text/css"/>
        <link href="css/slider.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/loader.css">
        <link rel="stylesheet" href="./css/welcomeCard.css">
        <link rel="stylesheet" href="./css/AdminEdit.css">
        <link rel="stylesheet" href="./css/customAlert.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

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



        <div id="reload" class="app-container">
            <div style="  font-family: 'Poppins', sans-serif;" class="app-header">
                <div class="app-header-left">
                    <span class="app-icon"></span>

                    <img style="height: 70px; width: 175px; margin-top: -0.5rem;" src="img/logo2.png" alt="alt"/>
                    <div class="search-wrapper">

                    </div>

                    <div class="app-sidebar">


                        <div class="tabs">
                            <input type="radio" id="radio-1" name="tabs" onClick="functionDashboard()" />

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
                            <input type="radio" id="radio-3" name="tabs" checked/>
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

            <div class="alert hide">
                <span class="fas fa-check-circle"></span>
                <span class="msg">Success</span>
                <div class="close-btn">
                    <span class="fas fa-times"></span>
                </div>
            </div>


            <div style="display: flex; justify-content: center; align-items: center">



                <div  class="app">

                    <% 



     Blob image = null;
     byte[] imgData = null;
     int totalCars = 0;
     int rentedCars = 0;
     int inCart = 0;
       
       
     String carsSql = "SELECT * FROM products";
     String cartSql = "SELECT * FROM cart";

      
     try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            
          Statement carStatement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
          Statement cartStatement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
          ResultSet carResultSet = carStatement.executeQuery(carsSql);
          ResultSet cartResultSet = cartStatement.executeQuery(cartSql);

          while(carResultSet.next()) {
             totalCars++;
          }
          carResultSet.beforeFirst();
           
          while(carResultSet.next()) {
              if (carResultSet.getString("flag").equals("rented")) {
                  rentedCars++;
              }
          }
          carResultSet.beforeFirst();
           
          while(cartResultSet.next()) {
             inCart++;
          }
          cartResultSet.beforeFirst();


        
                    %>

                    <div class="wrapper">

                        <div id="pending" class="main-container">
                            <div class="main-header">
                                <div class="header-menu">
                                    <a class="main-header-link is-active" href="#">Check Cars</a>
                                    <a class="main-header-link" onclick="functionApproved()">Add Cars</a>
                                </div>
                            </div>
                            <div id="ele" class="content-wrapper">
                                <div class="content-wrapper-header">
                                    <div class="content-wrapper-context">
                                        <h3 style="color: white;" class="img-content">
                                            <img style="margin-right: 10px" src="img/available.png">
                                            Available Cars
                                        </h3>
                                        <div class="content-text"><%= totalCars %></div>
                                        <!--                                    <button class="content-button">Start free trial</button>-->
                                    </div>

                                    <div class="content-wrapper-context">
                                        <h3 style="color: white" class="img-content">
                                            <img style="margin-right: 10px" src="img/rented.png">
                                            Cars Rented
                                        </h3>
                                        <div class="content-text"><%= rentedCars %></div>
                                        <!--                                    <button class="content-button">Start free trial</button>-->
                                    </div>

                                    <div class="content-wrapper-context">
                                        <h3 style="color: white" class="img-content">
                                            <img style="margin-right: 10px" src="img/cart.png">
                                            In Cart
                                        </h3>
                                        <div class="content-text"><%= inCart %></div>
                                        <!--                                    <button class="content-button">Start free trial</button>-->
                                    </div>
                                </div>


                                <div class="content-section">
                                    <div style="font-size: 1.2rem" class="content-section-title">Cars</div>
                                    <ul>
                                        <%  
                                            while(carResultSet.next()) {
                                                

                                        %>
                                        <li class="adobe-product">
                                            <div class="products">
                                                <button style="margin-left: -5px; background-color: rgba(255, 255, 255, 0.6); border-radius: 20px" class="profile-btn profile-dropdown">

                                                    <% 
                                                    image = carResultSet.getBlob("image");
                                                    imgData = image.getBytes(1, (int) image.length());
                                                    String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                                    String pic = "data:image/png;base64," + encodedImage;
                                                        if (image.length() > 1000) {
                            
                        
                                                    %> 
                                                    <img style="height: 80%; width: 80%" src="<%=pic%>" />

                                                    <%  } else {
                            
                        
                                                    %> 
                                                    <img src="./img/defaultPro.jpg" />

                                                    <%  }
                           
                                                    %>  
                                                </button>
                                            </div>
                                            <span style='margin-left: 15px;'><%= carResultSet.getString("name") %></span>
<!--                                            <span style='margin-left: 0px'><%= carResultSet.getString("price") %></span>-->
                                            <%  if (carResultSet.getString("flag").equals("rented")) {
                            
                        
                                            %> 
                                            <span style="" class="status">
                                                <span class="status-circle green"></span>
                                                Rented</span>
                                                <%  } 
                           
                                                %>  

                                            <%  
                                                
                                               while (cartResultSet.next()) {
                                                if (cartResultSet.getString("name").equals(carResultSet.getString("name"))) {
                            
                        
                                            %> 
                                            <span style="" class="status">
                                                <span class="status-circle green"></span>
                                                In Cart</span>
                                                <%  } }           
cartResultSet.beforeFirst();

                           
                                                %>  
                                            <div class="button-wrapper">
                                                <form action='DeleteCarServlet' method="post">
                                                    <input type='hidden' name='carid' value='<%= carResultSet.getInt("id")%>'>


                                                    <button type='submit'   class="reject">Remove </button>
                                                </form>

                                            </div>
                                        </li>
                                        <%  
                                             }

                                            
                                        %>


                                    </ul>
                                </div>

                            </div>
                        </div>





                        <div id="approved" class="main-container" style="display: none">
                            <div class="main-header">
                                <div class="header-menu">
                                    <a class="main-header-link" onclick="functionPending()">Check Cars</a>
                                    <a class="main-header-link is-active" >Add Cars</a>
                                </div>
                            </div>
                            <div class="content-wrapper">

                                <div class="content-section">
                                    <div class="content-section-title">Add Car</div>
                                    <ul style="display: flex; justify-content: center; align-items: center">
                                        <div class="card-group">


                                            <div  class="card">


                                                <form id="AddCarForm" style="margin-top: 20px" name="Form" action="ProductServlet" method="post" enctype="multipart/form-data">
                                                    <label for="image">Select Image</label>
                                                    <input style="margin-bottom: 15px; margin-top: 5px; margin-left: 20px" type="file" name="image" required="">

                                                    <label   for="model">Car Model</label>
                                                    <input id="carName"  class="form-styling" type="text" name="name" placeholder="" required="">

                                                    <label for="price">Price</label>
                                                    <input id="carPrice" class="form-styling" type="text" name="price" placeholder="" required="">



                                                    <label for="mode">Drive Mode</label>
                                                    <input id="carMode" class="form-styling" type="text" name="drive" placeholder="" required="">

                                                    <label for="seats">Seats</label>
                                                    <input id="carSeats" class="form-styling" type="text" name="seats" placeholder="" required="">

                                                    <label for="mileage">Mileage</label>
                                                    <input  id="carMileage"class="form-styling" type="text" name="mileage" placeholder="" required="">





                                                    <div style="display: flex; justify-content: center; align-items: center">

                                                        <button type="submit" onClick="functionAlert()" class="add-button">
                                                            Add Car

                                                        </button>
                                                    </div>
                                                </form>

                                            </div>

                                        </div>



                                    </ul>
                                </div>

                            </div>
                        </div>


                    </div>
                    <div class="overlay-app"></div>
                </div>

                <% 
                       } catch (Exception e) {
           
                              }
                %>

                <button id="alertButton" onclick="refreshDiv()" class="alert-button">Refresh</button>

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
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script  src="./js/AdminRequests.js"></script>


        <script>

                    function functionDashboard() {
                        window.location.href = "adminHome.jsp";
                    }

                    function functionRequests() {
                        window.location.href = "AdminRequests.jsp";
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


                    function functionAlert() {
                        var a = document.forms["Form"]["image"].value;
                        var b = document.forms["Form"]["name"].value;
                        var c = document.forms["Form"]["price"].value;
                        var d = document.forms["Form"]["mileage"].value;
                        var e = document.forms["Form"]["seats"].value;
                        var f = document.forms["Form"]["drive"].value;
                        if (a === null || a === "", b === null || b === "",
                                c === null || c === "", d === null || d === "", e === null || e === "", f === null || f === "") {

                        } else {
                            $('.alert').addClass("show");
                            $('.alert').removeClass("hide");
                            $('.alert').addClass("showAlert");
                            setTimeout(function () {
                                $('.alert').removeClass("show");
                                $('.alert').addClass("hide");
                            }, 5000);
                        }



                    }

                    var attribute = '<%= request.getAttribute("status") %>';

                    if (attribute === "success") {
                        setTimeout(function () {
                            $('.alert').addClass("show");
                            $('.alert').removeClass("hide");
                            $('.alert').addClass("showAlert");
                        }, 500);
                        
                        setTimeout(function () {
                                $('.alert').removeClass("show");
                                $('.alert').addClass("hide");
                            }, 5000);
                        
                        document.forms["AddCarForm"]["carName"].value = "";
                        document.forms["AddCarForm"]["carPrice"].value = "";
                        document.forms["AddCarForm"]["carMode"].value = "";
                        document.forms["AddCarForm"]["carSeats"].value = "";
                        document.forms["AddCarForm"]["carMileage"].value = "";

                    }
                

                    $('.close-btn').click(function () {
                        $('.alert').removeClass("show");
                        $('.alert').addClass("hide");
                        
                    });

                    function refreshDiv() {
                        $("#reload").load(location.href + " #reload");
                        $('.alert').removeClass("show");
                        $('.alert').addClass("hide");

                    }
                    function functionLogout() {
                        window.location.href = "AdminLogoutServlet";
                    }

//                                        var form = $('#deleteForm');
//                                        form.submit(function() {
//                                            $.ajax({
//                                                type: form.attr('method'),
//                                                url: form.attr('action'),
//                                                data: form.serialize(),
//                                                success: function (data) {
//                                                      $('.alert').addClass("show");
//                                                    $('.alert').removeClass("hide");
//                                                    $('.alert').addClass("showAlert");
//                                                    setTimeout(function () {
//                                                        $('.alert').removeClass("show");
//                                                        $('.alert').addClass("hide");
//                                                    }, 5000);
//                                                }
//                                            });
//                                    return false;
//                                        });

//                                        function callJqueryAjax() {
//
//                                            $.ajax({
//                                                url: 'DeleteCarServlet',
//                                                method: 'POST',
//                                                data: {carid: $(".carId").val()},
//                                                success: function (resultText) {
//                                                    
//                                                    $('#result').html(resultText);
//                                                },
//                                                error: function (jqXHR, exception) {

//                                                    console.log('Error occured!!');
//                                                }
//                                            });
//                                        }

        </script>

    </body>
</html>
