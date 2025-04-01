/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Feedback;

import dal.FeedbackDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feedback;
import model.Service;

/**
 *
 * @author VyVo
 */
public class FeedbackManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Tạo đối tượng FeedbackDAO để gọi phương thức getFeedback
    FeedbackDAO feedbackDAO = new FeedbackDAO();
    
    // Lấy danh sách tất cả các phản hồi
    ArrayList<Feedback> feedbackList = feedbackDAO.getFeedback();
    
    // Đặt danh sách phản hồi vào request attribute để truyền tới JSP
    request.setAttribute("feedback", feedbackList);
    
    // Forward request và response đến trang JSP để hiển thị kết quả
    request.getRequestDispatcher("feedback-management.jsp").forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbackId = request.getParameter("feedbackId");
        String responseFeedback = request.getParameter("responseFeedback");

        try {
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            feedbackDAO.updateResponseFeedbackByID(feedbackId,responseFeedback);
            response.sendRedirect("feedback-management");
        } catch (NumberFormatException e) {

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid feedback ID format.");

        }
    }
}
