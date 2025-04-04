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
        <link rel="stylesheet" href="/SmartSpa1.0/Frontend_Staff/styles.css">
    </head>
    <body>
        <div class="dashboard-container">
            <jsp:include page="sideBar.jsp" />

            <div class="main-content">
                <jsp:include page="topbar.jsp" />
                <main>
                    <div class="section-header">
                        <div class="header-content">
                            <h2>Treatment Rooms Management</h2>
                            <div class="room-filter">
                                <button class="filter-btn active">All Rooms</button>
                                <button class="filter-btn">Available</button>
                                <button class="filter-btn">Occupied</button>
                                <button class="filter-btn">Maintenance</button>
                            </div>
                        </div>
                        <button class="btn-primary" id="newRoomBtn">
                            <i class="fas fa-plus"></i> Add New Room
                        </button>
                    </div>

                    <div class="rooms-grid">
                        <!-- Rooms List -->
                        <div class="rooms-list">
                            <c:forEach items="${roomList}" var="room">
                                <c:if test="${room.status == 'Available'}">
                                    <div class="room-card available">
                                        <div class="room-header">
                                            <h3>Treatment ${room.name}</h3>
                                            <div class="status-badge">Available</div>
                                        </div>
                                        <div class="room-info">
                                            <div class="room-details">
                                                <div class="detail-item">
                                                    <i class="fas fa-vector-square"></i>
                                                    <span>Size: 25m²</span>
                                                </div>
                                                <div class="detail-item">
                                                    <i class="fas fa-temperature-low"></i>
                                                    <span>Temperature: 24°C</span>
                                                </div>
                                            </div>
                                            <div class="room-features">
                                                <span class="feature-tag"><i class="fas fa-shower"></i> Private Shower</span>
                                                <span class="feature-tag"><i class="fas fa-music"></i> Sound System</span>
                                                <span class="feature-tag"><i class="fas fa-wind"></i> Climate Control</span>
                                            </div>
                                            <!--                                            <div class="room-schedule">
                                                                                            <p><i class="fas fa-clock"></i> Next Booking: 2:30 PM</p>
                                                                                            <p><i class="fas fa-calendar-check"></i> Today's Bookings: 5</p>
                                                                                        </div>-->
                                        </div>
                                        <div class="room-actions">
                                            <button class="btn-icon" title="View Schedule"><i class="fas fa-calendar"></i></button>
                                            <button class="btn-icon" title="Edit Room"><i class="fas fa-edit"></i></button>
                                            <button class="btn-icon" title="Maintenance"><i class="fas fa-tools"></i></button>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${room.status == 'Occupied'}">
                                    <div class="room-card occupied">
                                        <div class="room-header">
                                            <h3>Treatment ${room.name}</h3>
                                            <div class="status-badge">In Session</div>
                                        </div>
                                        <div class="room-info">
                                            <div class="current-session">
                                                <h4>Swedish Massage</h4>
                                                <p>Therapist: Emma Wilson</p>
                                                <p>Ends at: 3:00 PM</p>
                                            </div>
                                            <div class="room-features">
                                                <span class="feature-tag"><i class="fas fa-hot-tub"></i> Hot Stone</span>
                                                <span class="feature-tag"><i class="fas fa-music"></i> Sound System</span>
                                                <span class="feature-tag"><i class="fas fa-wind"></i> Climate Control</span>
                                            </div>
                                        </div>
                                        <div class="room-actions">
                                            <button class="btn-icon" title="View Schedule"><i class="fas fa-calendar"></i></button>
                                            <button class="btn-icon" title="End Session"><i class="fas fa-check"></i></button>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${room.status == 'Maintenance'}">
                                    <div class="room-card maintenance">
                                        <div class="room-header">
                                            <h3>Treatment ${room.name}</h3>
                                            <div class="status-badge">Maintenance</div>
                                        </div>
                                        <div class="room-info">
                                            <div class="maintenance-details">
                                                <p><i class="fas fa-tools"></i> Regular Maintenance</p>
                                                <p><i class="fas fa-clock"></i> Expected Completion: 4:00 PM</p>
                                                <p><i class="fas fa-user-cog"></i> Technician: John Doe</p>
                                            </div>
                                        </div>
                                        <div class="room-actions">
                                            <button class="btn-icon" title="View Details"><i class="fas fa-info-circle"></i></button>
                                            <button class="btn-icon" title="Complete Maintenance"><i class="fas fa-check"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <!-- Summary Column -->
                    <div class="summary-column">
                        <!-- Room Statistics -->
                        <div class="summary-card">
                            <h3>Room Overview</h3>
                            <div class="summary-stats">
                                <div class="stat">
                                    <span class="label">Total Rooms</span>
                                    <span class="value">${roomList.size()}</span>
                                </div>
                                <div class="stat">
                                    <span class="label">Available</span>
                                    <span class="value">3</span>
                                </div>
                                <div class="stat">
                                    <span class="label">Occupied</span>
                                    <span class="value">4</span>
                                </div>
                                <div class="stat">
                                    <span class="label">Maintenance</span>
                                    <span class="value">1</span>
                                </div>
                            </div>
                        </div>

                        <!-- Upcoming Sessions -->
                        <div class="summary-card">
                            <h3>Upcoming Sessions</h3>
                            <div class="upcoming-sessions">
                                <div class="session-item">
                                    <div class="session-time">2:30 PM</div>
                                    <div class="session-info">
                                        <h4>Deep Tissue Massage</h4>
                                        <p>Room 1 ? John Smith</p>
                                    </div>
                                </div>
                                <div class="session-item">
                                    <div class="session-time">3:00 PM</div>
                                    <div class="session-info">
                                        <h4>Aromatherapy</h4>
                                        <p>Room 4 ? Lisa Anderson</p>
                                    </div>
                                </div>
                                <div class="session-item">
                                    <div class="session-time">3:30 PM</div>
                                    <div class="session-info">
                                        <h4>Hot Stone Massage</h4>
                                        <p>Room 2 ? Emma Wilson</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Quick Actions -->
                        <div class="summary-card">
                            <h3>Quick Actions</h3>
                            <div class="quick-actions-grid">
                                <button class="action-btn">
                                    <i class="fas fa-plus-circle"></i>
                                    Add Room
                                </button>
                                <button class="action-btn">
                                    <i class="fas fa-calendar-alt"></i>
                                    View Schedule
                                </button>
                                <button class="action-btn">
                                    <i class="fas fa-tools"></i>
                                    Maintenance
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

    <script>
        document.addEventListener("DOMContentLoaded", function () {
// Lấy các nút lọc và các phần tử phòng
            const filterBtns = document.querySelectorAll(".filter-btn");
            const roomCards = document.querySelectorAll(".room-card");

// Lọc phòng theo trạng thái
            function filterRooms(status) {
                roomCards.forEach(roomCard => {
// Lấy trạng thái từ class của phòng
                    const roomStatus = roomCard.classList.contains("available")
                            ? "Available"
                            : roomCard.classList.contains("occupied")
                            ? "Occupied"
                            : "Maintenance";

// Kiểm tra trạng thái để ẩn hoặc hiển thị phòng
                    if (status === "All" || status === roomStatus) {
                        roomCard.style.display = "block";
                    } else {
                        roomCard.style.display = "none";
                    }
                });
            }

// Gán sự kiện cho các nút lọc
            filterBtns.forEach(btn => {
                btn.addEventListener("click", () => {
// Loại bỏ class "active" khỏi tất cả các nút và thêm vào nút hiện tại
                    filterBtns.forEach(b => b.classList.remove("active"));
                    btn.classList.add("active");

// Gọi hàm filterRooms với trạng thái tương ứng của nút
                    const filterType = btn.textContent.trim();
                    filterRooms(filterType);
                });
            });

// Mặc định hiển thị tất cả các phòng
            filterRooms("All");
        });
    </script>
</body><!-- comment -->

</html>