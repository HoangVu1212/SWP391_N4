/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ServiceDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.sql.*;
import model.Service;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author Asus
 */
public class IndexServlet extends HttpServlet {

    private ServiceDAO serviceDAO;

    @Override
    public void init() {
        serviceDAO = new ServiceDAO();  // Initialize your ServiceDAO here
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch services from the database
            List<Service> listServices = serviceDAO.selectAllServices();

            // Set the services list as a request attribute
            request.setAttribute("listServices", listServices);

            // Check if there's a success message in the session
            HttpSession session = request.getSession();
            String successMessage = (String) session.getAttribute("successMessage");

            if (successMessage != null) {
                // Add success message to request attributes and remove it from session
                request.setAttribute("successMessage", successMessage);
                session.removeAttribute("successMessage"); // Remove from session after displaying
            }

            // Forward the request to index.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Cannot retrieve services", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
