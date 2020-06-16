package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.SiteImage;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;

@Repository
public class SiteImageRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(SiteImage siteImage){
        em.persist(siteImage);
    }
}
