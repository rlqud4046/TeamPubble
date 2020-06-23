package com.pubble.conpub.controller;

import com.pubble.conpub.domain.OptionList;
import com.pubble.conpub.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

@Controller
public class ItemsController {

    @Autowired
    private ItemService itemService;

    @GetMapping("/items")
    private String itemPage(Model model,@RequestParam("no") Long page_no){



        model.addAttribute("no",page_no);

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

        @RequestMapping("/sum")
    private void sumCash(Model model, @RequestParam(value = "selectedPage", required = false) String selectedPage, @RequestParam(value = "selectedTextColor", required = false) String selectedTextColor,
                        @RequestParam(value = "selectedTextBothSides", required = false) String selectedTextBothSides, @RequestParam(value = "selectedCoverCoating", required = false) String selectedCoverCoating,
                        @RequestParam(value = "selectedCoverSide", required = false) String selectedCoverSide, @RequestParam(value = "selectedCoverColor", required = false) String selectedCoverColor,
                        @RequestParam(value = "selectedAnnalsCoverColor", required = false) String selectedAnnalsCoverColor,
                        @RequestParam(value = "selectedCoverType", required = false) String selectedCoverType, @RequestParam(value = "selectedHardGold", required = false) String selectedHardGold,
                        @RequestParam(value = "selectedSize", required = false) String selectedSize, @RequestParam(value = "no", required = false) Long no,
                        @RequestParam(value = "selectedSignaturePage", required = false) String selectedSignaturePage, @RequestParam(value = "selectedBinding", required = false) String selectedBinding,
                        @RequestParam(value = "selectedBindingDirection", required = false) String selectedBindingDirection, @RequestParam(value = "selectedPaper", required = false) String selectedPaper,
                        HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        System.out.println("신순신수니수니수니수니쉬누시누시ㅜㅅ니쉬눗니ㅜ시누시뉘");
        System.out.println("================ > " + no);
        System.out.println("================ > " + selectedSize);
        System.out.println("================ > " + selectedBindingDirection);
        System.out.println("================ > " + selectedTextColor);

        int sum = 0;


        int add = itemService.cash(no, selectedTextColor, selectedTextBothSides, selectedCoverCoating, selectedCoverSide,
                selectedCoverColor, selectedAnnalsCoverColor, selectedCoverType, selectedHardGold,
                selectedSize, selectedBinding, selectedBindingDirection, selectedPaper);

        if(selectedSignaturePage!=null) {
            int signaturePage = itemService.signature(selectedSignaturePage);
            out.println(sum + (add *  + signaturePage));
        }else {


        out.println(sum + (add * Integer.parseInt(selectedPage)));
        }

    }
}

