/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.sql.*;

public class MessageDatabase {

    Connection con;

    public MessageDatabase(Connection con) {
        this.con = con;
    }

    
    public boolean saveMessage(MessageModel messageModel) {
        boolean set = false;
        try {
            String query = "insert into message(name, email, subject, query) values(?, ?, ?, ?)";

            PreparedStatement pt = this.con.prepareStatement(query);
            pt.setString(1, messageModel.getName());
            pt.setString(2, messageModel.getEmail());
            pt.setString(3, messageModel.getSubject());
            pt.setString(4, messageModel.getMessage());
       
            

            pt.executeUpdate();
            set = true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return set;
    }

   
}
