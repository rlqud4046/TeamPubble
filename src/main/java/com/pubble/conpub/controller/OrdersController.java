package com.pubble.conpub.controller;

import com.pubble.conpub.domain.SelectedOption;
import com.pubble.conpub.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrdersController {

    @Autowired
    private OrderService orderService;

    //상품페이지에서 바로 '주문하기' 클릭시
    @RequestMapping("/orders/order")
    public String orders(SelectedOption selectedOption, Model model){
        System.out.println(selectedOption.getSize()+"확인"+selectedOption.getAnnalsCoverColor());
        model.addAttribute("selected",selectedOption);
        return "orders/ordersForm";
    }

    /*//상품페이지에서 '장바구니' 클릭시
    @RequestMapping("/orders/cart")
    public String cart(SelectedOption selectedOption,Model model){
        *//*selectedOption테이블에 상태를 stored로 저장하기*//*
        orderService.addCart(selectedOption);

        *//*DB에서 상태가 stored인 데이터만 검색해서 데려오기*//*



        return "orders/cartForm";
    }*/

}
