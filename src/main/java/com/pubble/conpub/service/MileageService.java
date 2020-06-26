package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.Mileage;
import com.pubble.conpub.repository.MileageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.TransactionRequiredException;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class MileageService {
    @Autowired
    private MileageRepository mileageRepository;

    public MileageService(MileageRepository mileageRepository) {
        this.mileageRepository = mileageRepository;
    }

    @Transactional
    public void getMileage(Mileage mileage) {
        mileageRepository.save(mileage);
    }

    /**
     * 로그인한 유저의 id를 받아 해당 유저의 마일리지 내역 리스트를 반환해주는 함수
     * @param userId
     * @return List<Mileage>
     */
    @Transactional
    public List<Mileage> getMileageList(String userId) {
        Member pickMember = mileageRepository.findMemberId(userId);

        List<Mileage> mileageList = mileageRepository.readMileage(pickMember);

        return mileageList;
    }
}


































