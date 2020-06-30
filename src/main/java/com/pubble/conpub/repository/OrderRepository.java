package com.pubble.conpub.repository;


import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.Mileage;
import com.pubble.conpub.domain.Order;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class OrderRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Order order){
        em.persist(order);
    }

    public List<Order> readOrder(Member pickMember) {
        return em.createQuery("select o from Order o where o.id= :id", Order.class)
                .setParameter("id", pickMember).getResultList();
    }
}
