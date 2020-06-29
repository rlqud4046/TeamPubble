package com.pubble.conpub.repository;


import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.SelectedOption;
import com.pubble.conpub.domain.SelectedStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import java.util.List;

@Repository
public class OrderRepository{

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(SelectedOption selectedOption){
        em.persist(selectedOption);
    }

    public void cart(Member member, SelectedStatus selectedStatus){
        em.
    }

}
