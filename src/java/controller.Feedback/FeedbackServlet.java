package java.controller.Feedback;

import dal.FeedbackDAO;
import dal.ServiceDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Feedback;
import model.Person;
import model.Service;
import sun.util.calendar.*;

public class FeedbackServlet extends HttpServlet {
    private final FeedbackService feedbackService = new FeedbackService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String serviceIdParam = request.getParameter("serviceId");

        List<Feedback> feedbackList = feedbackService.getFeedbackByService(serviceIdParam);
        List<Service> serviceList = feedbackService.getAllServices();

        request.setAttribute("service", serviceList);
        request.setAttribute("feedback", feedbackList);
        request.getRequestDispatcher("feedback.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account loggedInAccount = (Account) session.getAttribute("account");

        if (loggedInAccount != null) {
            String content = request.getParameter("content");
            int serviceId = Integer.parseInt(request.getParameter("service"));
            Person person = loggedInAccount.getPersonInfo();

            boolean isAdded = feedbackService.createFeedback(person.getId(), content, serviceId);
            response.sendRedirect("feedback?status=" + (isAdded ? "success" : "error"));
        } else {
            request.setAttribute("message", "You need to login to add feedback");
            request.getRequestDispatcher("login").forward(request, response);
        }
    }
}
