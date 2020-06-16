package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Member;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class MemberRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Member member){
        em.persist(member);
    }
}
