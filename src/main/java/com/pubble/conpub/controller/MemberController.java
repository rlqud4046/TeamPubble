package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Member;
import com.pubble.conpub.repository.MemberRepository;
import com.pubble.conpub.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
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

    @GetMapping("/member_info")
    public String member_info(Model model, @RequestParam("id") Long id) {

        Member member = memberService.findOne(id);
        model.addAttribute("One", member);

        return "admin_member_infos";
    }

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

    @RequestMapping("/") // 메인화면
    public String index(){ return "index"; }

    @RequestMapping("/member/rule") // 약관동의 화면
    public String memberRule(){
        return "Mdirectory/Member_Rule";
    }

    @RequestMapping("/member/join/check") // 가입여부 확인
    public String memberJoinCheck(){ return "Mdirectory/Member_Join_Check"; }

    @RequestMapping("/member/check") // 이름, 이메일 확인
    public void memberCheck(@RequestParam("name") String name, @RequestParam("email") String email, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int check = memberService.memberCheck(name,email);

        out.println(check);
    }

    @RequestMapping("/member/join/form") // 회원가입 폼창 맴버 저장
    public String memberJoinForm() {
        return "Mdirectory/Member_Join_Form";
    }

    @RequestMapping("/member/join") // 가입처리 과정
    public String memberJoin(Member member, @RequestParam("bun1") String bun1, @RequestParam("bun2") String bun2, @RequestParam("bun3") String bun3
            , @RequestParam("Email1") String Email1, @RequestParam("Email2") String Email2, Model model){

        member.setMemberPhone(bun1+"-"+bun2+"-"+bun3);
        member.setMemberEmail(Email1+"@"+Email2);
        member.setMemberRegdate(LocalDateTime.now());

        member = memberService.join(member);

        model.addAttribute("Member",member);

        return "Mdirectory/Member_Join_Complete";
    }

    @RequestMapping("/member/login")// 로그인 페이지
    public String memberLogin(){
        return "Mdirectory/Member_login";
    }

    @RequestMapping("/member/login/ok") // 로그인 처리
    public void memberLoginOk(HttpSession session, @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        Member loginCheck = memberService.memberLoginCheck(id, pwd);

        session.setAttribute("member",loginCheck);

        out.println(loginCheck.getMemberId());
    }

    @RequestMapping("/member/logout") // 로그아웃
    public String memberLogout(HttpSession session){

        session.invalidate();

        return "index";
    }

    @RequestMapping("/member/find/id") // 아이디 찾기
    public String memeberFindIdForm(){
        return "Mdirectory/Member_Find_Id_Form";
    }

    @RequestMapping("/member/find/id/ok") // 아이디 찾기 처리
    public void memberFindIdOk(HttpServletResponse response, @RequestParam("name") String name, @RequestParam("email") String email) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();


        Member findId = memberService.memberFindId(name, email);

        if(findId == null){
            out.println(0);
        }else{
            out.println(findId.getMemberId());
        }
    }

    @RequestMapping("/member/find/id/o")
    public String memberFindIdO(Model model ,@RequestParam("id") String id){
        model.addAttribute("id",id);
        return "Mdirectory/Member_Find_Id_Complete";
    }

    @RequestMapping("/member/find/pwd")
    public String memberFindPwdForm(){ return "Mdirectory/Member_Find_Pwd_Form"; }

    @RequestMapping("/member/find/pwd/ok")
    public String memberFindPwdOk(HttpServletResponse response, @RequestParam("id") String id, @RequestParam("email") String email) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        Member findMemberPwd = memberService.memberFindPwd(id, email);

        if (findMemberPwd == null){
            out.println(0);
        }else{
            memberService.memberPwdChange();
        }

        return "";
    }



}
