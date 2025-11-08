<%@ page import="java.sql.*, com.vedtravels.utils.DatabaseUtil" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%!
    // Method to escape HTML
    public String escapeHtml(String text) {
        if (text == null) return "";
        return text.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;");
    }

    public boolean isValidEmail(String email) {
        if (email == null || email.isEmpty()) return false;
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";
        return email.matches(emailRegex);
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String destinationInterest = request.getParameter("destinationInterest");
    String message = request.getParameter("message");

    String status = "";
    String errorMessage = "";

    boolean valid = true;

    if (name == null || name.trim().isEmpty() ||
        email == null || email.trim().isEmpty() ||
        message == null || message.trim().isEmpty()) {
        valid = false;
        errorMessage = "Please fill all required fields (Name, Email, and Message).";
    }

    if (valid && !isValidEmail(email)) {
        valid = false;
        errorMessage = "Please enter a valid email address.";
    }

    if (valid) {
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO contact_messages (name, email, phone, destination_interest, message) VALUES (?, ?, ?, ?, ?)")) {

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, destinationInterest);
            stmt.setString(5, message);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                status = "success";
            } else {
                status = "error";
                errorMessage = "Database error: Unable to save your message.";
            }
        } catch (Exception e) {
            status = "error";
            errorMessage = "Database error: " + escapeHtml(e.getMessage());
        }
    } else {
        status = "error";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title><%= "success".equals(status) ? "Message Sent - SafarSathi" : "Error - SafarSathi" %></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh; display: flex; align-items: center; justify-content: center; margin: 0;
        }
        .success-container, .error-container {
            background: white; padding: 50px; border-radius: 25px; text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3); max-width: 600px; animation: slideDown 0.5s ease;
        }
        @keyframes slideDown {
            from {opacity: 0; transform: translateY(-50px);}
            to {opacity: 1; transform: translateY(0);}
        }
        .success-container .icon, .error-container .icon {
            width: 80px; height: 80px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 30px;
        }
        .success-container .icon {
            background: linear-gradient(135deg, #00b894, #4ecdc4);
        }
        .error-container .icon {
            background: #ff6b6b;
        }
        .success-container .icon i, .error-container .icon i {
            font-size: 2.5rem; color: white;
        }
        h2 {
            color: #2d3436; font-size: 2rem; margin-bottom: 15px;
        }
        .error-container h2 {
            color: #ff6b6b;
        }
        .message {
            color: #636e72; font-size: 1.1rem; line-height: 1.8; margin-bottom: 30px;
        }
        .info-box {
            background: #f8f9fa; padding: 20px; border-radius: 12px; margin: 25px 0; text-align: left;
        }
        .info-row {
            display: flex; justify-content: space-between; padding: 10px 0; border-bottom: 1px solid #dfe6e9;
        }
        .info-row:last-child {
            border-bottom: none;
        }
        .info-label {
            font-weight: 600; color: #2d3436;
        }
        .info-value {
            color: #636e72;
        }
        .btn-home {
            display: inline-flex; align-items: center; gap: 10px; padding: 15px 40px;
            background: linear-gradient(135deg, #4ecdc4, #00b894);
            color: white; text-decoration: none; border-radius: 30px; font-weight: 600;
            margin-top: 20px; transition: all 0.3s ease;
        }
        .btn-home:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(78, 205, 196, 0.4);
        }
    </style>
</head>
<body>
    <% if ("success".equals(status)) { %>
    <div class="success-container">
        <div class="icon"><i class="fas fa-check"></i></div>
        <h2>✅ Message Sent Successfully!</h2>
        <p class="message">Thank you for contacting SafarSathi, <strong><%= escapeHtml(name) %></strong>!<br/>
            We have received your message and will get back to you shortly at <strong><%= escapeHtml(email) %></strong>.
        </p>
        <div class="info-box">
            <div class="info-row">
                <span class="info-label"><i class="fas fa-user"></i> Name:</span>
                <span class="info-value"><%= escapeHtml(name) %></span>
            </div>
            <div class="info-row">
                <span class="info-label"><i class="fas fa-envelope"></i> Email:</span>
                <span class="info-value"><%= escapeHtml(email) %></span>
            </div>
            <% if (destinationInterest != null && !destinationInterest.isEmpty()) { %>
            <div class="info-row">
                <span class="info-label"><i class="fas fa-map-marker-alt"></i> Interest:</span>
                <span class="info-value"><%= escapeHtml(destinationInterest) %></span>
            </div>
            <% } %>
        </div>
        <p class="message" style="font-size: 0.95rem; opacity: 0.8;">
            Our travel experts typically respond within 24 hours. Check your email for our response!
        </p>
        <a href="index.jsp" class="btn-home"><i class="fas fa-home"></i> Back to Home</a>
    </div>
    <% } else { %>
    <div class="error-container">
        <div class="icon"><i class="fas fa-exclamation-triangle"></i></div>
        <h2>⚠️ Oops! Something went wrong</h2>
        <p class="message"><%= escapeHtml(errorMessage) %></p>
        <a href="index.jsp" class="btn-home"><i class="fas fa-arrow-left"></i> Go Back</a>
    </div>
    <% } %>
</body>
</html>
