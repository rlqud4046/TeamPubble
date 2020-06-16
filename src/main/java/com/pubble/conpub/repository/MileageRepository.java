package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Mileage;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class MileageRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Mileage mileage){
        em.persist(mileage);
    }
}
