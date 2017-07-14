package be.gfi.academy.dao;

import be.gfi.academy.model.Customer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.persistence.metamodel.EntityType;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepositoryExt {
    private static Logger log = LoggerFactory.getLogger(CustomerRepositoryImpl.class);

    @Autowired
    private EntityManager em;

    @Override
    public List<Customer> lookupByName(String qry) {
        log.trace("Lookup customer by name [{}]", qry);
        final CriteriaBuilder builder = em.getCriteriaBuilder();
        final CriteriaQuery<Customer> query = builder.createQuery(Customer.class);
        final EntityType<Customer> type = em.getMetamodel().entity(Customer.class);
        final Root<Customer> root = query.from(Customer.class);

        query.where(
                builder.or(
                        builder.like(
                                builder.lower(
                                        root.get(
                                                type.getDeclaredSingularAttribute("firstname", String.class)
                                        )
                                ), "%" + qry.toLowerCase() + "%"
                        ),
                        builder.like(
                                builder.lower(
                                        root.get(
                                                type.getDeclaredSingularAttribute("lastname", String.class)
                                        )
                                ), "%" + qry.toLowerCase() + "%"
                        )
                )
        );

        return em.createQuery(query).getResultList();
    }
}
