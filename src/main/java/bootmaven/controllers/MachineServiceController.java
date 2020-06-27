package bootmaven.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MachineServiceController {

    @GetMapping("/machineService")
    public  String orderService(){
        return "machineService";
    }
}
