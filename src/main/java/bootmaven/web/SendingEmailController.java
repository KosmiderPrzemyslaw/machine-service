package bootmaven.web;

import bootmaven.model.Mail;
import bootmaven.model.User;
import bootmaven.repositories.MailRepository;
import bootmaven.repositories.UserRepository;
import bootmaven.service.NotificationService;
import bootmaven.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@SessionAttributes("sendingMail")
@Controller
public class SendingEmailController {


    private final NotificationService notificationService;
    private final UserService userService;
    private final UserRepository userRepository;
    private final MailRepository mailRepository;

    public SendingEmailController(NotificationService notificationService, UserService userService, UserRepository userRepository, MailRepository mailRepository) {
        this.notificationService = notificationService;
        this.userService = userService;
        this.userRepository = userRepository;
        this.mailRepository = mailRepository;
    }

    @ModelAttribute("usersMailAddresses")
    public List<String> getAllUsers() {

        List<User> userList = userRepository.findAll();

        List<String> usersMail = new ArrayList<>();
        for (User user : userList) {
            usersMail.add(user.getEmail());
        }
        return usersMail;
    }


    @PostMapping("/send-email")
    public String emailSending(@ModelAttribute("email") @Valid @RequestBody Mail mail,
                               BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "emailForm";
        }
        User user = userAuthentication();
        String mailAddress = mail.getReceiver();
        String subject = mail.getSubject();
        String text = mail.getText();
        mail.setUser(user);
        notificationService.sendNotification(user, mailAddress, subject, text);
        mailRepository.save(mail);
        return "emailSent";
    }


    @Transactional
    @GetMapping("/send-email")
    public String sendEmail(Model model) {
        try {
            User user = userAuthentication();
            if (user.getEmail() == null) {
                return "404";
            } else {

                Mail email = new Mail();
                model.addAttribute("email", email);

                return "emailForm";
            }
        } catch (NullPointerException e) {
            return "404";
        }
    }

    private User userAuthentication() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        return userService.findByUserName(username);
    }
}