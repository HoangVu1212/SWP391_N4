package java.controller.Feedback;

import dal.FeedbackDAO;
import dal.ServiceDAO;
import model.Feedback;
import model.Service;

import java.sql.SQLException;
import java.util.List;

public class FeedbackService {
    private final FeedbackDAO feedbackDAO = new FeedbackDAO();
    private final ServiceDAO serviceDAO = new ServiceDAO();

    public List<Feedback> getFeedbackByService(String serviceIdParam) {
        if (serviceIdParam == null || "all".equals(serviceIdParam)) {
            return feedbackDAO.getFeedback();
        } else {
            int serviceId = Integer.parseInt(serviceIdParam);
            return feedbackDAO.getFeedbackByService(serviceId);
        }
    }

    public List<Service> getAllServices() {
        try {
            return serviceDAO.selectAllServices();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean createFeedback(int personId, String content, int serviceId) {
        return feedbackDAO.createFeedback(personId, content, serviceId);
    }
}
