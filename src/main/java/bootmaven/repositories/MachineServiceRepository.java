package bootmaven.repositories;

import bootmaven.model.Machine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MachineServiceRepository extends JpaRepository<Machine, Integer> {

    Machine findBySerialNumber(int serialNumber);

    void deleteMachineById(long id);

    Machine findMachineById(long id);
}
