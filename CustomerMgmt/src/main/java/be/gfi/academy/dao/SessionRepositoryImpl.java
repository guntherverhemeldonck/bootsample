package be.gfi.academy.dao;

import be.gfi.academy.model.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.EntityType;
import java.util.List;

public class SessionRepositoryImpl implements SessionRepositoryExt {
    private static Logger log = LoggerFactory.getLogger(SessionRepositoryImpl.class);

    @Autowired
    private EntityManager em;

    @Override
    public List<Session> findAllForCustomer(long id) {
        final CriteriaBuilder builder = em.getCriteriaBuilder();
        final CriteriaQuery<Session> criteria = builder.createQuery(Session.class);
        final EntityType<Session> type = em.getMetamodel().entity(Session.class);
        final Root<Session> sessionRoot = criteria.from(Session.class);
        criteria.select(sessionRoot);
        criteria.where(builder.equal(sessionRoot.get("customerId"), id));
        criteria.orderBy(builder.desc(sessionRoot.get("sessionDate")));
        return em.createQuery(criteria).getResultList();
    }
}
