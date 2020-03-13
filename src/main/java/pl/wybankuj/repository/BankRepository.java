package pl.wybankuj.repository;

import org.springframework.data.repository.CrudRepository;
import pl.wybankuj.entity.Bank;

import java.util.Optional;

public interface BankRepository extends CrudRepository<Bank, Long> {

    Optional<Bank> findFirstById(Long bankId);
}
