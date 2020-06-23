package com.pubble.conpub.service;

import com.pubble.conpub.domain.Email;
import com.pubble.conpub.domain.Member;
import com.pubble.conpub.repository.EmailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EmailService {

    @Autowired
    private EmailRepository emailRepository;

    // 메일 전송
    @Transactional
    public void sendEmail(Email email){

        emailRepository.sendEmail(email);
    }

    // 전체 메일 조회
    public List<Email> findEmails() {
        return emailRepository.findAll();
    }

    // 특정 회원의 메일 조회
    public Email findOne(Long id){
        return emailRepository.findOne(id);
    }
}
