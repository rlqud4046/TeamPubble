package com.pubble.conpub.repository;

import com.pubble.conpub.domain.SelectedOption;

import javax.persistence.*;

public class SelectedOptionRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(SelectedOption selectedOption){
        em.persist(selectedOption);
    }
}
