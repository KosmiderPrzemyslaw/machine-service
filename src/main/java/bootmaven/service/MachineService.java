package bootmaven.service;

import bootmaven.model.Machine;

public interface MachineService {
    MachineService findBySerialNumber(int serialNumber);

    Machine findMachineById(long id);

    void save(Machine machine);

    void delete(long id);
}
