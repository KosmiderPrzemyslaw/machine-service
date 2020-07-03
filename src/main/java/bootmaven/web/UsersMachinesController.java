package bootmaven.web;

import bootmaven.model.Machine;
import bootmaven.model.User;
import bootmaven.service.MachineService;
import bootmaven.service.UserService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class UsersMachinesController {
    private final UserService userService;
    private final MachineService machineService;

    public UsersMachinesController(UserService userService, MachineService machineService) {
        this.userService = userService;
        this.machineService = machineService;
    }


    @GetMapping("/myServices")
    public String showServices(Model model) {
        User user = userAuthentication();
        List<Machine> machineList = user.getMachineList();
        model.addAttribute("machineList", machineList);
        model.addAttribute("user", user);
        return "machineList";
    }

    private User userAuthentication() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        return userService.findByUserName(username);
    }

    @Transactional
    @GetMapping("/deleteService/{id}")
    public String delete(@PathVariable long id, Model model) {
        User user = userAuthentication();

        Machine machineFromDB = checkMachineInDb(id, user);
        if (machineFromDB == null) {
            return "403";
        } else {
            machineService.delete(machineFromDB.getId());
        }
        return "machineList";
    }

    private Machine checkMachineInDb(@PathVariable long id, User user) {
        List<Machine> userMachineList = user.getMachineList();
        Machine machine = machineService.findMachineById(id);
        userMachineList.forEach(Machine::getMachineName);
        return userMachineList.stream()
                .filter(machine1 -> machine.equals(machine1))
                .findAny()
                .orElse(null);
    }
}



