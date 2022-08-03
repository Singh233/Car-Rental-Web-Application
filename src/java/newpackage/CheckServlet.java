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
import java.sql.*;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "CheckServlet", urlPatterns = {"/CheckServlet"})
public class CheckServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String userSql = "SELECT * FROM user";
        String email = request.getParameter("user");
        String phone = String.valueOf(request.getParameter("number"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

            Statement userStatement = connection.createStatement();

            ResultSet userRs = userStatement.executeQuery(userSql);

            while (userRs.next()) {
                if (userRs.getString("email").equals(email)) {
                    response.getWriter().write("Email");
                } else if (userRs.getString("number").equals(phone)) {
                    response.getWriter().write("phone");
                }
            }

        } catch (Exception e) {

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
