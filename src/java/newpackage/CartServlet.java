/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String bookingSql = "SELECT * FROM bookings WHERE owner = " + Integer.toString(Integer.parseInt(request.getParameter("owner")));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection bookingConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
            Statement bookingStatement = bookingConnection.createStatement();
            ResultSet bookingResultSet = bookingStatement.executeQuery(bookingSql);

            if (bookingResultSet.next()) {
                RequestDispatcher rd = request.getRequestDispatcher("catalogue.jsp");
                request.setAttribute("status", "failed");
                rd.include(request, response);
            } else {
                int owner = Integer.parseInt(request.getParameter("owner"));
                int carId = Integer.parseInt(request.getParameter("carId"));
                String name = request.getParameter("name");
                String price = request.getParameter("price");
                String drive = request.getParameter("drive");
                String seats = request.getParameter("seats");
                String mileage = request.getParameter("mileage");
                String timestamp = String.valueOf(timeStamp());
                PrintWriter out = response.getWriter();

                if (timestamp == null) {
                    timestamp = "00";
                }

                if (name != null) {

                    CartModel cartModel = new CartModel(owner, carId, name, price, drive, seats, mileage, timestamp);

                    CartDatabase add = new CartDatabase(ConnectionPro.getConnection());
                    if (add.addToCart(cartModel)) {
                        try {
                            Thread.sleep(2000);
                        } catch (InterruptedException ex) {
                            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
                        }
                        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
                    } else {
//                String errorMessage = "User Available";
//                HttpSession regSession = request.getSession();
//                regSession.setAttribute("RegError", errorMessage);
                        RequestDispatcher rd = request.getRequestDispatcher("catalogue.jsp");
                        request.setAttribute("status", "failed");
                        rd.include(request, response);

                    }
                }
            }

        } catch (Exception e) {

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public LocalDateTime timeStamp() {

        try {
//            String TIME_SERVER = "time-a.nist.gov";
//            NTPUDPClient timeClient = new NTPUDPClient();
//            InetAddress inetAddress = InetAddress.getByName(TIME_SERVER);
//            TimeInfo timeInfo = timeClient.getTime(inetAddress);
//            long returnTime = timeInfo.getReturnTime();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            return now;

        } catch (Exception e) {

        }
        return null;
    }
}
