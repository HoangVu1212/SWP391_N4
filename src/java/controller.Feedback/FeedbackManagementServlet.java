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
 * @author VoDaiVy
 */
public class FeedbackManagementServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        ServiceDAO serviceDAO = new ServiceDAO();

        ArrayList<Feedback> feedback = feedbackDAO.getFeedback();
        ArrayList<Feedback> feedbackList = feedbackDAO.getAllFeedback();
        List<Service> service = null;

        try {
            service = serviceDAO.selectAllServices();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("service", service);
        request.setAttribute("feedbackList", feedbackList);
        System.out.
        println(feedbackList.get(0).toString());
        request.setAttribute("feedback", feedback);
        request.getRequestDispatcher("/Frontend_Staff/feedback.jsp").forward(request, response);
    }
}
