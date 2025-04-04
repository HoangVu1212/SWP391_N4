<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Account" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // No need to declare session manually; it's already available in JSP
    // You can directly use session
    if (session == null || session.getAttribute("account") == null) {
        // Redirect to login page if session is not found or account is not in session
        response.sendRedirect("../adminLogin");
    } else {
        // Get the account object from session
        Account account = (Account) session.getAttribute("account");

        if (account.getRole() == 3) {
            // Allow access to the page (do nothing and let the JSP render)
        } else {
            // Set an error message and redirect to an error page
            request.setAttribute("errorMessage", "You do not have the required permissions to access the dashboard.");
            request.getRequestDispatcher("error").forward(request, response);
        }
    }
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff Spa Dashboard</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="./styles.css">
    </head>
    <body>
        <div class="dashboard-container">
            <jsp:include page="sideBar.jsp" />

            <div class="main-content">
                <jsp:include page="topbar.jsp" />
                <main>
                    <div class="breadcrumb">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span>
                    </div>

                    <section id="dashboard" class="dashboard-grid">
                        <!-- Today's Overview Card -->
                        <div class="card stats-card">
                            <h3>Today's Overview</h3>
                            <div class="stats-grid">
                                <div class="stat-item">
                                    <i class="fas fa-calendar-check"></i>
                                    <h4>Today's Bookings</h4>
                                    <p>24</p>
                                    <span class="trend up">+12% vs yesterday</span>
                                </div>
                                <div class="stat-item">
                                    <i class="fas fa-user-clock"></i>
                                    <h4>Available Slots</h4>
                                    <p>8</p>
                                    <span class="status">Next at 2:30 PM</span>
                                </div>
                                <div class="stat-item">
                                    <i class="fas fa-user-md"></i>
                                    <h4>Active Therapists</h4>
                                    <p>6/8</p>
                                    <span class="status">2 on break</span>
                                </div>
                                <div class="stat-item">
                                    <i class="fas fa-coins"></i>
                                    <h4>Today's Revenue</h4>
                                    <p>$1,248</p>
                                    <span class="trend up">+8% vs yesterday</span>
                                </div>
                            </div>
                        </div>

                        <!-- Upcoming Appointments Card -->
                        <div class="card">
                            <div class="card-header">
                                <h3>Upcoming Appointments</h3>
                                <button class="btn-text">View All</button>
                            </div>
                            <div class="appointment-list">
                                <div class="appointment-item">
                                    <div class="time-slot">
                                        <span class="time">14:30</span>
                                        <span class="duration">60 min</span>
                                    </div>
                                    <div class="appointment-details">
                                        <h4>Swedish Massage</h4>
                                        <p>Client: Sarah Johnson</p>
                                        <span class="therapist">Therapist: Emma Wilson</span>
                                    </div>
                                    <div class="appointment-status confirmed">
                                        <span>Confirmed</span>
                                    </div>
                                </div>
                                <div class="appointment-item">
                                    <div class="time-slot">
                                        <span class="time">15:00</span>
                                        <span class="duration">90 min</span>
                                    </div>
                                    <div class="appointment-details">
                                        <h4>Deep Tissue Massage</h4>
                                        <p>Client: Mike Peters</p>
                                        <span class="therapist">Therapist: John Smith</span>
                                    </div>
                                    <div class="appointment-status pending">
                                        <span>Pending</span>
                                    </div>
                                </div>
                                <div class="appointment-item">
                                    <div class="time-slot">
                                        <span class="time">16:30</span>
                                        <span class="duration">45 min</span>
                                    </div>
                                    <div class="appointment-details">
                                        <h4>Facial Treatment</h4>
                                        <p>Client: Emily Brown</p>
                                        <span class="therapist">Therapist: Lisa Anderson</span>
                                    </div>
                                    <div class="appointment-status confirmed">
                                        <span>Confirmed</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Quick Actions Card -->
                        <div class="card">
                            <h3>Quick Actions</h3>
                            <div class="quick-actions-grid">
                                <button class="action-btn">
                                    <i class="fas fa-calendar-plus"></i>
                                    New Booking
                                </button>
                                <button class="action-btn">
                                    <i class="fas fa-user-plus"></i>
                                    New Client
                                </button>
                                <button class="action-btn">
                                    <i class="fas fa-clock"></i>
                                    Manage Schedule
                                </button>
                                <button class="action-btn">
                                    <i class="fas fa-gift"></i>
                                    Special Offers
                                </button>
                            </div>
                        </div>

                        <!-- Room Status Card -->
                        <div class="card">
                            <div class="card-header">
                                <h3>Treatment Room Status</h3>
                                <button class="btn-text">Manage Rooms</button>
                            </div>
                            <div class="room-status-grid">
                                <div class="room-status-item occupied">
                                    <h4>Room 1</h4>
                                    <p>Swedish Massage</p>
                                    <span>Ends at 15:00</span>
                                </div>
                                <div class="room-status-item available">
                                    <h4>Room 2</h4>
                                    <p>Available</p>
                                    <span>Next booking: 16:00</span>
                                </div>
                                <div class="room-status-item cleaning">
                                    <h4>Room 3</h4>
                                    <p>Cleaning</p>
                                    <span>Available in 15 min</span>
                                </div>
                                <div class="room-status-item maintenance">
                                    <h4>Room 4</h4>
                                    <p>Maintenance</p>
                                    <span>Until 17:00</span>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="bookings" style="display: none;">
                        <div class="dashboard-grid">
                            <div class="card">
                                <h3>Current Bookings</h3>
                                <div class="booking-list">
                                    <div class="booking-item">
                                        <i class="fas fa-file-pdf"></i>
                                        <div class="booking-details">
                                            <h4>Q4 Financial Summary</h4>
                                            <p>Generated: Dec 10, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="booking-item">
                                        <i class="fas fa-file-excel"></i>
                                        <div class="booking-details">
                                            <h4>Monthly Sales Report</h4>
                                            <p>Generated: Dec 5, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="booking-item">
                                        <i class="fas fa-file-chart-pie"></i>
                                        <div class="booking-details">
                                            <h4>Customer Analytics</h4>
                                            <p>Generated: Dec 1, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="rooms" style="display: none;">
                        <div class="section-header">
                            <h2>Room Management</h2>
                            <div class="header-actions">
                                <div class="filter-group">
                                    <select>
                                        <option>All Floors</option>
                                        <option>Floor 1</option>
                                        <option>Floor 2</option>
                                        <option>Floor 3</option>
                                    </select>
                                    <select>
                                        <option>All Types</option>
                                        <option>Standard</option>
                                        <option>Deluxe</option>
                                        <option>Suite</option>
                                    </select>
                                    <select>
                                        <option>All Status</option>
                                        <option>Available</option>
                                        <option>Occupied</option>
                                        <option>Cleaning</option>
                                        <option>Maintenance</option>
                                    </select>
                                </div>
                                <button class="btn-primary">
                                    <i class="fas fa-plus"></i> Add Room
                                </button>
                            </div>
                        </div>
                        <div class="room-grid">
                            <!-- Room Cards -->
                            <div class="room-card available">
                                <div class="room-status">Available</div>
                                <h3>Room 101</h3>
                                <p>Standard Twin</p>
                                <div class="room-info">
                                    <span><i class="fas fa-user"></i> 2</span>
                                    <span><i class="fas fa-wifi"></i></span>
                                    <span><i class="fas fa-smoking-ban"></i></span>
                                </div>
                                <div class="room-actions">
                                    <button class="btn-secondary">Details</button>
                                    <button class="btn-primary">Book Now</button>
                                </div>
                            </div>
                            <!-- More room cards... -->
                        </div>
                    </section>

                    <section id="housekeeping" style="display: none;">
                        <div class="section-header">
                            <h2>Housekeeping</h2>
                            <div class="header-actions">
                                <button class="btn-primary">
                                    <i class="fas fa-plus"></i> Assign Tasks
                                </button>
                            </div>
                        </div>
                        <div class="task-list">
                            <div class="task-card priority-high">
                                <div class="task-header">
                                    <h3>Room 205 - Deep Cleaning</h3>
                                    <span class="status pending">Pending</span>
                                </div>
                                <div class="task-details">
                                    <p><i class="fas fa-clock"></i> Due: 2:00 PM</p>
                                    <p><i class="fas fa-user"></i> Assigned: Sarah Johnson</p>
                                </div>
                                <div class="task-actions">
                                    <button class="btn-secondary">View Details</button>
                                    <button class="btn-success">Mark Complete</button>
                                </div>
                            </div>
                            <!-- More task cards... -->
                        </div>
                    </section>

                    <section id="maintenance" style="display: none;">
                        <div class="dashboard-grid">
                            <div class="card">
                                <h3>Maintenance Requests</h3>
                                <div class="maintenance-list">
                                    <div class="maintenance-item">
                                        <i class="fas fa-file-pdf"></i>
                                        <div class="maintenance-details">
                                            <h4>Room 101 - Plumbing Issue</h4>
                                            <p>Generated: Dec 10, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="maintenance-item">
                                        <i class="fas fa-file-excel"></i>
                                        <div class="maintenance-details">
                                            <h4>Room 205 - Electrical Issue</h4>
                                            <p>Generated: Dec 12, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="maintenance-item">
                                        <i class="fas fa-file-chart-pie"></i>
                                        <div class="maintenance-details">
                                            <h4>Room 302 - HVAC Issue</h4>
                                            <p>Generated: Dec 15, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="guests" style="display: none;">
                        <div class="dashboard-grid">
                            <div class="card">
                                <h3>Guest Management</h3>
                                <div class="guest-list">
                                    <div class="guest-item">
                                        <i class="fas fa-file-pdf"></i>
                                        <div class="guest-details">
                                            <h4>Q4 Financial Summary</h4>
                                            <p>Generated: Dec 10, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="guest-item">
                                        <i class="fas fa-file-excel"></i>
                                        <div class="guest-details">
                                            <h4>Monthly Sales Report</h4>
                                            <p>Generated: Dec 5, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="guest-item">
                                        <i class="fas fa-file-chart-pie"></i>
                                        <div class="guest-details">
                                            <h4>Customer Analytics</h4>
                                            <p>Generated: Dec 1, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="inventory" style="display: none;">
                        <div class="dashboard-grid">
                            <div class="card">
                                <h3>Inventory Management</h3>
                                <div class="inventory-list">
                                    <div class="inventory-item">
                                        <i class="fas fa-file-pdf"></i>
                                        <div class="inventory-details">
                                            <h4>Q4 Financial Summary</h4>
                                            <p>Generated: Dec 10, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="inventory-item">
                                        <i class="fas fa-file-excel"></i>
                                        <div class="inventory-details">
                                            <h4>Monthly Sales Report</h4>
                                            <p>Generated: Dec 5, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="inventory-item">
                                        <i class="fas fa-file-chart-pie"></i>
                                        <div class="inventory-details">
                                            <h4>Customer Analytics</h4>
                                            <p>Generated: Dec 1, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="reports" style="display: none;">
                        <div class="dashboard-grid">
                            <div class="card">
                                <h3>Recent Reports</h3>
                                <div class="report-list">
                                    <div class="report-item">
                                        <i class="fas fa-file-pdf"></i>
                                        <div class="report-details">
                                            <h4>Q4 Financial Summary</h4>
                                            <p>Generated: Dec 10, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="report-item">
                                        <i class="fas fa-file-excel"></i>
                                        <div class="report-details">
                                            <h4>Monthly Sales Report</h4>
                                            <p>Generated: Dec 5, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                    <div class="report-item">
                                        <i class="fas fa-file-chart-pie"></i>
                                        <div class="report-details">
                                            <h4>Customer Analytics</h4>
                                            <p>Generated: Dec 1, 2023</p>
                                        </div>
                                        <button class="btn-download">Download</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="calendar" style="display: none;">
                        <div class="dashboard-grid">
                            <div class="card">
                                <h3>Upcoming Events</h3>
                                <div class="event-list">
                                    <div class="event-item">
                                        <div class="event-date">
                                            <span class="day">15</span>
                                            <span class="month">Dec</span>
                                        </div>
                                        <div class="event-details">
                                            <h4>Team Meeting</h4>
                                            <p>10:00 AM - Project Review</p>
                                        </div>
                                    </div>
                                    <div class="event-item">
                                        <div class="event-date">
                                            <span class="day">18</span>
                                            <span class="month">Dec</span>
                                        </div>
                                        <div class="event-details">
                                            <h4>Client Presentation</h4>
                                            <p>2:00 PM - Q4 Review</p>
                                        </div>
                                    </div>
                                    <div class="event-item">
                                        <div class="event-date">
                                            <span class="day">20</span>
                                            <span class="month">Dec</span>
                                        </div>
                                        <div class="event-details">
                                            <h4>Budget Meeting</h4>
                                            <p>11:00 AM - Financial Review</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="messages" style="display: none;">
                        <div class="dashboard-grid">
                            <div class="card">
                                <h3>Recent Messages</h3>
                                <div class="message-list">
                                    <div class="message-item unread">
                                        <img src="user-avatar-2.jpg" alt="Sarah Johnson">
                                        <div class="message-content">
                                            <h4>Sarah Johnson</h4>
                                            <p>Updated the project timeline for website redesign...</p>
                                            <span class="message-time">10:30 AM</span>
                                        </div>
                                    </div>
                                    <div class="message-item">
                                        <img src="user-avatar-3.jpg" alt="Mike Peters">
                                        <div class="message-content">
                                            <h4>Mike Peters</h4>
                                            <p>Please review the latest sales figures for Q4...</p>
                                            <span class="message-time">Yesterday</span>
                                        </div>
                                    </div>
                                    <div class="message-item">
                                        <img src="user-avatar-4.jpg" alt="Emma Wilson">
                                        <div class="message-content">
                                            <h4>Emma Wilson</h4>
                                            <p>The client meeting has been rescheduled to...</p>
                                            <span class="message-time">2 days ago</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>        
                </main>
            </div>
        </div>
    </body>
</html>