package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import model.Person;
import vn.payos.PayOS;
import vn.payos.type.CheckoutResponseData;
import vn.payos.type.PaymentData;

public class OrderServlet extends HttpServlet {
    private final PayOS payOS;

    public OrderServlet() {
        this.payOS = new PayOS(
            "7d61a9e7-9656-4315-913d-2bab9c8c721c", 
            "7a6b8056-f755-4136-92ae-125554dfa73d", 
            "98a94dd3194ee6fbe7b276cb56d18222fe335bbbc16cff6c6a4237ab5e056cb8"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Get cart data from request
            String totalAmountStr = request.getParameter("totalAmount");

            // Validate cart data
            if (totalAmountStr == null || totalAmountStr.isEmpty()) {
                throw new IllegalArgumentException("Total amount is required");
            }

            // Convert USD to VND
            double usdAmount = Double.parseDouble(totalAmountStr.replace("$", "").trim());
            int vndAmount = (int)(usdAmount * 24000);

            // Get base URL
            String baseUrl = request.getScheme() + "://" + request.getServerName();
            if (request.getServerPort() != 80 && request.getServerPort() != 443) {
                baseUrl += ":" + request.getServerPort();
            }
            baseUrl += request.getContextPath();

            // Create unique order code as Long
            String currentTimeString = String.valueOf(System.currentTimeMillis());
            Long orderCode = Long.parseLong(currentTimeString.substring(currentTimeString.length() - 6));

            // Create PayOS payment data
            PaymentData paymentData = PaymentData.builder()
                .orderCode(orderCode)  
                .amount(vndAmount)
                .description("Order " + orderCode)
                .returnUrl(baseUrl + "/payment-callback")
                .cancelUrl(baseUrl + "/product")
                .build();

            // Create payment link
            CheckoutResponseData data = payOS.createPaymentLink(paymentData);
            
            if (data == null || data.getCheckoutUrl() == null) {
                throw new IllegalStateException("Failed to create payment link");
            }

            // Store order information in session
            HttpSession session = request.getSession();
            session.setAttribute("pendingOrderCode", orderCode.toString());
            session.setAttribute("pendingAmount", vndAmount);
            
            // Get person ID for later use in callback
            Person person = (Person) session.getAttribute("person");
            if (person != null) {
                session.setAttribute("pendingPersonId", person.getId());
            }

            // Redirect to PayOS checkout
            response.sendRedirect(data.getCheckoutUrl());

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/product?status=error&message=" + 
                URLEncoder.encode("Payment creation failed: " + e.getMessage(), StandardCharsets.UTF_8));
        }
    }
}
