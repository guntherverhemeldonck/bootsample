package be.gfi.academy.dao;

import be.gfi.academy.model.Session;
import org.springframework.data.repository.CrudRepository;

public interface SessionRepository  extends CrudRepository<Session, Long>, SessionRepositoryExt {
}
