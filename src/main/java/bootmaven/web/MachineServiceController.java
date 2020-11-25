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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
public class MachineServiceController {
    private final MachineService machineService;
    private final UserService userService;

    public MachineServiceController(MachineService machineService, UserService userService) {
        this.machineService = machineService;
        this.userService = userService;
    }

    @GetMapping("/machineService")
    public String orderService(Model model) {
        Machine machine = new Machine();

        model.addAttribute("serviceRequest", machine);
        return "machineService";
    }

    @PostMapping("/machineService")
    public String userReg(@ModelAttribute("serviceRequest")
                          @Valid @RequestBody Machine machine, BindingResult result) {
        if (result.hasErrors()) {
            return "machineService";
        }

        User user = userAuthentication();
        machine.setUser(user);
        machineService.save(machine);

        return "dashboard";
    }


    @Transactional
    @GetMapping("/update/{id}")
    public String updateService(@PathVariable long id, Model model) {
        try {
            Machine machine = machineService.findMachineById(id);
            User user = userAuthentication();
            Machine machineInDb = checkMachineInDb(id, user);
            if (machineInDb == null) {
                return "403";
            } else {
                model.addAttribute("machine", machine);
                return "updateService";
            }
        } catch (NullPointerException e) {
            return "404";
        }
    }

    @Transactional
    @PostMapping("/update/{id}")
    public String update(@PathVariable long id, @ModelAttribute("machine")
    @Valid @RequestBody Machine machine, BindingResult result) {
        if (result.hasErrors()) {
            return "updateService";
        }
        updateMachineInDb(id, machine);
        machineService.save(machine);
        return "dashboard";
    }

    private void updateMachineInDb(@PathVariable long id, @RequestBody @ModelAttribute("machine") @Valid Machine machine) {
        Machine oldMachine = machineService.findMachineById(id);

        oldMachine.setAdditionalEquipment(machine.getAdditionalEquipment());
        oldMachine.setDescription(machine.getDescription());
        oldMachine.setMachineName(machine.getMachineName());
        oldMachine.setSerialNumber(machine.getSerialNumber());
        oldMachine.setUpdatedOn(LocalDateTime.now());
        machine.setCreatedOn(oldMachine.getCreatedOn());
        machine.setUser(oldMachine.getUser());
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

    private User userAuthentication() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();
        return userService.findByUserName(username);
    }

}
