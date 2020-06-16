package com.pubble.conpub.repository;

import com.pubble.conpub.domain.OptionList;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class OptionListRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(OptionList optionList){
        em.persist(optionList);
    }
}
