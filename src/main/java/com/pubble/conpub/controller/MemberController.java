package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/member_list")
    public String member_list(Model model) {

        List<Member> members = memberService.findMembers();
        model.addAttribute("List", members);

        return "admin_member";
    }

    @GetMapping("member_info")
    public String member_info(Model model, @RequestParam("id") Long id) {

        Member member = memberService.findOne(id);
        model.addAttribute("One", member);

        return "admin_member_infos";
    }

}
