package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Delivery;
import com.pubble.conpub.domain.Email;
import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.YesNo;
import com.pubble.conpub.service.DeliveryService;
import com.pubble.conpub.service.EmailService;
import com.pubble.conpub.service.MemberService;
import com.pubble.conpub.service.MileageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MileageService mileageService;

    @Autowired
    private DeliveryService deliveryService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private JavaMailSender mailSender;


    @GetMapping("/member/list")
    public String member_list(Model model) {

        List<Member> members = memberService.findMembers();
        model.addAttribute("List", members);

        return "admin/admin_member";
    }

    @GetMapping("member/info")
    public String member_info(Model model, @RequestParam("id") Long id) {

        Member member = memberService.findOne(id);

        model.addAttribute("One", member);

        return "admin/admin_member_infos";
    }

    @RequestMapping(value = "/member/memo", method = RequestMethod.POST)
    public @ResponseBody
    Member member_memo(@RequestParam("id") Long id, @RequestParam("memo") String memo) {


        Member member = memberService.saveMemo(id, memo);

        return member;
    }

    @RequestMapping(value = "/member/memo_reset", method = RequestMethod.POST)
    public @ResponseBody
    Member member_memo_reset(@RequestParam("id") Long id) {


        Member member = memberService.resetMemo(id);

        return member;
    }

    /*// 블랙리스트 전환 메서드
    @RequestMapping(value = "/member_black", method = RequestMethod.POST)
    public Member member_black(@RequestParam("id") Long id, @RequestParam("black") YesNo black){

        Member member = memberService.black(id,black);

        return member;
    }*/

    @RequestMapping(value = "/member/delete")
    public void member_delete(@RequestParam("id") Long id, @RequestParam("admin_pwd") String admin_pwd,
                              HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int res = memberService.deleteCheck(id, admin_pwd);

        if (res == 1) {
            out.println("<script>");
            out.println("self.close();");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('비밀번호가 틀렸습니다.')");
            out.println("history.back()");
            out.println("</script>");
        }
    }


    @GetMapping("/member/sms")
    public String member_sms() {

        return "admin/admin_sms";
    }

    @GetMapping("/member/sms_send")
    public void member_sms(Model model, @RequestParam("sms_category") String sms_category,
                           @RequestParam("sms_text") String sms_text) {

        List<Member> members = null;
        if (sms_category.equals("smsAll")) {
            members = memberService.findMembers();
        } else if (sms_category.equals("smsMonth")) {
            members = memberService.findMonth();
        }

        for (int i = 0; i < members.size(); i++) {

            sms_text = sms_text.replace("{DATE}", LocalDate.now().toString());
            sms_text = sms_text.replace("{MEM_ID}", members.get(i).getMemberId());
            sms_text = sms_text.replace("{MEM_NAME}", members.get(i).getMemberName());

            sms_text = sms_text.replace("{SITE_URL}", "http://www.google.com");

           /* sms_text = sms_text.replace("{DELIVERY_NAME}",);
            sms_text = sms_text.replace("{MILEAGE}",);*/

        }
        // 보내기 기능 해야함

        System.out.println(sms_text);

    }

    @GetMapping("/member/mail")
    public String member_mail() {

        return "admin/admin_mail";
    }

    @RequestMapping("/member/mail_send")
    public void member_mailSend(@RequestParam("email_category") String email_category,
                                @RequestParam("email_title") String title,
                                @RequestParam("email_cont") String cont, HttpServletResponse response) throws IOException {


        List<Member> members = null;
        if (email_category.equals("emailAll")) {
            members = memberService.findMembers();
        } else if (email_category.equals("emailMonth")) {
            members = memberService.findMonth();
        }

        String originCont = cont;

        int res = 0;
        for (int i = 0; i < members.size(); i++) {

            String replacedCont = originCont;
            Email email = new Email();
            replacedCont = replacedCont.replace("{DATE}", LocalDate.now().toString());
            replacedCont = replacedCont.replace("{MEM_ID}", members.get(i).getMemberId());
            replacedCont = replacedCont.replace("{MEM_NAME}", members.get(i).getMemberName());

            replacedCont = replacedCont.replace("{SITE_URL}", "http://www.google.com");

            String toMail = members.get(i).getMemberEmail();

            email.setEmailTitle(title);
            email.setEmailCont(replacedCont);
            email.setEmailMember(members.get(i));
            emailService.sendEmail(email);


            try {
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
                messageHelper.setFrom("minwtest1@naver.com");
                messageHelper.setTo(toMail);
                messageHelper.setSubject(title);
                messageHelper.setText(replacedCont);

                res = 1;
                mailSender.send(message);
            } catch (Exception e) {
                res = 0;
                System.out.println(e);
            }


        }

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (res == 1) {
            out.println("<script>");
            out.println("alert('발송 완료')");
            out.println("history.back()");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('발송에 실패했습니다.')");
            out.println("history.back()");
            out.println("</script>");
        }

    }

    @GetMapping("/member/mail_history")
    public String member_mailHistory(Model model) {
        List<Email> emails = emailService.findEmails();
        model.addAttribute("List", emails);

        return "admin/admin_mail_history";
    }

    @GetMapping("member/send_info")
    public String send_info(Model model, @RequestParam("id") Long id, @RequestParam("memid") Long memid) {

        Member member = memberService.findOne(memid);

        Email email = emailService.findOne(id);

        model.addAttribute("Member", member);
        model.addAttribute("Email", email);

        return "admin/admin_send_info";
    }

    @RequestMapping("/member/rule") // 약관동의 화면
    public String memberRule() {
        return "Mdirectory/Member_Rule";
    }

    @RequestMapping("/member/join/check") // 가입여부 확인
    public String memberJoinCheck() {
        return "Mdirectory/Member_Join_Check";
    }

    @RequestMapping("/member/check") // 이름, 이메일 확인
    public void memberCheck(@RequestParam("name") String name, @RequestParam("email") String email, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int check = memberService.memberCheck(name, email);

        out.println(check);
    }

    @RequestMapping("/member/join/form") // 회원가입 폼창 맴버 저장
    public String memberJoinForm() {
        return "Mdirectory/Member_Join_Form";
    }

    @RequestMapping("/member/join") // 가입처리 과정
    public String memberJoin(Member member, @RequestParam("bun1") String bun1, @RequestParam("bun2") String bun2, @RequestParam("bun3") String bun3
            , @RequestParam("Email1") String Email1, @RequestParam("Email2") String Email2, Model model) {

        member.setMemberPhone(bun1 + "-" + bun2 + "-" + bun3);
        member.setMemberEmail(Email1 + "@" + Email2);
        member.setMemberRegdate(LocalDateTime.now());

        member = memberService.join(member);

        model.addAttribute("Member", member);

        return "Mdirectory/Member_Join_Complete";
    }
/*
    @RequestMapping("/member/login")// 로그인 페이지
    public String memberLogin(){
        return "Mdirectory/Member_login";
    }*/

    @RequestMapping("/member/login/ok") // 로그인 처리
    public void memberLoginOk(HttpSession session, @RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        Member loginCheck = memberService.memberLoginCheck(id, pwd);

        session.setAttribute("member", loginCheck);

        out.println(loginCheck.getMemberId());
    }

    @RequestMapping("/member/logout") // 로그아웃
    public String memberLogout(HttpSession session) {

        session.invalidate();

        return "index";
    }

    @RequestMapping("/member/find/id") // 아이디 찾기
    public String memeberFindIdForm() {
        return "Mdirectory/Member_Find_Id_Form";
    }

    @RequestMapping("/member/find/id/ok") // 아이디 찾기 처리
    public void memberFindIdOk(HttpServletResponse response, @RequestParam("name") String name, @RequestParam("email") String email) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();


        Member findId = memberService.memberFindId(name, email);

        if (findId == null) {
            out.println(0);
        } else {
            out.println(findId.getMemberId());
        }
    }

    @RequestMapping("/member/find/id/o")
    public String memberFindIdO(Model model, @RequestParam("id") String id) {
        model.addAttribute("id", id);
        return "Mdirectory/Member_Find_Id_Complete";
    }

    @RequestMapping("/member/find/pwd")
    public String memberFindPwdForm() {
        return "Mdirectory/Member_Find_Pwd_Form";
    }

    @RequestMapping("/member/find/pwd/ok")
    public void memberFindPwdOk(HttpServletResponse response, @RequestParam("id") String id, @RequestParam("email") String email) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        Member findMemberPwd = memberService.memberFindPwd(id, email);

        System.out.println(findMemberPwd.getMemberId());
        System.out.println(findMemberPwd.getMemberEmail());

        if (findMemberPwd == null) {
            out.println(0);
        } else {
            memberService.memberPwdChange(findMemberPwd);
            out.println(findMemberPwd.getMemberEmail());
        }
    }

    @RequestMapping("/member/find/change")
    public String memberPwdChange(Model model, @RequestParam("email") String email) {
        model.addAttribute("email", email);
        return "Mdirectory/Member_Find_Pwd_Complete";
    }

    @PostMapping("/member/id/overlap/check")
    public void memberIdOverlapCheck(HttpServletResponse response, @RequestParam("userId") String userId) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int idOverlap = memberService.memberIdOverlap(userId);

        out.println(idOverlap);

    }

}
