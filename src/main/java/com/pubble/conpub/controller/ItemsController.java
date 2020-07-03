package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Review;
import com.pubble.conpub.service.ItemService;
import com.pubble.conpub.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.naming.Name;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class ItemsController {

    @Autowired
    private ItemService itemService;
    @Autowired
    private ReviewService reviewService;

    @GetMapping("/items")
    private String itemPage(Model model,@RequestParam("no") Long page_no){


        //page_no와 그에 해당하는 상품명,상품사진 보내주기
        model.addAttribute("no",page_no);
        model.addAttribute("itemName",itemService.findItemName(page_no));
        model.addAttribute("itemImage1",itemService.findItemImage1(page_no));
        model.addAttribute("itemImage2",itemService.findItemImage2(page_no));
        model.addAttribute("itemImage3",itemService.findItemImage3(page_no));
        model.addAttribute("itemInfo",itemService.findItemInfo(page_no));
        model.addAttribute("itemDelivery",itemService.findItemDelivery(page_no));
        model.addAttribute("itemRec",itemService.findItemRec(page_no));

        //page_no에 해당하는 리뷰 가져오기
        List<Review> listReview = reviewService.FindReviewList(page_no);
        model.addAttribute("review", listReview);
        //해당리뷰 작성자 아이디 가져오기



        //select에 해당하는 option값 보내주기
        List<String> listS =itemService.OptionDetail(page_no,"size%");
        model.addAttribute("SizeList",listS);

        List<String> listCT =itemService.OptionDetail(page_no,"CoverType");
        model.addAttribute("CoverTypeList",listCT);

        List<String> listP = itemService.OptionDetail(page_no,"Paper");
        model.addAttribute("PaperList",listP);

        List<String> listB = itemService.OptionDetail(page_no,"Binding");
        model.addAttribute("BindingList",listB);

        List<String> listBD = itemService.OptionDetail(page_no,"BindingDirection");
        model.addAttribute("BindingDirectionList",listBD);

        List<String> listCCL = itemService.OptionDetail(page_no,"CoverColor");
        model.addAttribute("CoverColorList",listCCL);

        List<String> listCS = itemService.OptionDetail(page_no,"CoverSide");
        model.addAttribute("CoverSideList",listCS);

        List<String> listCCT = itemService.OptionDetail(page_no,"CoverCoating");
        model.addAttribute("CoverCoatingList",listCCT);

        List<String> listTC = itemService.OptionDetail(page_no,"TextColor");
        model.addAttribute("TextColorList",listTC);

        List<String> listTBS = itemService.OptionDetail(page_no,"TextBothSides");
        model.addAttribute("TextBothSidesList",listTBS);

        List<String> listACC = itemService.OptionDetail(page_no,"AnnalsCoverColor");
        model.addAttribute("AnnalsCoverColorList",listACC);

        List<String> listHG = itemService.OptionDetail(page_no,"HardGold");
        model.addAttribute("HardGoldList",listHG);

        List<String> listSP = itemService.OptionDetail(page_no,"SignaturePage");
        model.addAttribute("SignaturePageList",listSP);

        return "/items/itemPage";
    }

    //상품페이지에서 모든 옵션 선택시 단가 계산
    @RequestMapping("/sum")
    private void sumCash(Model model, @RequestParam(value = "selectedPage", required = false) String selectedPage, @RequestParam(value = "selectedTextColor", required = false) String selectedTextColor,
                        @RequestParam(value = "selectedTextBothSides", required = false) String selectedTextBothSides, @RequestParam(value = "selectedCoverCoating", required = false) String selectedCoverCoating,
                        @RequestParam(value = "selectedCoverSide", required = false) String selectedCoverSide, @RequestParam(value = "selectedCoverColor", required = false) String selectedCoverColor,
                        @RequestParam(value = "selectedAnnalsCoverColor", required = false) String selectedAnnalsCoverColor, @RequestParam(value = "selectedAmount", required = false) String selectedAmount,
                        @RequestParam(value = "selectedCoverType", required = false) String selectedCoverType, @RequestParam(value = "selectedHardGold", required = false) String selectedHardGold,
                        @RequestParam(value = "selectedSize", required = false) String selectedSize, @RequestParam(value = "no", required = false) Long no,
                        @RequestParam(value = "selectedBinding", required = false) String selectedBinding,
                        @RequestParam(value = "selectedBindingDirection", required = false) String selectedBindingDirection, @RequestParam(value = "selectedPaper", required = false) String selectedPaper,
                        HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int sum = 50;


        int add = itemService.cash(no, selectedTextColor, selectedTextBothSides, selectedCoverCoating, selectedCoverSide,
                selectedCoverColor, selectedAnnalsCoverColor, selectedCoverType, selectedHardGold,
                selectedSize, selectedBinding, selectedBindingDirection, selectedPaper);


        try {
            out.println((sum + add)* (Integer.parseInt(selectedPage))*Integer.parseInt(selectedAmount));
        }catch (Exception e){
            out.println((sum +add )*Integer.parseInt(selectedAmount));

        }

    }

    @RequestMapping("/signature")
    private void sumcash(@RequestParam("signaturePage") String sp,HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println(itemService.signature(sp));
    }

}

