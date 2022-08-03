/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Sanam
 */
public class AdminDatabase {
      Connection con;

    public AdminDatabase(Connection con) {
        this.con = con;
    }
    
     public Admin logAdmin(String userName, String password) {
        Admin admin = null;

        try {
            String query = "select * from admin where username = ? and password = ?";
            PreparedStatement ps = this.con.prepareStatement(query); 
            ps.setString(1,userName);
            ps.setString(2, password);
            
            ResultSet rs  = ps.executeQuery();
            
            if(rs.next()){
                 admin = new Admin();
                 admin.setName(rs.getString("username"));
                 admin.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admin;
    }
}
