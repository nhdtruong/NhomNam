package controller;

import dal.ServiceDAO;
import model.Service;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CategoryServices;

@WebServlet(name = "ServiceManageServlet", urlPatterns = {"/servicemanage"})
public class ServiceManageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");//lay tham so action
        ServiceDAO serviceDAO = new ServiceDAO();

        if (action == null || action.equals("list")) {
            // Hienthi danh sach
            request.setAttribute("service", serviceDAO.getAllServices());
            request.getRequestDispatcher("service.jsp").forward(request, response);
        } else if (action.equals("add")) {
            // Chuyen trang them dich vu
            request.setAttribute("category", serviceDAO.getAllCategories());
    request.setAttribute("department", serviceDAO.getAllDepartments());
            request.getRequestDispatcher("admin/addService.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            // chuyen trang sua dich vu
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                Service service = serviceDAO.getServiceById(id);
                if (service != null) {
                    request.setAttribute("editService", service);
                    request.setAttribute("category", serviceDAO.getAllCategories());
                    request.setAttribute("department", serviceDAO.getAllDepartments());
                    request.getRequestDispatcher("admin/editService.jsp").forward(request, response);
                } else {
                    response.sendRedirect("servicemanager?action=all");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("servicemanager?action=all");
            }
        } else if (action.equals("delete")) {
            // xoa dich vu
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                serviceDAO.deleteService(id);
                response.sendRedirect("servicemanager?action=all");
            } catch (NumberFormatException e) {
                response.sendRedirect("servicemanager?action=all");
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");
    ServiceDAO serviceDAO = new ServiceDAO();

    try {
        // Lay cac truong du lieu tu form
        String name = request.getParameter("service_name");
        String isBhytStr = request.getParameter("is_bhyt");
        boolean is_bhyt = "1".equals(isBhytStr); //1true, 2 false
        String description = request.getParameter("description");
        int category_id = Integer.parseInt(request.getParameter("category_service_id"));
        int department_id = Integer.parseInt(request.getParameter("department"));
        double fee = Double.parseDouble(request.getParameter("fee"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        int payment_type = Integer.parseInt(request.getParameter("payment_type_id"));

        // Kiem tra du lieu nhap vao form
        if (name == null || name.trim().isEmpty() || description == null) {
            request.setAttribute("error", "Tên dịch vụ và mô tả không được để trống!");
            if (action.equals("add")) {
                request.setAttribute("category", serviceDAO.getAllCategories());
                request.setAttribute("department", serviceDAO.getAllDepartments());
                request.getRequestDispatcher("admin/addService.jsp").forward(request, response);
            } else {
                int id = Integer.parseInt(request.getParameter("id"));
                Service service = serviceDAO.getServiceById(id);
                request.setAttribute("editService", service);
                request.setAttribute("category", serviceDAO.getAllCategories());
                request.setAttribute("department", serviceDAO.getAllDepartments());
                request.getRequestDispatcher("admin/editService.jsp").forward(request, response);
            }
            return;
        }

        // tao service
        if (action.equals("add")) {
            // tao id tu form
            Service s = new Service(0, name, is_bhyt, description,
                    new CategoryServices(category_id, null, null),
                    department_id, fee, discount, payment_type);
            serviceDAO.addService(s);
            request.setAttribute("success", "Thêm dịch vụ thành công!");
            response.sendRedirect("servicemanager?action=all");
        } else if (action.equals("edit")) {
            // lay id dang sua va update vao data
            int id = Integer.parseInt(request.getParameter("id"));
            Service s = new Service(id, name, is_bhyt, description,
                    new CategoryServices(category_id, null, null),
                    department_id, fee, discount, payment_type);
            serviceDAO.updateService(s);
            request.setAttribute("success", "Cập nhật dịch vụ thành công!");
            response.sendRedirect("servicemanager?action=all");
        }
        // phan check loi neu nhap sai kieu du lieu
    } catch (NumberFormatException e) { 
        request.setAttribute("error", "Dữ liệu nhập vào không hợp lệ!");
        if (action.equals("add")) {
            request.setAttribute("category", serviceDAO.getAllCategories());
            request.setAttribute("department", serviceDAO.getAllDepartments());
            request.getRequestDispatcher("admin/addService.jsp").forward(request, response);
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            Service service = serviceDAO.getServiceById(id);
            request.setAttribute("editService", service);
            request.setAttribute("category", serviceDAO.getAllCategories());
            request.setAttribute("department", serviceDAO.getAllDepartments());
            request.getRequestDispatcher("admin/editService.jsp").forward(request, response);
        }
    } catch (Exception e) {
        request.setAttribute("error", "Lỗi: " + e.getMessage());
        if (action.equals("add")) {
            request.setAttribute("category", serviceDAO.getAllCategories());
            request.setAttribute("department", serviceDAO.getAllDepartments());
            request.getRequestDispatcher("admin/addService.jsp").forward(request, response);
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            Service service = serviceDAO.getServiceById(id);
            request.setAttribute("editService", service);
            request.setAttribute("category", serviceDAO.getAllCategories());
            request.setAttribute("department", serviceDAO.getAllDepartments());
            request.getRequestDispatcher("admin/editService.jsp").forward(request, response);
        }
    }
}
}
