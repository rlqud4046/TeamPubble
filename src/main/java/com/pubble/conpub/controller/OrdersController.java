package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Item;
import com.pubble.conpub.domain.Member;
import com.pubble.conpub.domain.SelectedOption;
import com.pubble.conpub.repository.SelectedOptionRepository;
import com.pubble.conpub.service.ItemService;
import com.pubble.conpub.service.MemberService;
import com.pubble.conpub.service.OrderService;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class OrdersController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ItemService itemService;

    @Autowired
    private MemberService memberService;

    //상품페이지에서 바로 '주문하기' 클릭시
    @RequestMapping("/orders/order")
    public String orders(SelectedOption selectedOption, Model model){
        System.out.println(selectedOption.getSize()+"확인"+selectedOption.getAnnalsCoverColor());
        model.addAttribute("selected",selectedOption);
        return "orders/ordersForm1";
    }

    //장바구니에서 선택한 상품 주문하기 클릭시
    @RequestMapping("/orders/orders")
    public String orders(List<SelectedOption> selectedOptionList){
        return null;
    }

    //상품페이지에서 '장바구니' 클릭시
    @RequestMapping("/orders/cart")
    public void cart(SelectedOption selectedOption, Model model, @RequestParam("member_no") Long member_no, @RequestParam("no") Long item_no, HttpServletResponse response) throws IOException {


        //selectedOption테이블에 상태를 stored로 저장하기
        Member member = new Member();
        member.setId(member_no);

        Item item = new Item();
        item.setId(item_no);


        selectedOption.setSelectOptionMember(member);
        selectedOption.setItem(item);
        orderService.addCart(selectedOption);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<script>");
        out.println("var cart=confirm('장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?')");
        out.println("if (cart==true) { location.href='order/cartMain?member_no="+member_no+"'}");
        out.println("</script>");


    }

    //메인페이지에서 '장바구니' 클릭시
    @RequestMapping("/order/cartMain")
    public String cart(@RequestParam("member_no") Long member_no,Model model,HttpServletResponse response) throws IOException {
        //상품테이블에서 상품리스트가져오기. (item_no에 해당하는 item_name을 구하기위해)
        model.addAttribute("itemList",itemService.findItems());

        //member_no인 멤버 데려오기
        Member member = memberService.findOne(member_no);

        //DB에서 상태가 stored인 데이터만 검색해서 데려오기
        model.addAttribute("cartList",orderService.searchCart(member));

        return "./orders/cartForm";
    }

    //장바구니에서 수량or별명 변경시
    @RequestMapping("/updateCart")
    public void changeCart(@RequestParam(value = "d",required = false) String d,@RequestParam(value = "value",required = false) String value,@RequestParam(value = "no",required = false) Long no,HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        System.out.println("===============================================================d====" +  d);
        System.out.println("===============================================================value====" +  value);
        System.out.println("===============================================================no====" +  no);

        //해당 장바구니 상품객체 불러오기
        SelectedOption selectedOption=orderService.cartItem(no);

        //불러온 객체에 변경된값 넣어주기
        if(d.equals("alias")){
            selectedOption.setAlias(value);
        }else if(d.equals("amount")){
            selectedOption.setAmount(Integer.parseInt(value));
        }

        //객체저장
        orderService.addCart(selectedOption);

        if(d.equals("amount")){
            out.println(Integer.parseInt(value));
        }
    }



}
