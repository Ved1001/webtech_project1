package com.vedtravels.servlets;

import com.vedtravels.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String destinationInterest = request.getParameter("destinationInterest");
        String message = request.getParameter("message");

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        String timestamp = formatter.format(new Date());

        System.out.println("\n=== New Contact Form Submission ===");
        System.out.println("Timestamp: " + timestamp);
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Phone: " + (phone != null && !phone.isEmpty() ? phone : "Not provided"));
        System.out.println("Destination Interest: " + (destinationInterest != null && !destinationInterest.isEmpty() ? destinationInterest : "Not specified"));
        System.out.println("Message: " + message);
        System.out.println("================================\n");

        if (name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                message == null || message.trim().isEmpty()) {

            sendErrorResponse(response, "Please fill all required fields (Name, Email, and Message).");
            return;
        }

        if (!isValidEmail(email)) {
            sendErrorResponse(response, "Please enter a valid email address.");
            return;
        }

        // === Database Insertion ===
        try (Connection conn = com.vedtravels.utils.DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO contact_messages (name, email, phone, destination_interest, message) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, destinationInterest);
                stmt.setString(5, message);
                int rows = stmt.executeUpdate();
                System.out.println("Rows inserted: " + rows);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            sendErrorResponse(response, "Database error: Unable to save your message. Details: " + e.getMessage());
            return;
        }

        sendSuccessResponse(response, name, email, destinationInterest);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Method Not Allowed</title>");
        out.println("<style>");
        out.println("body { font-family: 'Segoe UI', sans-serif; text-align: center; padding: 50px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }");
        out.println(".container { background: white; color: #333; padding: 40px; border-radius: 20px; max-width: 600px; margin: 0 auto; box-shadow: 0 20px 60px rgba(0,0,0,0.3); }");
        out.println("h2 { color: #ff6b6b; margin-bottom: 20px; }");
        out.println("a { display: inline-block; margin-top: 30px; padding: 15px 40px; background: #4ecdc4; color: white; text-decoration: none; border-radius: 30px; font-weight: 600; }");
        out.println("a:hover { background: #45b7af; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>");
        out.println("<h2>⚠️ Method Not Allowed</h2>");
        out.println("<p>This endpoint only accepts POST requests.</p>");
        out.println("<p>Please use the contact form on the website to send a message.</p>");
        out.println("<a href='index.jsp'>← Back to Home</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    private void sendSuccessResponse(HttpServletResponse response, String name, String email, String destination)
            throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Message Sent - Ved Travels</title>");
        out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css'>");
        out.println("<style>");
        out.println("body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; margin: 0; }");
        out.println(".success-container { background: white; padding: 50px; border-radius: 25px; text-align: center; box-shadow: 0 20px 60px rgba(0,0,0,0.3); max-width: 600px; animation: slideDown 0.5s ease; }");
        out.println("@keyframes slideDown { from { opacity: 0; transform: translateY(-50px); } to { opacity: 1; transform: translateY(0); } }");
        out.println(".success-icon { width: 80px; height: 80px; background: linear-gradient(135deg, #00b894, #4ecdc4); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 30px; }");
        out.println(".success-icon i { font-size: 2.5rem; color: white; }");
        out.println("h2 { color: #2d3436; font-size: 2rem; margin-bottom: 15px; }");
        out.println(".message { color: #636e72; font-size: 1.1rem; line-height: 1.8; margin-bottom: 30px; }");
        out.println(".info-box { background: #f8f9fa; padding: 20px; border-radius: 12px; margin: 25px 0; text-align: left; }");
        out.println(".info-row { display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #dfe6e9; }");
        out.println(".info-row:last-child { border-bottom: none; }");
        out.println(".info-label { font-weight: 600; color: #2d3436; }");
        out.println(".info-value { color: #636e72; }");
        out.println(".btn-home { display: inline-flex; align-items: center; gap: 10px; padding: 15px 40px; background: linear-gradient(135deg, #4ecdc4, #00b894); color: white; text-decoration: none; border-radius: 30px; font-weight: 600; margin-top: 20px; transition: all 0.3s ease; }");
        out.println(".btn-home:hover { transform: translateY(-3px); box-shadow: 0 10px 30px rgba(78, 205, 196, 0.4); }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='success-container'>");
        out.println("<div class='success-icon'><i class='fas fa-check'></i></div>");
        out.println("<h2>✅ Message Sent Successfully!</h2>");
        out.println("<p class='message'>Thank you for contacting Ved Travels, <strong>" + escapeHtml(name) + "</strong>!<br>");
        out.println("We have received your message and will get back to you shortly at <strong>" + escapeHtml(email) + "</strong>.</p>");

        out.println("<div class='info-box'>");
        out.println("<div class='info-row'>");
        out.println("<span class='info-label'><i class='fas fa-user'></i> Name:</span>");
        out.println("<span class='info-value'>" + escapeHtml(name) + "</span>");
        out.println("</div>");
        out.println("<div class='info-row'>");
        out.println("<span class='info-label'><i class='fas fa-envelope'></i> Email:</span>");
        out.println("<span class='info-value'>" + escapeHtml(email) + "</span>");
        out.println("</div>");

        if (destination != null && !destination.isEmpty()) {
            out.println("<div class='info-row'>");
            out.println("<span class='info-label'><i class='fas fa-map-marker-alt'></i> Interest:</span>");
            out.println("<span class='info-value'>" + escapeHtml(destination) + "</span>");
            out.println("</div>");
        }
        out.println("</div>");

        out.println("<p class='message' style='font-size: 0.95rem; opacity: 0.8;'>Our travel experts typically respond within 24 hours. Check your email for our response!</p>");
        out.println("<a href='index.jsp' class='btn-home'><i class='fas fa-home'></i> Back to Home</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    private void sendErrorResponse(HttpServletResponse response, String errorMessage)
            throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang='en'>");
        out.println("<head>");
        out.println("<meta charset='UTF-8'>");
        out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.println("<title>Error - Ved Travels</title>");
        out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css'>");
        out.println("<style>");
        out.println("body { font-family: 'Segoe UI', sans-serif; background: linear-gradient(135deg, #ff6b6b, #ff8e53); min-height: 100vh; display: flex; align-items: center; justify-content: center; margin: 0; }");
        out.println(".error-container { background: white; padding: 50px; border-radius: 25px; text-align: center; box-shadow: 0 20px 60px rgba(0,0,0,0.3); max-width: 500px; }");
        out.println(".error-icon { width: 80px; height: 80px; background: #ff6b6b; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 30px; }");
        out.println(".error-icon i { font-size: 2.5rem; color: white; }");
        out.println("h2 { color: #ff6b6b; margin-bottom: 20px; }");
        out.println("p { color: #636e72; font-size: 1.1rem; line-height: 1.6; }");
        out.println("a { display: inline-flex; align-items: center; gap: 10px; margin-top: 30px; padding: 15px 40px; background: #ff6b6b; color: white; text-decoration: none; border-radius: 30px; font-weight: 600; }");
        out.println("a:hover { background: #ff5252; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='error-container'>");
        out.println("<div class='error-icon'><i class='fas fa-exclamation-triangle'></i></div>");
        out.println("<h2>⚠️ Oops! Something went wrong</h2>");
        out.println("<p>" + escapeHtml(errorMessage) + "</p>");
        out.println("<a href='index.jsp'><i class='fas fa-arrow-left'></i> Go Back</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }

    private boolean isValidEmail(String email) {
        if (email == null || email.isEmpty()) return false;
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        return email.matches(emailRegex);
    }

    private String escapeHtml(String text) {
        if (text == null) return "";
        return text.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;");
    }
}
