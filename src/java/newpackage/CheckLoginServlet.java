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
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Sanam
 */
@WebServlet(name = "CheckLoginServlet", urlPatterns = {"/CheckLoginServlet"})
public class CheckLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String userSql = "SELECT * FROM user";
        String email = request.getParameter("user");
        String password = String.valueOf(request.getParameter("pass"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

            Statement userStatement = connection.createStatement();

            ResultSet userRs = userStatement.executeQuery(userSql);

            while (userRs.next()) {
                if (userRs.getString("email").equals(email) && userRs.getString("password").equals(password)) {
                    response.getWriter().write("found");
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
