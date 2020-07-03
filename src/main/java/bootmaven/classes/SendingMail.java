package bootmaven.classes;

import bootmaven.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Component
public class SendingMail {
    @Autowired
    private JavaMailSender javaMailSender;

    public void send(User user, String subject, String body) throws MessagingException {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper helper;

        helper = new MimeMessageHelper(mimeMessage, true);
        helper.setSubject(subject);
        helper.setTo("przemkosmo1991@gmail.com");
        helper.setText(body, true);

        javaMailSender.send(mimeMessage);
    }
}
