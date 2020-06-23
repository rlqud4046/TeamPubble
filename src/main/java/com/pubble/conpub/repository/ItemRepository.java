package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Item;
import com.pubble.conpub.domain.Member;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class ItemRepository {
    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Item item){
        em.persist(item);
    }


    // 아이템 전체 검색
    public List<Item> findAll() {
        return em.createQuery("select i from Item i", Item.class).getResultList();
    }


    // 특정 회원 검색
    public Item findOne(Long id) {
        return em.find(Item.class, id);
    }
}
