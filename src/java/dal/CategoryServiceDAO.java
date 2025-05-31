/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.CategoryServices;
import model.Doctor;

/**
 *
 * @author DELL
 */
public class CategoryServiceDAO  extends DBContext{
     PreparedStatement ps = null;
     ResultSet rs = null;
     
     public List<CategoryServices> getAllCategoryServiceses(){
        List<CategoryServices> list = new ArrayList<>();
        String sql = "select c.id,c.name ,c.img from category_service c" ;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                CategoryServices ca = new CategoryServices(rs.getInt(1),rs.getString(2),rs.getString(3));
                list.add(ca);
            }
            return list;
            
        } catch (Exception e) {
        }
        
        return null;
    } 
}


//toi da o day