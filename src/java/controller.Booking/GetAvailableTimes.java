/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Booking;

import dal.AppointmentDAO;
import dal.AppointmentServiceDAO;
import dal.PersonDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Appointment;
import model.Person;
import model.Service;

/**
 *
 * @author ADMIN
 */
public class BookingServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ServiceDAO serviceDAO = new ServiceDAO();
            PersonDAO personDAO = new PersonDAO();
            List<Service> serviceList = serviceDAO.selectAllServices();
            List<Person> staffList = personDAO.getPersonByRole("Staff");
            request.setAttribute("staffList", staffList);
            request.setAttribute("serviceList", serviceList);
            request.setAttribute("today", LocalDate.now());
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AppointmentDAO appointmentDAO = new AppointmentDAO();
            ServiceDAO serviceDAO = new ServiceDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("account") == null) {
                response.sendRedirect("login");
                return;
            }

            Account account = (Account) session.getAttribute("account");
            String[] serviceIds = request.getParameter("selectedServices").split(",");
            int totalDuration = totalDuration(serviceIds);
            LocalDate date = LocalDate.parse(request.getParameter("appointmentDate"));
            LocalTime time = LocalTime.parse(request.getParameter("selectedTime"));
            LocalDateTime start = LocalDateTime.of(date, time);
            String note = request.getParameter("notes");
            Appointment appointment = new Appointment();
            appointment.setStart(start);
            appointment.setEnd(start.plusMinutes(totalDuration));
            appointment.setCreatedDate(LocalDateTime.now());
            appointment.setStatus("Scheduled");
            appointment.setNote(note);
            appointment.setCustomer(account.getPersonInfo());
            if (appointmentDAO.addAppointment(appointment)) {
                for (String id : serviceIds) {
                    int serviceID = Integer.parseInt(id);
                    Service service = serviceDAO.selectService(serviceID);
                    int staffId = Integer.parseInt(request.getParameter("staff"));
                    AppointmentServiceDAO serviceList = new AppointmentServiceDAO();
                    serviceList.addAppointmentService(appointmentDAO.getMaxAppointmentID(), service.getId(), staffId);
                }
            }
            request.setAttribute("success", "Booking successfully!");
            doGet(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("error");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private int totalDuration(String[] serviceIds) throws SQLException {
        ServiceDAO serviceDAO = new ServiceDAO();
        int totalDuration = 0;
        for (String serviceIdStr : serviceIds) {
            int serviceID = Integer.parseInt(serviceIdStr);
            Service service = serviceDAO.selectService(serviceID);
            totalDuration += service.getDuration();
        }
        return totalDuration;
    }
}
