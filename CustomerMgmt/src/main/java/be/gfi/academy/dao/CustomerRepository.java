package be.gfi.academy.dao;

import be.gfi.academy.model.Customer;
import org.springframework.data.repository.CrudRepository;

public interface CustomerRepository  extends CrudRepository<Customer, Long>, CustomerRepositoryExt {
}
