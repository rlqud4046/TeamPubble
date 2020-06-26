package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Delivery;
import com.pubble.conpub.domain.Email;
import com.pubble.conpub.domain.Member;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class EmailRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Email email) {
        em.persist(email);
    }

    public void sendEmail(Email email) {
        em.persist(email);
    }

    // 전체 메일 검색
    public List<Email> findAll() {
        return em.createQuery("select e from Email e", Email.class).getResultList();
    }

    // 특정 회원 메일 검색
    public Email findOne(Long id) {

        return em.find(Email.class, id);

    }
}
