package com.example.webapp;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MailUtils {

    public static void sendMail(String subject, String content, String to) {

        String from = "warlet.antoine.dev@gmail.com"; // Mettez votre adresse email
        String password = "fpod wkpn aela rvkf"; // Mettez votre mot de passe

        // Configuration des propriétés pour l'envoi de l'email
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // Serveur SMTP (ici, Gmail)
        props.put("mail.smtp.port", "587"); // Port SMTP (Gmail utilise le port 587)
        props.put("mail.smtp.auth", "true"); // Autorisation requise
        props.put("mail.smtp.starttls.enable", "true"); // Activation du chiffrement TLS

        // Création d'une session pour l'authentification
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            // Création de l'objet Message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Sujet de l'email");
            message.setText("Corps du message de l'email");

            // Envoi de l'email
            Transport.send(message);

            System.out.println("L'email a été envoyé avec succès!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

}
