<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ page import="model.Account" %>
            <%@ page import="model.Person" %> <!-- Import Person class -->

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Contact Us - Blushed Beauty Bar</title>
                    <link rel="stylesheet" href="newUI/assets/css/styles.css">
                    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
                    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
                </head>

                <body>
                    <jsp:include page="NavBarJSP/NavBarJSP.jsp" />

                    <!-- Contact Hero Section -->
                    <section class="contact-hero">
                        <div class="hero-content">
                            <h1>Get In Touch</h1>
                            <p>We'd love to hear from you</p>
                        </div>
                    </section>

                    <!-- Contact Information Section -->
                    <section class="contact-info-section">
                        <div class="contact-container">
                            <div class="contact-cards">
                                <div class="contact-card" data-aos="fade-up">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <h3>Visit Us</h3>
                                    <p>FPT University DaNang</p>
                                    <p>Viet Nam</p>
                                </div>
                                <div class="contact-card" data-aos="fade-up" data-aos-delay="100">
                                    <i class="fas fa-phone"></i>
                                    <h3>Call Us</h3>
                                    <p>+84 914 733 450</p>
                                    <p>Mon-Sat: 9am - 7pm</p>
                                </div>
                                <div class="contact-card" data-aos="fade-up" data-aos-delay="200">
                                    <i class="fas fa-envelope"></i>
                                    <h3>Email Us</h3>
                                    <p>vunthde180740@fpt.edu.vn</p>
                                    <p>We'll respond within 24 hours</p>
                                </div>
                                <div class="contact-card" data-aos="fade-up" data-aos-delay="300">
                                    <i class="fas fa-comments"></i>
                                    <h3>Follow Us</h3>
                                    <div class="social-links">
                                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Contact Form Section -->
                    <section class="contact-form-section">
                        <div class="contact-container">
                            <div class="form-and-map">
                                <div class="contact-form" data-aos="fade-right">
                                    <h2>Send Us a Message</h2>
                                    <form id="contactForm">
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" id="name" name="name" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" id="email" name="email" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="tel" id="phone" name="phone">
                                        </div>
                                        <div class="form-group">
                                            <label for="subject">Subject</label>
                                            <select id="subject" name="subject" required>
                                                <option value="">Select a subject</option>
                                                <option value="booking">Booking Inquiry</option>
                                                <option value="service">Service Information</option>
                                                <option value="feedback">Feedback</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="message">Message</label>
                                            <textarea id="message" name="message" rows="5" required></textarea>
                                        </div>
                                        <button type="submit" class="submit-btn">Send Message</button>
                                    </form>
                                </div>
                                <div class="contact-map" data-aos="fade-left">

                                    <iframe
                                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.856069316461!2d108.25831637575897!3d15.968891042115114!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3142116949840599%3A0x365b35580f52e8d5!2zxJDhuqFpIGjhu41jIEZQVCDEkMOgIE7hurVuZw!5e0!3m2!1svi!2s!4v1742383888737!5m2!1svi!2s"
                                        width="100%" height="100%" style="border:0;" allowfullscreen=""
                                        loading="lazy"></iframe>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Business Hours Section -->
                    <section class="business-hours-section">
                        <div class="contact-container">
                            <h2 data-aos="fade-up">Business Hours</h2>
                            <div class="hours-grid" data-aos="fade-up">
                                <div class="hours-item">
                                    <span class="day">Monday</span>
                                    <span class="time">9:00 AM - 7:00 PM</span>
                                </div>
                                <div class="hours-item">
                                    <span class="day">Tuesday</span>
                                    <span class="time">9:00 AM - 7:00 PM</span>
                                </div>
                                <div class="hours-item">
                                    <span class="day">Wednesday</span>
                                    <span class="time">9:00 AM - 7:00 PM</span>
                                </div>
                                <div class="hours-item">
                                    <span class="day">Thursday</span>
                                    <span class="time">9:00 AM - 7:00 PM</span>
                                </div>
                                <div class="hours-item">
                                    <span class="day">Friday</span>
                                    <span class="time">9:00 AM - 7:00 PM</span>
                                </div>
                                <div class="hours-item">
                                    <span class="day">Saturday</span>
                                    <span class="time">9:00 AM - 5:00 PM</span>
                                </div>
                                <div class="hours-item">
                                    <span class="day">Sunday</span>
                                    <span class="time">Closed</span>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Footer Section -->
                    <footer>
                        <!-- [Previous footer code remains the same] -->
                    </footer>

                    <script>
                        AOS.init();

                        // Hamburger menu functionality
                        const hamburger = document.querySelector('.hamburger');
                        const navLinks = document.querySelector('.nav-links');

                        hamburger.addEventListener('click', () => {
                            navLinks.classList.toggle('active');
                            hamburger.classList.toggle('active');
                        });

                        // Close menu when a link is clicked
                        document.querySelectorAll('.nav-links a').forEach(link => {
                            link.addEventListener('click', () => {
                                navLinks.classList.remove('active');
                                hamburger.classList.remove('active');
                            });
                        });

                        // Form submission handling
                        document.getElementById('contactForm').addEventListener('submit', function (e) {
                            e.preventDefault();
                            // Add your form submission logic here
                            alert('Thank you for your message. We will get back to you soon!');
                            this.reset();
                        });
                    </script>
                </body>

                </html>
