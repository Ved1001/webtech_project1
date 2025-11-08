package com.vedtravels.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;
import com.razorpay.*;

@WebServlet("/BookPackageServlet")
public class BookPackageServlet extends HttpServlet {

    private static final String RAZORPAY_KEY_ID = "enter your id";
    private static final String RAZORPAY_KEY_SECRET = "enter your id";

    // Currency conversion rate: 1 USD = 90 INR
    private static final int USD_TO_INR = 90;

    // Hardcoded promo codes and discounts (%)
    private static final Map<String, Integer> PROMO_CODES;
    static {
        PROMO_CODES = new HashMap<>();
        PROMO_CODES.put("VED10", 10); // 10% discount
        PROMO_CODES.put("TRAVEL20", 20); // 20% discount
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String destination = request.getParameter("destination");
            String packageType = request.getParameter("packageType");
            String packagePrice = request.getParameter("packagePrice");
            String personsParam = request.getParameter("persons");
            String promoCode = request.getParameter("promoCode");
            if (promoCode != null) {
                promoCode = promoCode.trim().toUpperCase();
            }

            System.out.println("\n=== Booking Request ===");
            System.out.println("Name: " + name);
            System.out.println("Email: " + email);
            System.out.println("Contact: " + contact);
            System.out.println("Destination: " + destination);
            System.out.println("Package: " + packageType);
            System.out.println("Price (USD): $" + packagePrice);
            System.out.println("Promo Code: " + promoCode);

            // Parse number of persons
            int persons = 1;
            if (personsParam != null && !personsParam.isEmpty()) {
                try {
                    persons = Integer.parseInt(personsParam);
                    if (persons < 1) persons = 1;
                    if (persons > 10) persons = 10;
                } catch (NumberFormatException e) {
                    persons = 1;
                }
            }

            // Calculate base amount
            int basePriceUSD = 0;
            try {
                basePriceUSD = Integer.parseInt(packagePrice);
            } catch (NumberFormatException e) {
                basePriceUSD = 0;
            }

            int basePriceINR = basePriceUSD * USD_TO_INR;
            int totalAmountINR = basePriceINR * persons;

            // Check promo code discount
            int discountPercent = 0;
            if (promoCode != null && !promoCode.isEmpty() && PROMO_CODES.containsKey(promoCode)) {
                discountPercent = PROMO_CODES.get(promoCode);
            }

            int discountedAmountINR = totalAmountINR;
            if (discountPercent > 0) {
                discountedAmountINR = totalAmountINR - ((totalAmountINR * discountPercent) / 100);
            }

            int totalAmountPaise = discountedAmountINR * 100; // paise for Razorpay

            System.out.println("Base Price: $" + basePriceUSD + " = ₹" + basePriceINR);
            System.out.println("Persons: " + persons);
            System.out.println("Total Amount before discount: ₹" + totalAmountINR);
            System.out.println("Discount %: " + discountPercent);
            System.out.println("Total Amount after discount: ₹" + discountedAmountINR + " (Paise: " + totalAmountPaise + ")");

            // Validate essential fields
            if (name == null || name.trim().isEmpty() ||
                    email == null || email.trim().isEmpty() ||
                    contact == null || contact.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required");
                return;
            }

            RazorpayClient razorpayClient = new RazorpayClient(RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET);

            // Create Razorpay order with discounted amount
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", totalAmountPaise); // in paise
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_" + System.currentTimeMillis());
            orderRequest.put("payment_capture", 1);

            Order order = razorpayClient.orders.create(orderRequest);
            String orderId = order.get("id");

            System.out.println("Razorpay Order Created: " + orderId);
            System.out.println("===================\n");

            // Email sending with updated branding
            try {
                String emailBody = "Dear " + name + ",\n\nThank you for booking the " + packageType +
                        " package to " + destination + ".\nYour order ID: " + orderId +
                        "\nTotal Amount: ₹" + discountedAmountINR +
                        "\n\nWe appreciate your purchase!\n\nRegards,\nSafarSathi Team";

                com.vedtravels.utils.EmailUtil.sendEmail(email, "Booking Confirmation - SafarSathi", emailBody);
            } catch (Exception e) {
                e.printStackTrace();  // Log error but continue
            }

            // Set attributes for payment.jsp
            request.setAttribute("orderId", orderId);
            request.setAttribute("keyId", RAZORPAY_KEY_ID);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("contact", contact);
            request.setAttribute("destination", destination);
            request.setAttribute("packageType", packageType);
            request.setAttribute("packagePriceUSD", Integer.toString(basePriceUSD)); // base price USD
            request.setAttribute("packagePriceINR", Integer.toString(basePriceINR));   // base price INR
            request.setAttribute("persons", persons);
            request.setAttribute("totalAmountUSD", Integer.toString(basePriceUSD * persons)); // total USD
            request.setAttribute("totalAmountINR", Integer.toString(discountedAmountINR));   // discounted total INR
            request.setAttribute("discountPercent", discountPercent);
            request.setAttribute("promoCode", promoCode);

            RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
            dispatcher.forward(request, response);

        } catch (RazorpayException e) {
            System.err.println("Razorpay Error: " + e.getMessage());
            e.printStackTrace();
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html><body style='font-family:Arial;text-align:center;padding:50px;'>");
            out.println("<h2 style='color:#ff6b6b;'>Payment Error</h2>");
            out.println("<p>Failed to initialize payment. Please try again.</p>");
            out.println("<p>Error: " + e.getMessage() + "</p>");
            out.println("<br><a href='index.jsp' style='color:#4ecdc4;text-decoration:none;font-weight:600;'>← Back to Home</a>");
            out.println("</body></html>");
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
