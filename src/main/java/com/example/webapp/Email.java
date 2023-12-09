package com.example.webapp;

import jakarta.mail.Message;

import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class Email {
    public void envoyer(){
// Récupérer les paramètres de la requête
        //String toEmail = req.getParameter("toEmail");
        String toEmail = "marwane.laghzaoui@gmail.com";
        String subject = "Sujet de l'email";
        String messageBody = "Contenu de l'email";

        // Configurer les propriétés pour la session de messagerie
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties);
        try {
            // Créer un objet MimeMessage
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("marwane.laghzaoui@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(messageBody);
            Transport.send(message);
            System.out.println("Email envoyé avec succès !");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
