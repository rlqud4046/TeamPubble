package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class MemberService {

    Member member = new Member();

    @Autowired
    private MemberRepository memberRepository;

    //@Autowired
    //private JavaMailSender mailSender;

    // 전체 회원 조회 메서드
    public List<Member> findMembers() {
        return memberRepository.findAll();
    }

    // 특정 회원 조회 메서드
    public Member findOne(Long id) {
        return memberRepository.findOne(id);
    }


    @Transactional
    //회원가입
    public Member join(Member member){

        memberRepository.save(member);
        return member;
    }

    public int memberCheck(String name, String email){
        List<Member> checkMember = memberRepository.findByNameEmail(name, email);

        if(checkMember.isEmpty()){
            return 1;  // 리스트가 비어있는 경우 가입 가능
        }else{
            return 0; // 리스트가 비어있지 않은 경우 가입 불가능
        }
    }

    public Member memberLoginCheck(String id, String pwd){
        Member login = memberRepository.findByIdPwd(id, pwd);

        return login;
    }

    public Member memberFindId(String name, String email){
        Member findMemberId = memberRepository.findMemberId(name, email);

        return findMemberId;
    }

    public Member memberFindPwd(String id, String email){
        Member findMemberPwd = memberRepository.findMemberPwd(id,email);

        return findMemberPwd;
    }

    public void memberPwdChange(){

        StringBuffer temp =new StringBuffer();  // 난수 발생
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
                case 0:
                    // a-z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                    break;
                case 1:
                    // A-Z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                    break;
                case 2:
                    // 0-9
                    temp.append((rnd.nextInt(10)));
                    break;
            }
        }
        String pwd = temp.toString();
    }

    //회원정보 수정 필요
}
