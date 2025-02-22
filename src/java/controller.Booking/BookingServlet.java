package controller.Booking;

import dal.ServiceDAO;
import dal.PersonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Service;
import model.Person;

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
            
            // Lấy danh sách dịch vụ và nhân viên
            List<Service> serviceList = serviceDAO.selectAllServices();
            List<Person> staffList = personDAO.getPersonByRole("Staff");
            
            // Gán dữ liệu vào request
            request.setAttribute("staffList", staffList);
            request.setAttribute("serviceList", serviceList);
            request.setAttribute("today", LocalDate.now());
            
            // Chuyển hướng đến trang booking.jsp
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "BookingServlet handles booking appointments.";
    }
}
