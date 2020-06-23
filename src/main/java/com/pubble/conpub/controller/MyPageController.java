package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {
    /*@Autowired
    private Member member;*/

    @GetMapping("/myPage/main")
    private String myPage(){
        return "myPage/myShoppingInfo";
    }

    @GetMapping("/myPage/mileage")
    private String shoppingList(){
        return "/myPage/mileage";
    }

}
