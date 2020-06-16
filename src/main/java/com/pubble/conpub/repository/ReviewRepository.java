package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Review;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class ReviewRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Review review){
        em.persist(review);
    }
}
