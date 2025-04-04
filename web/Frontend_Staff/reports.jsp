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
                    <div class="section-header">
                        <div class="header-content">
                            <h2>Reports & Analytics</h2>
                            <div class="report-filter">
                                <button class="filter-btn active">All Reports</button>
                                <button class="filter-btn">Financial</button>
                                <button class="filter-btn">Operations</button>
                                <button class="filter-btn">Staff</button>
                                <button class="filter-btn">Client</button>
                            </div>
                        </div>
                        <button class="btn-primary" id="newReportBtn">
                            <i class="fas fa-plus"></i> Generate New Report
                        </button>
                    </div>

                    <div class="reports-grid">
                        <!-- Reports List -->
                        <div class="reports-list">
                            <!-- Financial Reports -->
                            <div class="report-category">
                                <h3>Financial Reports</h3>
                                <div class="report-cards">
                                    <div class="report-card">
                                        <div class="report-header">
                                            <i class="fas fa-chart-line"></i>
                                            <div class="report-info">
                                                <h4>Revenue Analysis</h4>
                                                <span class="report-date">Generated: Dec 15, 2023</span>
                                            </div>
                                            <div class="report-badge">Monthly</div>
                                        </div>
                                        <div class="report-content">
                                            <div class="report-stats">
                                                <div class="stat-item">
                                                    <span class="label">Total Revenue</span>
                                                    <span class="value">$45,280</span>
                                                    <span class="trend up">+12% vs last month</span>
                                                </div>
                                                <div class="stat-item">
                                                    <span class="label">Services Rendered</span>
                                                    <span class="value">342</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="report-actions">
                                            <button class="btn-icon" title="Download PDF"><i class="fas fa-file-pdf"></i></button>
                                            <button class="btn-icon" title="Download Excel"><i class="fas fa-file-excel"></i></button>
                                            <button class="btn-icon" title="Share"><i class="fas fa-share-alt"></i></button>
                                        </div>
                                    </div>

                                    <div class="report-card">
                                        <div class="report-header">
                                            <i class="fas fa-dollar-sign"></i>
                                            <div class="report-info">
                                                <h4>Service Performance</h4>
                                                <span class="report-date">Generated: Dec 14, 2023</span>
                                            </div>
                                            <div class="report-badge">Weekly</div>
                                        </div>
                                        <div class="report-content">
                                            <div class="report-stats">
                                                <div class="stat-item">
                                                    <span class="label">Top Service</span>
                                                    <span class="value">Swedish Massage</span>
                                                    <span class="trend up">32% of revenue</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="report-actions">
                                            <button class="btn-icon" title="Download PDF"><i class="fas fa-file-pdf"></i></button>
                                            <button class="btn-icon" title="Download Excel"><i class="fas fa-file-excel"></i></button>
                                            <button class="btn-icon" title="Share"><i class="fas fa-share-alt"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Operations Reports -->
                            <div class="report-category">
                                <h3>Operations Reports</h3>
                                <div class="report-cards">
                                    <div class="report-card">
                                        <div class="report-header">
                                            <i class="fas fa-clock"></i>
                                            <div class="report-info">
                                                <h4>Resource Utilization</h4>
                                                <span class="report-date">Generated: Dec 15, 2023</span>
                                            </div>
                                            <div class="report-badge">Daily</div>
                                        </div>
                                        <div class="report-content">
                                            <div class="report-stats">
                                                <div class="stat-item">
                                                    <span class="label">Room Utilization</span>
                                                    <span class="value">85%</span>
                                                    <span class="trend up">+5% vs yesterday</span>
                                                </div>
                                                <div class="stat-item">
                                                    <span class="label">Staff Efficiency</span>
                                                    <span class="value">92%</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="report-actions">
                                            <button class="btn-icon" title="Download PDF"><i class="fas fa-file-pdf"></i></button>
                                            <button class="btn-icon" title="Download Excel"><i class="fas fa-file-excel"></i></button>
                                            <button class="btn-icon" title="Share"><i class="fas fa-share-alt"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Summary Column -->
                        <div class="summary-column">
                            <!-- Report Generation -->
                            <div class="summary-card">
                                <h3>Quick Reports</h3>
                                <div class="quick-report-options">
                                    <div class="report-type-select">
                                        <label>Report Type</label>
                                        <select>
                                            <option>Revenue Analysis</option>
                                            <option>Service Performance</option>
                                            <option>Staff Performance</option>
                                            <option>Client Analytics</option>
                                        </select>
                                    </div>
                                    <div class="date-range-select">
                                        <label>Date Range</label>
                                        <select>
                                            <option>Today</option>
                                            <option>This Week</option>
                                            <option>This Month</option>
                                            <option>Custom Range</option>
                                        </select>
                                    </div>
                                    <button class="btn-primary full-width">
                                        <i class="fas fa-file-alt"></i> Generate Report
                                    </button>
                                </div>
                            </div>

                            <!-- Scheduled Reports -->
                            <div class="summary-card">
                                <h3>Scheduled Reports</h3>
                                <div class="scheduled-reports">
                                    <div class="scheduled-report-item">
                                        <div class="report-info">
                                            <h4>Daily Revenue Report</h4>
                                            <p>Sends at 23:00 daily</p>
                                        </div>
                                        <button class="btn-icon" title="Edit Schedule"><i class="fas fa-edit"></i></button>
                                    </div>
                                    <div class="scheduled-report-item">
                                        <div class="report-info">
                                            <h4>Weekly Performance</h4>
                                            <p>Sends every Monday at 09:00</p>
                                        </div>
                                        <button class="btn-icon" title="Edit Schedule"><i class="fas fa-edit"></i></button>
                                    </div>
                                </div>
                            </div>

                            <!-- Quick Actions -->
                            <div class="summary-card">
                                <h3>Quick Actions</h3>
                                <div class="quick-actions-grid">
                                    <button class="action-btn">
                                        <i class="fas fa-plus-circle"></i>
                                        New Report
                                    </button>
                                    <button class="action-btn">
                                        <i class="fas fa-clock"></i>
                                        Schedule
                                    </button>
                                    <button class="action-btn">
                                        <i class="fas fa-share-alt"></i>
                                        Share
                                    </button>
                                    <button class="action-btn">
                                        <i class="fas fa-cog"></i>
                                        Settings
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body><!-- comment -->
</html>