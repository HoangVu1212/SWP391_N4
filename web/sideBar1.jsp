<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>
        <aside id="sidebar" class="sidebar">

            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-item">
                    <a class="nav-link " href="dashboard">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>
                    </a>
                </li><!-- End Dashboard Nav -->

                <!-- Admin Section -->
                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#admin-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-person-gear"></i><span>Admin</span><i
                            class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="admin-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="accountManagement">
                                <i class="bi bi-circle"></i><span>Account Management</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Admin Nav -->

                <!-- Manager Section -->
                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#manager-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-briefcase"></i><span>Manager</span><i
                            class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="manager-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="servicemanagement">
                                <i class="bi bi-circle"></i><span>Service Management</span>
                            </a>
                        </li>
                        <li>
                            <a href="productlist">
                                <i class="bi bi-circle"></i><span>Product Management</span>
                            </a>
                        </li>
                        <li>
                            <a href="materialmanagement">
                                <i class="bi bi-circle"></i><span>Material Management</span>
                            </a>
                        </li>

                        <!--                            <li>
                                                        <a href="customerClassification">
                                                            <i class="bi bi-circle"></i><span>Customer Classification</span>
                                                        </a>
                                                    </li>-->
                        <li>
                            <a href="payment-management">
                                <i class="bi bi-circle"></i>
                                <span>Payment Management</span>
                            </a>
                        </li>
                        <li>
                            <a href="financial-report">
                                <i class="bi bi-circle"></i>
                                <span>Financial Report</span>
                            </a>
                        </li>
                    </ul>
                </li><!-- End Manager Nav -->


                <li class="nav-item">
                    <a class="nav-link collapsed" data-bs-target="#customer-nav" data-bs-toggle="collapse" href="#">
                        <i class="bi bi-people"></i><span>Staff</span><i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <ul id="customer-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                        <li>
                            <a href="appointment-management">
                                <i class="bi bi-circle"></i><span>Appointment Management</span>
                            </a>
                        </li>
                        <li>
                            <a href="customer-management" >
                                <i class="bi bi-circle"></i><span>Customer Management</span>
                            </a>
                        </li>
                        <li>
                            <a href="schedulemanagement.jsp">
                                <i class="bi bi-circle"></i><span>Schedule Management</span>
                            </a>
                        </li>
                        <li>
                            <a href="feedback-management">
                                <i class="bi bi-circle"></i><span>Feedback Management</span>
                            </a>
                        </li>
                        <li>
                            <a href="blogManagement">
                                <i class="bi bi-circle"></i><span>Blog Management</span>
                            </a>
                        </li>
                    </ul>
                </li> 



            </ul>

        </aside><!-- End Sidebar-->
        <h1>Hello World!</h1>
    </body>

</html>
