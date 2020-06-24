package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Member;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.util.List;
import java.time.LocalDateTime;
import java.util.Calendar;
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



    // 회원 전체 검색
    public List<Member> findAll() {
        return em.createQuery("select m from Member m", Member.class).getResultList();
    }

    // 특정 회원 검색
    public Member findOne(Long id) {
        return em.find(Member.class, id);
    }

    // 메모 저장

    public void saveMemo(Member member) {
        em.persist(member);
    }

    // 관리자 확인
    public Member findAdmin(){
        return em.createQuery("select m from Member m where m.id = 1", Member.class).getSingleResult();
    }

    // 회원 삭제
    public int deleteMember(Long id){

        return em.createQuery("delete from Member m where m.id =: id").setParameter("id",id).executeUpdate();
    }

    // 해당 월 생일자 검색
    public List<Member> findMonth() {

        int monthInt = Calendar.MONTH+1;
        String month = String.valueOf(monthInt);


        if(monthInt<10){
            month = "0"+month;
        }

        return em.createQuery("select m from Member m where substring(m.memberBirth, 3, 2) " +
                "=: month", Member.class).setParameter("month", month).getResultList();
    }
}
