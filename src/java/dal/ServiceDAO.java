package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Service;
import model.CategoryServices;
import model.Department; // Đảm bảo bạn đã tạo class Department

public class ServiceDAO extends DBContext {
    // Lấy danh sách tất cả dịch vụ
    public List<Service> getAllServices() {
        List<Service> list = new ArrayList<>();
        String sql = "SELECT s.service_id, s.service_name, s.is_bhyt, s.description, s.category_service_id, " +
                     "s.department_id, s.fee, s.discount, s.payment_type_id, c.name as category_name " +
                     "FROM [service] s " +
                     "LEFT JOIN category_service c ON s.category_service_id = c.id";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CategoryServices category = new CategoryServices(
                    rs.getInt("category_service_id"),
                    rs.getString("category_name"),
                    null
                );
                Service service = new Service(
                    rs.getInt("service_id"),
                    rs.getString("service_name"),
                    rs.getBoolean("is_bhyt"),
                    rs.getString("description"),
                    category,
                    rs.getInt("department_id"),
                    rs.getDouble("fee"),
                    rs.getDouble("discount"),
                    rs.getInt("payment_type_id")
                );
                list.add(service);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Thêm dịch vụ mới
    public void addService(Service service) {
        String sql = "INSERT INTO [service] (service_id, service_name, is_bhyt, description, category_service_id, " +
                     "department_id, fee, discount, payment_type_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, service.getService_id());
            ps.setString(2, service.getService_name());
            ps.setBoolean(3, service.isIs_bhyt());
            ps.setString(4, service.getDescription());
            ps.setInt(5, service.getCategory_service().getId());
            ps.setInt(6, service.getDepartment_id());
            ps.setDouble(7, service.getFee());
            ps.setDouble(8, service.getDiscount());
            ps.setInt(9, service.getPayment_type_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Cập nhật dịch vụ
    public void updateService(Service service) {
        String sql = "UPDATE [service] SET service_name = ?, is_bhyt = ?, description = ?, " +
                     "category_service_id = ?, department_id = ?, fee = ?, discount = ?, payment_type_id = ? " +
                     "WHERE service_id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, service.getService_name());
            ps.setBoolean(2, service.isIs_bhyt());
            ps.setString(3, service.getDescription());
            ps.setInt(4, service.getCategory_service().getId());
            ps.setInt(5, service.getDepartment_id());
            ps.setDouble(6, service.getFee());
            ps.setDouble(7, service.getDiscount());
            ps.setInt(8, service.getPayment_type_id());
            ps.setInt(9, service.getService_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Xóa dịch vụ
    public void deleteService(int service_id) {
        String sql = "DELETE FROM [service] WHERE service_id = ?";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, service_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // Lấy dịch vụ theo ID (dùng cho chức năng sửa)
    public Service getServiceById(int service_id) {
        String sql = "SELECT s.service_id, s.service_name, s.is_bhyt, s.description, s.category_service_id, " +
                     "s.department_id, s.fee, s.discount, s.payment_type_id, c.name as category_name " +
                     "FROM [service] s " +
                     "LEFT JOIN category_service c ON s.category_service_id = c.id " +
                     "WHERE s.service_id = ?";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            ps.setInt(1, service_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                CategoryServices category = new CategoryServices(
                    rs.getInt("category_service_id"),
                    rs.getString("category_name"),
                    null
                );
                return new Service(
                    rs.getInt("service_id"),
                    rs.getString("service_name"),
                    rs.getBoolean("is_bhyt"),
                    rs.getString("description"),
                    category,
                    rs.getInt("department_id"),
                    rs.getDouble("fee"),
                    rs.getDouble("discount"),
                    rs.getInt("payment_type_id")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    // Lấy danh sách tất cả category (Thể loại)
    public List<CategoryServices> getAllCategories() {
        List<CategoryServices> categories = new ArrayList<>();
        String sql = "SELECT id, name, img FROM category_service WHERE status = 1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                CategoryServices category = new CategoryServices(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("img")
                );
                categories.add(category);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return categories;
    }

    // Lấy danh sách tất cả department (Khoa)
    public List<Department> getAllDepartments() {
        List<Department> departments = new ArrayList<>();
        String sql = "SELECT department_id, department_name, img FROM department";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Department department = new Department(
                    rs.getInt("department_id"),
                    rs.getString("department_name"),
                    rs.getString("img")
                );
                departments.add(department);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return departments;
    }
}