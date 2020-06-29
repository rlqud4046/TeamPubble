package com.pubble.conpub.service;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.SelectedOption;
import com.pubble.conpub.domain.SelectedStatus;
import com.pubble.conpub.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Transactional/*선택된 상품옵션을 장바구니에 저장*/
    public void addCart(SelectedOption selectedOption){
        int result =0;
        selectedOption.setSelectedStatus(SelectedStatus.STORED);
        orderRepository.save(selectedOption);
    }

    @Transactional/*특정회원의 장바구니 조회*/
    public List<SelectedOption> searchCart(Long id){


        return orderRepository.cart();
    }


}
