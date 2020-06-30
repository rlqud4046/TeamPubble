package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.Mileage;
import com.pubble.conpub.service.MemberService;
import com.pubble.conpub.service.MileageService;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MileageController {
    @Autowired
    private MileageService mileageService;

    @GetMapping("/mileage")
    public String mileage(Model model, @RequestParam("id") String id) {
        List<Mileage> mileageList = mileageService.getMileageList(id);
        
        //마일리지 리스트를 model을 이용해 뷰로 보냄
        model.addAttribute("mileageList", mileageList);

        return "mypage/myMileage";
    }


}
