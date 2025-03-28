<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ page import="model.Account" %>
            <%@ page import="model.Person" %> <!-- Import Person class -->
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Lash Services - Blushed Beauty Bar</title>
                    <link rel="stylesheet" href="newUI/assets/css/styles.css">
                    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
                    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
                </head>

                <body>
                    <jsp:include page="NavBarJSP/NavBarJSP.jsp" />

                    <!-- Services Hero Section -->
                    <section class="services-hero">
                        <div class="hero-content">
                            <h1>SMART BEAUTY SPA</h1>
                            <p>YOUR HEALTH DESTINATION</p>
                        </div>
                    </section>

                    <!-- Services List Section -->
                    <section class="services-list">
                        <h2>RECOVER ENERGY THROUGH RELAXATION</h2>
                        <div class="service-grid">
                            <c:forEach items="${extensionServices}" var="service">
                                <c:if test="${service.status eq 'ACTIVE'}">
                                    <div class="service-item" data-aos="fade-up">
                                        <img src="${service.image}" alt="${service.name}">
                                        <div class="service-info">
                                            <h3>${service.name}</h3>
                                            <p>
                                                <c:choose>
                                                    <c:when test="${service.price > 0}">
                                                        Starting at $${service.price}
                                                    </c:when>
                                                    <c:otherwise>
                                                        Price varies
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                            <p>${service.description}</p>
                                            <div class="service-actions">
                                                <a href="service-detail?id=${service.id}" class="view-details">View
                                                    Details</a>
                                                <a href="booking?service=${service.id}" class="book-now">Book Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>

                        <h2>Spa Packages</h2>
                        <div class="service-grid">
                            <c:forEach items="${liftsAndTints}" var="service">
                                <div class="service-item" data-aos="fade-up">
                                    <img src="${service.image}" alt="${service.name}">
                                    <div class="service-info">
                                        <h3>${service.name}</h3>
                                        <p>
                                            <c:choose>
                                                <c:when test="${service.price > 0}">
                                                    Starting at $${service.price}
                                                </c:when>
                                                <c:otherwise>
                                                    Price varies
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                        <p>${service.description}</p>
                                        <div class="service-actions">
                                            <a href="service-detail?id=${service.id}" class="view-details">View
                                                Details</a>
                                            <a href="booking?service=${service.id}" class="book-now">Book Now</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </section>

                    <!-- Client Testimonial Section -->
                    <section class="testimonial">
                        <div class="testimonial-content">
                            <h2>Client Love</h2>
                            <div class="testimonial-slider-container">
                                <div class="star-decoration top-left"></div>
                                <div class="star-decoration top-right"></div>
                                <button class="slider-control prev" aria-label="Previous testimonial">&lt;</button>
                                <div class="testimonial-slider">
                                    <div class="testimonial-slide active">
                                        <p>"I can't say enough wonderful things about Blushed! All of the staff have
                                            been so friendly,
                                            professional, and welcoming!"</p>
                                        <span class="client-name">- Linh</span>
                                    </div>
                                    <div class="testimonial-slide">
                                        <p>"The lash extensions I got here are amazing! They look so natural and last
                                            for weeks. I'm
                                            definitely coming back!"</p>
                                        <span class="client-name">- Sarah</span>
                                    </div>
                                    <div class="testimonial-slide">
                                        <p>"Blushed Beauty Bar is my go-to place for all things beauty. Their facials
                                            are absolutely
                                            divine!"</p>
                                        <span class="client-name">- Emma</span>
                                    </div>
                                    <div class="testimonial-slide">
                                        <p>"I had my eyebrows microbladed here and I'm in love with the results. The
                                            attention to detail
                                            is incredible!"</p>
                                        <span class="client-name">- Olivia</span>
                                    </div>
                                    <div class="testimonial-slide">
                                        <p>"The staff at Blushed Beauty Bar are true professionals. They always make me
                                            feel comfortable
                                            and beautiful."</p>
                                        <span class="client-name">- Sophia</span>
                                    </div>
                                </div>
                                <button class="slider-control next" aria-label="Next testimonial">&gt;</button>
                                <div class="star-decoration bottom-left"></div>
                                <div class="star-decoration bottom-right"></div>
                            </div>
                            <div class="slider-dots"></div>
                        </div>
                    </section>

                    <!-- Call to Action Section -->
                    <section class="cta-section">
                        <img src="newUI/assets/img/Slogan.png" alt="Slogan">
                        <a href="#" class="cta-button">Book Now</a>
                    </section>

                    <!-- Footer Section -->
                    <footer>


                        <div class="footer-links">
                            <div class="footer-column services-list">
                                <h4>Our Services</h4>
                                <ul>
                                    <li><a href="#">Lash Services</a></li>
                                    <li><a href="#">Facials & Peels</a></li>
                                    <li><a href="#">Microblading</a></li>
                                    <li><a href="#">SMP Services</a></li>
                                    <li><a href="#">Waxing & Threading</a></li>
                                    <li><a href="#">Makeup Application</a></li>
                                    <li><a href="#">Airbrush Tanning</a></li>
                                    <li><a href="#">Permanent Jewelry</a></li>
                                    <li><a href="#">Ear Piercing & Curating</a></li>
                                </ul>
                            </div>

                            <div class="footer-column contact-info">
                                <h4>Contact Us</h4>
                                <p><strong>Smart Beauty Spa</strong></p>
                                    <p><i class="fas fa-map-marker-alt"></i> FPT University DaNang, Viet Nam</p>
                                    <p><i class="fas fa-phone"></i> +84 914 733 450</p>
                                <div class="social-icons">
                                    <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                                    <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                                </div>
                            </div>

                            <div class="footer-column email-signup">
                                <h4>Stay Connected</h4>
                                <p>Subscribe for exclusive offers and beauty tips!</p>
                                <form class="newsletter-form">
                                    <input type="email" placeholder="Enter your email" required>
                                    <button type="submit" class="cta-button">Sign Up</button>
                                </form>
                            </div>
                        </div>

                        <div class="footer-bottom">
                            <p>&copy; 2023 Blushed Beauty Bar. All rights reserved.</p>
                            <ul class="footer-legal">
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Terms of Service</a></li>
                            </ul>
                        </div>
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

                        // Testimonial Slider
                        const slides = document.querySelectorAll('.testimonial-slide');
                        const dotsContainer = document.querySelector('.slider-dots');
                        const prevButton = document.querySelector('.slider-control.prev');
                        const nextButton = document.querySelector('.slider-control.next');
                        let currentSlide = 0;
                        let slideInterval;

                        // Create dots
                        slides.forEach((_, index) => {
                            const dot = document.createElement('span');
                            dot.classList.add('dot');
                            dot.addEventListener('click', () => goToSlide(index));
                            dotsContainer.appendChild(dot);
                        });

                        const dots = document.querySelectorAll('.dot');

                        function goToSlide(n) {
                            slides[currentSlide].classList.remove('active');
                            dots[currentSlide].classList.remove('active');
                            currentSlide = (n + slides.length) % slides.length;
                            slides[currentSlide].classList.add('active');
                            dots[currentSlide].classList.add('active');
                        }

                        function nextSlide() {
                            goToSlide(currentSlide + 1);
                        }

                        function prevSlide() {
                            goToSlide(currentSlide - 1);
                        }

                        // Initialize slider
                        goToSlide(0);

                        // Event listeners for controls
                        prevButton.addEventListener('click', () => {
                            prevSlide();
                            resetInterval();
                        });

                        nextButton.addEventListener('click', () => {
                            nextSlide();
                            resetInterval();
                        });

                        // Auto-advance slides
                        function startSlideShow() {
                            slideInterval = setInterval(nextSlide, 5000);
                        }

                        function resetInterval() {
                            clearInterval(slideInterval);
                            startSlideShow();
                        }

                        startSlideShow();

                        // Pause auto-advance on hover
                        const sliderContainer = document.querySelector('.testimonial-slider-container');
                        sliderContainer.addEventListener('mouseenter', () => clearInterval(slideInterval));
                        sliderContainer.addEventListener('mouseleave', startSlideShow);
                    </script>
                </body>

                </html>