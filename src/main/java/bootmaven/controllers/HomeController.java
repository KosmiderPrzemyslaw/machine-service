package bootmaven.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "dashboard";
    }


    @GetMapping("/about")
    @ResponseBody
    public String about() {
        return "Here u can find some details for logged users";
    }

}
