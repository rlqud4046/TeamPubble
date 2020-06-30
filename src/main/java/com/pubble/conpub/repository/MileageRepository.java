package com.pubble.conpub.repository;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.Mileage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import java.util.List;

@Repository
public class MileageRepository {

    @PersistenceContext
    private EntityManager em;

    @PersistenceUnit
    private EntityManagerFactory emf;

    public void save(Mileage mileage) {
        em.persist(mileage);
    }

    public List<Mileage> readMileage(Member member) { //마일리지 내역(해당 id의 Mileage 칼럼들로 이루어진 리스트)이 필요
        return em.createQuery("select m from Mileage m where m.mileageMember= :member", Mileage.class)
                .setParameter("member", member).getResultList();
    }

    //Member 테이블의 id를 가져왔음. 이걸 통해서 해당 Member를 가져오고 member테이블의 PK를 가져온다.
    public Member findMemberId(String userId) {
        try {
            return em.createQuery("select m from Member m where m.memberId=:userId", Member.class)
                    .setParameter("userId", userId).getSingleResult();
        }catch (Exception e){
            return null;
        }
    }

}
