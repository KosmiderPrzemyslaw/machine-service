package bootmaven.controllers;

import bootmaven.classes.CurrentUser;
import bootmaven.model.User;
import bootmaven.service.UserService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
    private final UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/logout")
    public String logout() {
        return "admin/logout";
    }


    @GetMapping("/login")
    public String form(Model model, String error, String logout)
    {
        if(error != null){
            model.addAttribute("error", "Your username and password is invalid");
        }
        if(logout != null){
            model.addAttribute("message", "You have been logged out succesfully");
        }
        return "admin/login";
    }


    @GetMapping("/checkUser")
    @ResponseBody
    public String admin(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        return "Hello " + entityUser.getUsername();
    }

    @GetMapping("/check")
    public String check(){
        return "check";
    }

}
