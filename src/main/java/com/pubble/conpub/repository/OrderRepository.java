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

import com.pubble.conpub.domain.Mileage;
import com.pubble.conpub.domain.Order;
import org.springframework.stereotype.Repository;
import javax.persistence.*;
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


    public SelectedOption findOne(Long id){
        return em.find(SelectedOption.class,id);
    }

    //특정회원의 장바구니 조회
    public List<SelectedOption> cart(Member member){
        return em.createQuery("select s from SelectedOption s where s.selectOptionMember=: member and s.selectedStatus='STORED'",SelectedOption.class)
                .setParameter("member",member).getResultList();
    }


    public List<Order> readOrder(Member pickMember) {
        return em.createQuery("select o from Order o where o.id= :id", Order.class)
                .setParameter("id", pickMember).getResultList();
    }

}
