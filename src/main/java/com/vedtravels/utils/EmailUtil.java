package com.vedtravels.utils;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class EmailUtil {

    public static void sendEmail(String toEmail, String subject, String body) throws MessagingException, UnsupportedEncodingException {
        final String fromEmail = "vedshrimali123@gmail.com"; // Your SMTP/email
        final String password = "lyva legg afna unsb"; // SMTP password or app password

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(fromEmail, "SafarSathi - हर सफर का साथी SafarSathi"));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
        msg.setSubject(subject);
        msg.setSentDate(new java.util.Date());
        msg.setText(body);

        Transport.send(msg);
    }
}
