<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Account" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="model.Person" %>
<%
    // Check if session exists and if account is present
    if (session == null || session.getAttribute("account") == null) {
        // Redirect to login page if session or account is not found
        response.sendRedirect("adminLogin.jsp");
    } else {
        // Get the account object from session
        Account account = (Account) session.getAttribute("account");

        // Check the role of the account
        if (account.getRole() == 1 || account.getRole() == 2 || account.getRole() == 3) {
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
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Users / Profile</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.gstatic.com" rel="preconnect">
        <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
        <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">


    </head>

    <body>
        <% Account account = (Account) session.getAttribute("account");
            String displayName = (account
                    != null) ? account.getPersonInfo().getName() : "Guest"; %>

        <%
            Person person = account.getPersonInfo(); // Get additional information from Person

            // Assign person details or default values if person is null
            String fullName = (person != null) ? person.getName() : "Guest";
            String phone = (person != null) ? person.getPhone() : "N/A";
            String email = (person != null) ? person.getEmail() : "N/A";
            String address = (person != null) ? person.getAddress() : "N/A";
            char gender = (person != null) ? person.getGender() : 'N';

            // Handle date of birth formatting
            java.sql.Date dob = (person != null) ? person.getDateOfBirth() : null;
            String dateOfBirth = (dob != null) ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(dob) : "N/A";

            // Get image path from person (if applicable)
        %>

        <jsp:include page="headerHTML.jsp" />

        <!-- ======= Sidebar ======= -->
        <jsp:include page="sideBar.jsp" />

        <main id="main" class="main">

            <div class="pagetitle">
                <h1>Profile</h1>
                <nav>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="dashboard">Home</a></li>
                        <li class="breadcrumb-item">Users</li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                </nav>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-4">

                        <div class="card">
                            <div
                                class="card-body profile-card pt-4 d-flex flex-column align-items-center">

                                     <img src="<%= (person != null && person.getImage() != null && !person.getImage().isEmpty())
                                             ? " img/" + person.getImage() : "img/default-avatar.jpg"%>" alt="Profile
                                     Picturea" class="rounded-circle" style="width: 100px; height:
                                     100px; object-fit: cover;">
                                <h2>
                                    <%= (displayName != null) ? displayName : "Guest"%>
                                </h2>
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-8">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab"
                                                data-bs-target="#profile-overview">Overview</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab"
                                                data-bs-target="#profile-edit"
                                                onclick="setActiveTab('profile-edit')">Edit
                                            Profile</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab"
                                                data-bs-target="#profile-change-password"
                                                onclick="setActiveTab('profile-change-password')">Change
                                            Password</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab"
                                                data-bs-target="#referral-code">Referral
                                            Code</button>
                                    </li>
                                </ul>



                                <div class="tab-content pt-2">

                                    <div class="tab-pane fade show active profile-overview"
                                         id="profile-overview">


                                        <h5 class="card-title">Profile Details</h5>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label ">Full Name
                                            </div>
                                            <div class="col-lg-9 col-md-8">
                                                <%= fullName%>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label ">Date of Birth
                                            </div>
                                            <div class="col-lg-9 col-md-8">
                                                <%= dateOfBirth%>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Gender</div>
                                            <div class="col-lg-9 col-md-8">
                                                <%= (gender == 'M') ? "Male" : (gender == 'F')
                                                        ? "Female" : "Other"%>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Phone</div>
                                            <div class="col-lg-9 col-md-8">
                                                <%= phone%>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Email</div>
                                            <div class="col-lg-9 col-md-8">
                                                <%= email%>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Address</div>
                                            <div class="col-lg-9 col-md-8">
                                                <%= address%>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="tab-pane fade profile-edit pt-3"
                                         id="profile-edit">

                                        <!-- Profile Edit Form -->
                                        <form action="updateProfile" method="post"
                                              enctype="multipart/form-data">
                                            <div class="row mb-3">
                                                <label for="profileImage"
                                                       class="col-md-4 col-lg-3 col-form-label">Profile
                                                    Image</label>
                                                <div class="col-md-8 col-lg-9">
                                                     <img id="previewImage" src="<%= (person != null && person.getImage() != null && !person.getImage().isEmpty())
                                                             ? " img/" + person.getImage() : "img/default-avatar.jpg"%>" alt="Profile">
                                                    <div class="pt-2">
                                                        <!-- Image upload input -->
                                                        <label class="btn btn-primary btn-sm"
                                                               title="Upload new profile image">
                                                            <i class="bi bi-upload"></i> Upload
                                                            <input type="file"
                                                                   name="profileImage"
                                                                   id="profileImageInput"
                                                                   style="display: none;"
                                                                   accept="image/*"
                                                                   onchange="previewSelectedImage(event)">
                                                        </label>
                                                        <!-- Image delete button -->
                                                        <button type="button"
                                                                onclick="deleteProfileImage()"
                                                                class="btn btn-danger btn-sm"
                                                                title="Remove my profile image">
                                                            <i class="bi bi-trash"></i> Delete
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row mb-3">
                                                <label for="fullName"
                                                       class="col-md-4 col-lg-3 col-form-label">Full
                                                    Name</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="fullName" type="text"
                                                           class="form-control" id="fullName"
                                                           value="<%= fullName%>">
                                                </div>
                                            </div>


                                            <div class="row mb-3">
                                                <label for="dateOfBirth"
                                                       class="col-md-4 col-lg-3 col-form-label">Date
                                                    of Birth</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="dateOfBirth" type="date"
                                                           class="form-control" id="dateOfBirth"
                                                           value="<%= dateOfBirth%>">
                                                </div>
                                            </div>


                                            <div class="row mb-3">
                                                <label for="gender"
                                                       class="col-md-4 col-lg-3 col-form-label">Gender</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <select name="gender" class="form-control"
                                                            id="gender" required>
                                                            <option value="M" <%=(gender == 'M')
                                                                    ? "selected" : ""%>>Male</option>
                                                                <option value="F" <%=(gender == 'F')
                                                                        ? "selected" : ""%>>Female</option>
                                                                <option value="O" <%=(gender == 'O')
                                                                        ? "selected" : ""%>>Other</option>
                                                    </select>
                                                </div>
                                            </div>


                                            <div class="row mb-3">
                                                <label for="Address"
                                                       class="col-md-4 col-lg-3 col-form-label">Address</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="address" type="text"
                                                           class="form-control" id="Address"
                                                           value="<%= address%>">
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="Phone"
                                                       class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="phone" type="text"
                                                           class="form-control" id="Phone"
                                                           value="<%= phone%>">
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="Email"
                                                       class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="email" type="email"
                                                           class="form-control" id="Email"
                                                           value="<%= email%>">
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit"
                                                        class="btn btn-primary">Save
                                                    Changes</button>
                                            </div>
                                        </form><!-- End Profile Edit Form -->

                                    </div>



                                    <div class="tab-pane fade pt-3"
                                         id="profile-change-password">
                                        <!-- Change Password Form -->
                                        <form action="changePassword" method="post"
                                              onsubmit="return validateChangePasswordForm()">
                                            <div class="row mb-3">
                                                <label for="currentPassword"
                                                       class="col-md-4 col-lg-3 col-form-label">Current
                                                    Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <div
                                                        style="display: flex; align-items: center;">
                                                        <input name="currentPassword"
                                                               type="password" class="form-control"
                                                               id="currentPassword" required>
                                                        <button type="button"
                                                                class="show_password"
                                                                onclick="togglePassword('currentPassword')"
                                                                style="background:none; border:none; cursor:pointer; margin-left: 5px;">
                                                            <svg fill="none" viewBox="0 0 24 24"
                                                                 height="24" width="24"
                                                                 xmlns="http://www.w3.org/2000/svg"
                                                                 class="icon">
                                                            <path stroke-linecap="round"
                                                                  stroke-width="2"
                                                                  stroke="#141B34"
                                                                  d="M12 4.5C6.5 4.5 2 12 2 12s4.5 7.5 10 7.5 10-7.5 10-7.5-4.5-7.5-10-7.5zM12 17.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zM12 9c-1.39 0-2.5 1.11-2.5 2.5S10.61 14 12 14s2.5-1.11 2.5-2.5S13.39 9 12 9z">
                                                            </path>
                                                            </svg>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="newPassword"
                                                       class="col-md-4 col-lg-3 col-form-label">New
                                                    Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <div
                                                        style="display: flex; align-items: center;">
                                                        <input name="newPassword"
                                                               type="password" class="form-control"
                                                               id="newPassword" required>
                                                        <button type="button"
                                                                class="show_password"
                                                                onclick="togglePassword('newPassword')"
                                                                style="background:none; border:none; cursor:pointer; margin-left: 5px;">
                                                            <svg fill="none" viewBox="0 0 24 24"
                                                                 height="24" width="24"
                                                                 xmlns="http://www.w3.org/2000/svg"
                                                                 class="icon">
                                                            <path stroke-linecap="round"
                                                                  stroke-width="2"
                                                                  stroke="#141B34"
                                                                  d="M12 4.5C6.5 4.5 2 12 2 12s4.5 7.5 10 7.5 10-7.5 10-7.5-4.5-7.5-10-7.5zM12 17.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zM12 9c-1.39 0-2.5 1.11-2.5 2.5S10.61 14 12 14s2.5-1.11 2.5-2.5S13.39 9 12 9z">
                                                            </path>
                                                            </svg>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="renewPassword"
                                                       class="col-md-4 col-lg-3 col-form-label">Re-enter
                                                    New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <div
                                                        style="display: flex; align-items: center;">
                                                        <input name="renewPassword"
                                                               type="password" class="form-control"
                                                               id="renewPassword" required>
                                                        <button type="button"
                                                                class="show_password"
                                                                onclick="togglePassword('renewPassword')"
                                                                style="background:none; border:none; cursor:pointer; margin-left: 5px;">
                                                            <svg fill="none" viewBox="0 0 24 24"
                                                                 height="24" width="24"
                                                                 xmlns="http://www.w3.org/2000/svg"
                                                                 class="icon">
                                                            <path stroke-linecap="round"
                                                                  stroke-width="2"
                                                                  stroke="#141B34"
                                                                  d="M12 4.5C6.5 4.5 2 12 2 12s4.5 7.5 10 7.5 10-7.5 10-7.5-4.5-7.5-10-7.5zM12 17.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zM12 9c-1.39 0-2.5 1.11-2.5 2.5S10.61 14 12 14s2.5-1.11 2.5-2.5S13.39 9 12 9z">
                                                            </path>
                                                            </svg>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit"
                                                        class="btn btn-primary">Change
                                                    Password</button>
                                            </div>
                                        </form><!-- End Change Password Form -->

                                    </div>

                                    <div class="tab-pane fade pt-3" id="referral-code">
                                        <c:choose>
                                            <c:when test="${referral != null}">
                                                <!-- Nội dung khi referral tồn tại -->
                                                <h5 class="card-title">Referral Code:
                                                    ${referral.code}</h5>
                                                <h5 class="card-title">Value of Code:
                                                    ${referral.value}%</h5>
                                                </c:when>
                                                <c:otherwise>
                                                <!-- Nội dung khi referral không tồn tại -->
                                                <h5 class="card-title">Referral code does not
                                                    exist.</h5>
                                                </c:otherwise>
                                            </c:choose>


                                    </div>
                                </div><!-- End Bordered Tabs -->

                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <script>
                // Function to set active tab in the URL
                function setActiveTab(tabId) {
                    location.hash = tabId;
                }

                // On page load, set the active tab based on the URL hash
                document.addEventListener("DOMContentLoaded", function () {
                    const hash = location.hash.substring(1); // Remove the '#' character
                    if (hash) {
                        const targetTab = document.querySelector(`[data-bs-target="#${hash}"]`);
                        if (targetTab) {
                            new bootstrap.Tab(targetTab).show(); // Show the tab based on the hash
                        }
                    }
                });
            </script>
            <script>
                function validateChangePasswordForm() {
                    const currentPassword = document.getElementById('currentPassword').value;
                    const newPassword = document.getElementById('newPassword').value;
                    const renewPassword = document.getElementById('renewPassword').value;

                    if (newPassword.length < 8) {
                        alert('New password must be at least 8 characters long.');
                        return false;
                    }

                    if (newPassword !== renewPassword) {
                        alert('New password and confirmation do not match.');
                        return false;
                    }

                    return true;
                }

                // Function to toggle the visibility of password fields
                function togglePassword(fieldId) {
                    const passwordField = document.getElementById(fieldId);
                    const button = event.currentTarget;
                    const path = button.querySelector('path');

                    if (passwordField.type === 'password') {
                        passwordField.type = 'text';
                        path.setAttribute('d', 'M12 4.5C6.5 4.5 2 12 2 12s4.5 7.5 10 7.5 10-7.5 10-7.5-4.5-7.5-10-7.5zM12 17.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zM12 9c1.39 0 2.5 1.11 2.5 2.5S10.61 14 12 14s2.5-1.11 2.5-2.5S13.39 9 12 9z');
                    } else {
                        passwordField.type = 'password';
                        path.setAttribute('d', 'M12 4.5C6.5 4.5 2 12 2 12s4.5 7.5 10 7.5 10-7.5 10-7.5-4.5-7.5-10-7.5zM12 17.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zM12 9c1.39 0 2.5 1.11-2.5 2.5S10.61 14 12 14s2.5-1.11 2.5-2.5S13.39 9 12 9z');
                    }
                }
            </script>
            <script>
                // Xem trước ảnh khi người dùng chọn file
                function previewSelectedImage(event) {
                    const previewImage = document.getElementById('previewImage');
                    const file = event.target.files[0];

                    if (file) {
                        const reader = new FileReader();

                        reader.onload = function (e) {
                            previewImage.src = e.target.result;
                        };

                        reader.readAsDataURL(file);
                    }
                }

                // Đặt ảnh về ảnh mặc định khi nhấn Delete
                function deleteProfileImage() {
                    const previewImage = document.getElementById('previewImage');
                    previewImage.src = 'img/default-avatar.jpg'; // Set preview to default image

                    // Create a hidden form to submit the delete action
                    const form = document.createElement("form");
                    form.method = "post";
                    form.action = "updateProfile"; // Ensure this matches your servlet's action URL

                    // Add deleteImage hidden input to indicate deletion
                    const deleteInput = document.createElement("input");
                    deleteInput.type = "hidden";
                    deleteInput.name = "deleteImage";
                    deleteInput.value = "true";
                    form.appendChild(deleteInput);

                    document.body.appendChild(form);
                    form.submit(); // Submit form to trigger the delete action
                }

            </script>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const urlParams = new URLSearchParams(window.location.search);
                    const activeTab = urlParams.get('tab');

                    if (activeTab === 'editProfile') {
                        const editTabButton = document.querySelector('[data-bs-target="#profile-edit"]');
                        if (editTabButton) {
                            editTabButton.click();
                        }
                    }
                });
            </script>

            <% String successMessage = (String) session.getAttribute("successMessage");
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (successMessage
                        != null) {%>
            <div class="alert alert-success">
                <%= successMessage%>
            </div>
            <% session.removeAttribute("successMessage");
                }
                if (errorMessage != null) {%>
            <div class="alert alert-danger">
                <%= errorMessage%>
            </div>
            <% }%>
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Get the 'tab' parameter from the URL
                    const urlParams = new URLSearchParams(window.location.search);
                    const tab = urlParams.get('tab');

                    // Function to deactivate the default active tab (Overview)
                    function deactivateDefaultTab() {
                        const overviewTabButton = document.querySelector('[data-bs-target="#profile-overview"]');
                        const overviewTabContent = document.querySelector('#profile-overview');
                        if (overviewTabButton && overviewTabContent) {
                            overviewTabButton.classList.remove('active');
                            overviewTabContent.classList.remove('show', 'active');
                        }
                    }

                    // Activate "Edit Profile" tab if 'tab' is 'edit'
                    if (tab === 'edit') {
                        const editTabButton = document.querySelector('[data-bs-target="#profile-edit"]');
                        const editTabContent = document.querySelector('#profile-edit');
                        if (editTabButton && editTabContent) {
                            editTabButton.classList.add('active');
                            editTabContent.classList.add('show', 'active');
                            deactivateDefaultTab();
                        }
                    }

                    // Activate "Change Password" tab if 'tab' is 'change-password'
                    if (tab === 'change-password') {
                        const changePasswordTabButton = document.querySelector('[data-bs-target="#profile-change-password"]');
                        const changePasswordTabContent = document.querySelector('#profile-change-password');
                        if (changePasswordTabButton && changePasswordTabContent) {
                            changePasswordTabButton.classList.add('active');
                            changePasswordTabContent.classList.add('show', 'active');
                            deactivateDefaultTab();
                        }
                    }
                });
            </script>

            <script>
                setTimeout(function () {
                    const successAlert = document.querySelector('.alert-success');
                    const errorAlert = document.querySelector('.alert-danger');
                    if (successAlert)
                        successAlert.style.display = 'none';
                    if (errorAlert)
                        errorAlert.style.display = 'none';
                }, 5000); // Auto-dismiss after 5 seconds
            </script>
        </main><!-- End #main -->


        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>