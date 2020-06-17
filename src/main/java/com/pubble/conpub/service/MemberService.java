package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    // 전체 회원 조회 메서드
    public List<Member> findMembers() {
        return memberRepository.findAll();
    }

    // 특정 회원 조회 메서드
    public Member findOne(Long id) {
        return memberRepository.findOne(id);
    }


}
