package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Order;
import com.pubble.conpub.service.MileageService;
import com.pubble.conpub.service.OrderService;
import com.pubble.conpub.service.SelectedOptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class OrderController {

    private OrderService orderService;
    @Autowired
    private MileageService mileageService;
    private SelectedOptionService selectedOptionService;

    @GetMapping({"/mypage", "/shoppingInfo"})
    public String mypage(Model model) { //, @RequestParam("id") String id

        /*

        //필요한 처리
        List<Order> orderList = orderService.getOrderList(id);
        String alias = selectedOptionService.getAlias(id);
        //이거 id로 받는 게 아니라 주문번호로 받아야 함. 주문번호를 어디서 받아오지?
        //0. 세션을 통해 유저아이디를 가져오고 이 유저아이디를 통해 Member를 가져옴
        //1. Member를 통해 옵션선택테이블의 ORDER_NO를 구할 수 있음. (이거 여러개 있을 수 있으니 List인가?)
        //2. 이 ORDER_NO를 통해 ORDER 테이블의 ORDER_NO를 가져온다 (ORDER_NO끼리는 1:1이니까 괜찮나..? 여러 개 있으면?)
        //2. 주문번호를 통해 주문번호(만든 메서드 수정 필요)

        //ORDERS 테이블의 해당 컬럼들을 받아옴
        //ORDER_NO ORDER_STATUS ORDER_DATE
        //orderList를 model을 이용해 뷰로 보냄
        model.addAttribute("orderList", orderList);

        //	SELECTED_OPTION 테이블 ALIAS 컬럼 받아옴
        model.addAttribute("alias", alias);



         */
        return "mypage/myShoppingInfo";
    }
}

