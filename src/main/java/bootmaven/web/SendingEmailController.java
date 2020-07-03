package bootmaven.web;

import bootmaven.model.User;
import bootmaven.service.NotificationService;
import bootmaven.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SendingEmailController {


    private final NotificationService notificationService;
    private final UserService userService;

    public SendingEmailController(NotificationService notificationService, UserService userService) {
        this.notificationService = notificationService;
        this.userService = userService;
    }


//    @GetMapping("/send-email")
//    @ResponseBody
//    public String sendMail() {
//        try {
//            User user = userAuthentication();
//            notificationService.sendNotification(user);
//        } catch (MailException e) {
//            e.printStackTrace();
//        }
//        return "succec";
//    }

    @Transactional
    @GetMapping("/send-email")
    public String sendEmail() {
        try {
            User user = userAuthentication();

            if (user.getEmail() == null) {
                return "404";
            } else {
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