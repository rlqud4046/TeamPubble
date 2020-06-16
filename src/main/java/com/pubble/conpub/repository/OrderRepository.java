package com.pubble.conpub.repository;


import com.pubble.conpub.domain.Order;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class OrderRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Order order){
        em.persist(order);
    }
}
