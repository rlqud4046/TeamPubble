package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.service.MemberService;
import com.pubble.conpub.service.MileageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class MypageController {
    /*@Autowired
    private Member member;*/

    @Autowired
    private MemberService memberService;

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
        return "mypage/updateMyInfo";
    }

    @GetMapping("/updateInfo-check")
    public String updateInfoCheck(Model model) { //, @RequestParam String id, @RequestParam String pwd
        //비밀번호가 일치하는지 확인
        /*
        boolean result = memberService.checkPassword(id, pwd);

        //일치하면 수정 처리 후 마이페이지로 리다이렉트
        if(result) {
            memberService.updateMember(id); //수정가능한 사항: 비밀번호,
            return "redirect:/mypage/updateInfo";
        }
        */
        //일치하지 않으면 '비밀번호를 올바르게 입력해주세요' 출력


       //회원정보를 model 에 저장

        return "mypage/updateMyInfo";
    }

    @GetMapping("/unsubscribe")
    public String unsubscribe(Model model) {
        return "mypage/unsubscribe";
    }

    @GetMapping("/unsubscribe-check")
    public String unsubscribeCheck(Model model, HttpSession session, @RequestParam("id") String id) {
        //삭제
        memberService.deleteMember(id);
        //세션 무효화
        session.invalidate();

        return "index";
    }

    /*@GetMapping("/mypage")
    public String mypage(Model model) {

        return "mypage/myShoppingInfo";
    }*/

}
