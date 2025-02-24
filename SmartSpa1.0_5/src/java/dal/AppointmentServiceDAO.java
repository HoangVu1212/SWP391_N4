/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 * AppointmentService Data Access Object
 *
 * @author ADMIN
 */
public class AppointmentServiceDAO extends DBContext {

    public boolean addAppointmentService(int appointmentID, int serviceID, int staffID) {
        String query = "INSERT INTO Appointment_Service (appointmentID, servicesID, staffID) VALUES (?, ?, ?)";
        try (Connection connection = getConnection(); PreparedStatement stm = connection.prepareStatement(query)) {

            stm.setInt(1, appointmentID);
            stm.setInt(2, serviceID);
            stm.setInt(3, staffID);

            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error while adding appointment service: " + e.getMessage());
            return false;
        }
    }

    

    public boolean deleteServiceID(int appointmentID) {
        String query = "DELETE FROM Appointment_Service WHERE AppointmentID = ?";
        try (Connection connection = getConnection(); PreparedStatement stm = connection.prepareStatement(query)) {

            stm.setInt(1, appointmentID);
            int rowsAffected = stm.executeUpdate();
            System.out.println("Deleted " + rowsAffected + " appointment service(s) with AppointmentID = " + appointmentID);
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error while deleting appointment services: " + e.getMessage());
            return false;
        }
    }

    public static void main(String[] args) {
        AppointmentServiceDAO aO = new AppointmentServiceDAO();
        aO.addAppointmentService(540, 2, 8);
    }
}
