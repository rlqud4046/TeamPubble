package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Member;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;

@Repository
public class MemberRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Member member){
        em.persist(member);
    }

    public List<Member> findByNameEmail(String name, String email){
        return  em.createQuery("select m from Member m where m.memberName=:name and m.memberEmail=:email",Member.class)
                .setParameter("name",name).setParameter("email",email)
                .getResultList();
    }

    public Member findByIdPwd(String id, String pwd){

        try{
            return em.createQuery("select m from Member m where m.memberId=:id and m.memberPwd=:pwd",Member.class)
                    .setParameter("id",id).setParameter("pwd",pwd)
                    .getSingleResult();
        }catch (Exception e){
            return null;
        }
    }

    public Member findMemberId(String name, String email){

        try{
            return em.createQuery("select m from Member m where m.memberName=:name and m.memberEmail=:email", Member.class)
                    .setParameter("name", name).setParameter("email", email)
                    .getSingleResult();
        }catch (Exception e){
            return null;
        }
    }

    public Member findMemberPwd(String id, String email){

        try {
            return em.createQuery("select m from Member m where m.memberId=: id and m.memberEmail=: email",Member.class)
                    .setParameter("id",id).setParameter("email",email)
                    .getSingleResult();
        }catch (Exception e){
            return null;
        }
    }

    public Member memberIdOverlap(String userId){

        try {
            return em.createQuery("select m from Member m where m.memberId=: userId",Member.class)
                    .setParameter("userId",userId)
                    .getSingleResult();
        }catch (Exception e){
            return null;
        }


    }


}
