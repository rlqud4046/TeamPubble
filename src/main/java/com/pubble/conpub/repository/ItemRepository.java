package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Item;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class ItemRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Item item){
        em.persist(item);
    }
}
