package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Member;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class MemberRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Member member) {
        em.persist(member);
    }

    // 회원 전체 검색
    public List<Member> findAll() {
        return em.createQuery("select m from Member m", Member.class).getResultList();
    }

    // 특정 회원 검색
    public Member findOne(Long id) {
        return em.find(Member.class, id);

    }
}
