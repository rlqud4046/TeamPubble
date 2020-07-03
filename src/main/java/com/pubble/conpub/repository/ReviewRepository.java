package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.Review;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class ReviewRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Review review){
        em.persist(review);
    }

    /*리뷰 게시판 모든 리뷰를 가져오는 메서드*/
    public List<Review> findAll(){
        return em.createQuery("select r from Review r",Review.class).getResultList();
    }

    /*특정 상품의 모든 리뷰를 가져오는 메서드:no는 상품번호*/
    public List<Review> findItemReview(Long page_no){
        return em.createQuery("select r from Review r where r.reviewItem.id=: item_no",Review.class).setParameter("item_no",page_no).getResultList();
    }



}
