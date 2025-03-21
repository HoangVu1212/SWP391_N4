package controller;

import dal.PersonDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Person;

/**
 *
 * @author VoDaiVy
 */
@WebServlet(name = "CustomerController", urlPatterns = {"/customer-management"})
public class CustomerManagementServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PersonDAO personDAO = new PersonDAO();

        List<Person> customerList = personDAO.getPersonByRole("customer");
        System.out.println(customerList.get(0).getId());
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer-management.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
//         Xử lý cập nhật thông tin khách hàng
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String genderStr = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

    }
}