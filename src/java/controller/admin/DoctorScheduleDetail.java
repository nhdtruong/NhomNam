/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.DoctorScheduleDAO;
import dal.DoctorScheduleSlotsDAO;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.WorkingDateSchedule;

/**
 *
 * @author DELL
 */
@WebServlet(name = "DoctorScheduleDetail", urlPatterns = {"/doctorScheduleDetail"})
public class DoctorScheduleDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DoctorScheduleDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoctorScheduleDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String doctorId = (String) session.getAttribute("doctorId");
        String doctorName = (String) session.getAttribute("doctorName");
        
        if (doctorId == null || doctorName == null) {

            String doctorId_r = request.getParameter("doctorId");
            String doctorName_r = request.getParameter("doctorName");
            session.setAttribute("doctorId", doctorId_r);
            session.setAttribute("doctorName", doctorName_r);
            DoctorScheduleDAO DSD = new DoctorScheduleDAO();
            List<WorkingDateSchedule> workingDateSchedule = DSD.getWorkingScheduleOfDoctor(Integer.parseInt(doctorId_r));
            request.setAttribute("WorkingDateSchedule", workingDateSchedule);
            request.setAttribute("doctorName", doctorName_r);
            request.getRequestDispatcher("admin/doctorScheduleDetail.jsp").forward(request, response);

        } else if (doctorId != null && doctorName != null) {

            DoctorScheduleDAO DSD = new DoctorScheduleDAO();
            List<WorkingDateSchedule> workingDateSchedule = DSD.getWorkingScheduleOfDoctor(Integer.parseInt(doctorId));
            request.setAttribute("WorkingDateSchedule", workingDateSchedule);
            request.setAttribute("doctorName", doctorName);
            request.getRequestDispatcher("admin/doctorScheduleDetail.jsp").forward(request, response);

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
