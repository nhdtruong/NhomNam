/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Department;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author DELL
 */
public class DepartmentDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Department> getAllDeparment() {
        List<Department> list = new ArrayList<>();
        String sql = "SELECT de.department_id ,de.department_name ,de.img\n"
                + "FROM department de\n"
                + "WHERE department_name <> N'Đa Khoa';";

        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            PreparedStatement ps = connection.prepareStatement(sql);
            while (rs.next()) {
                Department d = new Department(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(d);
            }
            return list;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) {
        DepartmentDAO dao = new DepartmentDAO();
        List<Department> listDe = dao.getAllDeparment();
        System.out.println(listDe);
    }

}
