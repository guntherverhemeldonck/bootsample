package be.gfi.academy.dao;

import be.gfi.academy.model.Customer;

import java.util.List;

public interface CustomerRepositoryExt {
    List<Customer> lookupByName(String qry);
}
