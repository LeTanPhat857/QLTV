package model.utils;

import javax.mail.*;
import javax.mail.internet.*;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class MailSender {
    // fields
    private static final String name = "Nong Lam Library";
    private static final String email = "votinh1997@gmail.com";
    private static final String password = "lethidieuhuong@69@love";

    private static Session session;

    // method
    static {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "465");

        session = Session.getInstance(props,
                new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(email, password);
                    }
                });
//        session.setDebug(true);
    }

    public static Message createMessage(String userEmail) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email, name));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(userEmail));
            return  message;
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean sendForgetPassMail(String userEmail, String link) {
        try {
            Message message = createMessage(userEmail);
            message.setSubject("[" + name + "]" + " Reset Password?");
            message.setText("Hello, we receive information that you have forgotten your library password.\n" +
                    "You can use the link below to reset the password:\n" +
                    link + "\nNew password will be sent in a few minutes\n!" +
                    "If you don't use the link for the next 30 minutes, it will expire!\n" +
                    "Respect,\n" +
                    "The Fool");
            Transport.send(message);
        } catch (MessagingException | NullPointerException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean sendNewPassMail(String userEmail, String newPass) {
        try {
            Message message = createMessage(userEmail);
            message.setSubject("[" + name + "]" + " New Password ");
            message.setText("Hello, your password has been changed\n" +
                    "New password:\n" + newPass + "\n" +
                    "Respect,\n" +
                    "The Fool");
            Transport.send(message);
        } catch (MessagingException | NullPointerException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
