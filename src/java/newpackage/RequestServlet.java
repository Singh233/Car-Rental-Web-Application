/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "RequestServlet", urlPatterns = {"/RequestServlet"})
public class RequestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("/html");
        String action = request.getParameter("action");
        String userId = request.getParameter("owner");

        if ("ApproveServlet".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
                PreparedStatement stmt2 = connection.prepareStatement("UPDATE bookings SET status = ? WHERE owner = " + userId);
                stmt2.setString(1, "approved");
                stmt2.executeUpdate();
                                response.sendRedirect("AdminRequests.jsp");

            } catch (Exception e) {
            }
        } else if ("RejectServlet".equals(action)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection userConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
                PreparedStatement stmt2 = userConnection.prepareStatement("UPDATE bookings SET status = ? WHERE owner = " + userId);
                stmt2.setString(1, "rejected");
                stmt2.executeUpdate();
                                response.sendRedirect("AdminRequests.jsp");

            } catch (Exception e) {
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
