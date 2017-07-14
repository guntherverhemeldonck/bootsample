package be.gfi.academy.dao;

import be.gfi.academy.model.Session;

import java.util.List;

public interface SessionRepositoryExt {

    List<Session> findAllForCustomer(long id);
}
