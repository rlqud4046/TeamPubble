package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Board;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class BoardRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Board board){
        em.persist(board);
    }
}
