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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "DeleteCarServlet", urlPatterns = {"/DeleteCarServlet"})
public class DeleteCarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        int carId = Integer.parseInt(request.getParameter("carid"));
        String deleteSql = "DELETE FROM products WHERE id = " + carId;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
            Statement statement = connection.createStatement();
            statement.executeUpdate(deleteSql);
            RequestDispatcher rd = request.getRequestDispatcher("AdminEdit.jsp");
            request.setAttribute("status", "success");
            rd.include(request, response);
        } catch (Exception e) {
            response.sendRedirect("adminHome.jsp");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
