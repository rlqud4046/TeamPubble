package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Faq;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class FaqRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Faq faq){
        em.persist(faq);
    }
}
