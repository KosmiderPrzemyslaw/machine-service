package bootmaven.controllers;

import bootmaven.model.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes({"user"})
@Controller
public class LoginController {


    @GetMapping("/logout")
    public String logout() {
        return "admin/logout";
    }


    @GetMapping("/login")
    public String form(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Niepoprawna nazwa uzytkownika lub hasło");
        }
        if (logout != null) {
            model.addAttribute("message", "Logowanie zakończone sukcesem!");
        }

        model.addAttribute("user", new User());
        return "admin/login";
    }


    @GetMapping("/checkUser")
    @ResponseBody
    public Object getLoggedUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getPrincipal();
    }

    @GetMapping("/check")
    public String check() {
        return "check";
    }

}
