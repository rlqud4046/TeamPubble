package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Item;
import com.pubble.conpub.domain.OptionList;
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


    public List<OptionList> findOptionNo(Long page_no){

        System.out.println("여긴 레포지토리! 페이지넘버는?"+page_no);

        List<OptionList> listA =em.createQuery("select ol from OptionList  ol join  ol.items item where item.id=: no",OptionList.class)
                .setParameter("no",page_no).getResultList();

        return listA;
    }

    public List<OptionList> findOptionType(String type){

        return em.createQuery("select ol from OptionList ol where ol.optionType like :type",OptionList.class).setParameter("type", type)
                .getResultList();
    }


    public List<Item> findCash(Long no){

        System.out.println("ㅇ긴 파인드캐쉬~~~~"+no);
        return (em.createQuery("select i from Item i where i.id=:id")
                .setParameter("id",no).getResultList());
    }
    public List<OptionList> findAddCash(String detail){
        return (em.createQuery("select o from OptionList o where o.optionDetail=:detail")
                .setParameter("detail",detail).getResultList());
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
