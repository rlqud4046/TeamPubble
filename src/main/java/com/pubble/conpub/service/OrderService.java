package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.SelectedOption;
import com.pubble.conpub.domain.SelectedStatus;
import com.pubble.conpub.repository.OrderRepository;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Transactional//선택된 상품옵션을 장바구니에 저장
    public void addCart(SelectedOption selectedOption){
        selectedOption.setSelectedStatus(SelectedStatus.STORED);
        orderRepository.save(selectedOption);
    }

    @Transactional//특정회원의 장바구니 조회
    public List<SelectedOption> searchCart(Member member){
        return orderRepository.cart(member);
    }

    @Transactional//장바구니에 담긴 특정 상품의 객체 불러오기
    public SelectedOption cartItem(Long id){
        return orderRepository.findOne(id);
    }

}
