package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
    /*@Autowired
    private Member member;*/

    //메인페이지
    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        //필요한 처리

        return "mypage/myCart";
    }

    @GetMapping("/updateInfo")
    public String updateInfo(Model model) {
        //필요한 처리

        return "mypage/updateMyInfo";
    }

    @GetMapping("/unsubscribe")
    public String unsubscribe(Model model) {
        //필요한 처리

        return "mypage/unsubscribe";
    }

}
