package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.YesNo;
import com.pubble.conpub.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.RollbackException;
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

    // 메모 저장 메서드
    public Member saveMemo(Long id, String memo){
        Member member = memberRepository.findOne(id);
        member.setMemberMemo(memo);
        memberRepository.saveMemo(member);
        member = memberRepository.findOne(id);
        return member;
    }

    // 메모 리셋 메서드
    public Member resetMemo(Long id){
        Member member = memberRepository.findOne(id);

        return member;
    }

   /* // 블랙리스트 전환
    public Member black(Long id, YesNo black){
        Member member = memberRepository.findOne(id);
        member.setMemberBlack(black);
        memberRepository.save(member);
        member = memberRepository.findOne(id);
        return member;
    }*/


    // 회원 삭제 확인
    public int deleteCheck(Long id, String admin_pwd){
        Member member = memberRepository.findAdmin();

        int res = 0;
        if(member.getMemberPwd().equals(admin_pwd)){
            res = memberRepository.deleteMember(id);
        }

        return res;
    }

    // 특정 회원 찾기
    public List<Member> findMonth(){
        return memberRepository.findMonth();
    }

}
