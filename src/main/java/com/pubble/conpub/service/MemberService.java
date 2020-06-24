package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.internet.MimeMessage;
import java.util.List;
import java.util.Random;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;
    @Autowired
    private JavaMailSender mailSender;

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

    @Transactional
    public void memberPwdChange(Member member){

        StringBuffer temp =new StringBuffer();  // 난수 발생
        Random rnd = new Random();
        for(int i=0;i<10;i++){
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
        System.out.println(pwd);

        member.setMemberPwd(pwd);
        memberRepository.save(member);

        try {

            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");

            messageHelper.setFrom("minwtest1@naver.com");
            messageHelper.setTo(member.getMemberEmail());
            messageHelper.setSubject("임시비밀번호를 알려드립니다.");
            messageHelper.setText("귀하의 임시비밀번호는 " + pwd + "입니다");

            mailSender.send(message);

        }catch (Exception e){
            System.out.println(e);
        }

    }

    public int memberIdOverlap(String userId){

        Member overlap = memberRepository.memberIdOverlap(userId);

        if(overlap == null){
            return 1;
        }else{
            return 0;
        }
    }







}
