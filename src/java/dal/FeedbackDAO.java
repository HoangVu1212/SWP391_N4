package dal;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Feedback;
import model.Person;
import model.Service;


public class FeedbackDAO extends DBContext {

    public FeedbackDAO() {
    }

    public ArrayList<Feedback> getAllFeedback() {
        ArrayList<Feedback> feedbackList = new ArrayList<>();
        try {
            String sql = "SELECT f.ID, f.Content, p.Name AS customerName, s.name AS serviceName, f.StarRating, f.responseFeedback "
                    + "FROM Feedback f "
                    + "JOIN Person p ON f.CustomerID = p.ID "
                    + "JOIN Services s ON f.ServicesID = s.ID";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("ID"));
                fb.setContent(rs.getString("Content"));

                Person customer = new Person();
                customer.setId(rs.getInt("ID"));
                customer.setName(rs.getString("customerName"));
                fb.setCustomer(customer);

                Service service = new Service();
                service.setId(rs.getInt("ID"));
                service.setName(rs.getString("serviceName"));
                fb.setService(service);
                
                fb.setStarRating(rs.getInt("StarRating"));
                fb.setResponseFeedback(rs.getString("responseFeedback"));
                feedbackList.add(fb);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return feedbackList;
    }

    public ArrayList<Feedback> getFeedback() {
        ArrayList<Feedback> feedback = new ArrayList<>();
        try {
            String sql = "SELECT f.ID, f.Content, p.Name AS customerName, s.name AS serviceName "
                    + "FROM Feedback f "
                    + "JOIN Person p ON f.CustomerID = p.ID "
                    + "JOIN Services s ON f.ServicesID = s.ID";
            PreparedStatement statement = DBContext.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Feedback fb = new Feedback();
                fb.setId(rs.getInt("ID"));
                fb.setContent(rs.getString("Content"));

                Person customer = new Person();
                customer.setId(rs.getInt("ID"));
                customer.setName(rs.getString("customerName"));
                fb.setCustomer(customer);

                Service service = new Service();
                service.setId(rs.getInt("ID"));
                service.setName(rs.getString("serviceName"));
                fb.setService(service);
                
                feedback.add(fb);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return feedback;
    }
}
