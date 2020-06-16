package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Reply;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class ReplyRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Reply reply){
        em.persist(reply);
    }
}
