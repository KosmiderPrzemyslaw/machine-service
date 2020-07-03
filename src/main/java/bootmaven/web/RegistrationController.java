package bootmaven.web;

import bootmaven.model.User;
import bootmaven.service.SecurityService;
import bootmaven.service.UserService;
import bootmaven.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@SessionAttributes({"userForm"})
public class RegistrationController {

    private final UserService userService;
    private final SecurityService securityService;
    private final UserValidator userValidator;


    private final Logger logger = LoggerFactory.getLogger(RegistrationController.class);

    public RegistrationController(UserService userService, SecurityService securityService, UserValidator userValidator) {
        this.userService = userService;
        this.securityService = securityService;
        this.userValidator = userValidator;
    }


    @PostMapping("/registration")
    public String userReg(@ModelAttribute("userForm") @Valid @RequestBody User user, BindingResult result) {
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            return "admin/registration";
        }

        userService.saveUser(user);
        securityService.autoLogin(user.getUsername(), user.getPasswordConfirm());
        return "dashboard";
    }


    @GetMapping("/registration")
    public String registry(Model model) {
        User user = new User();
        model.addAttribute("userForm", user);
        return "admin/registration";
    }

    @GetMapping(value = "/test-model")
    @ResponseBody
    public void getAllFromMap(Model model) {
        model.asMap().forEach((k, v) -> logger.debug(k + ": " + v));
    }


}
