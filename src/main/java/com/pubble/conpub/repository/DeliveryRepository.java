package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Delivery;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class DeliveryRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Delivery delivery){
        em.persist(delivery);
    }
}
