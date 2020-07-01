package bootmaven.service;

import bootmaven.model.Machine;
import bootmaven.repositories.MachineServiceRepository;
import org.springframework.stereotype.Service;

@Service

public class MachineServiceImpl implements MachineService {

    private final MachineServiceRepository machineServiceRepository;

    public MachineServiceImpl(MachineServiceRepository machineServiceRepository) {
        this.machineServiceRepository = machineServiceRepository;
    }

    @Override
    public MachineService findBySerialNumber(int serialNumber) {
        return (MachineService) machineServiceRepository.findBySerialNumber(serialNumber);

    }

    @Override
    public Machine findMachineById(long id) {
        return machineServiceRepository.findMachineById(id);
    }

    @Override
    public void save(Machine machine) {
        machineServiceRepository.save(machine);
    }

    @Override
    public void delete(long id) {
        machineServiceRepository.deleteMachineById(id);
    }
}
