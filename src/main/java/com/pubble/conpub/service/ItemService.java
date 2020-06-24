package com.pubble.conpub.service;


import com.pubble.conpub.domain.Item;
import com.pubble.conpub.domain.OptionList;
import com.pubble.conpub.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service
public class ItemService{

    @Autowired
    private ItemRepository itemRepository;

    @Transactional
    public List<String> OptionDetail(Long page_no,String type){
        List<OptionList> listA = itemRepository.findOptionType(type);
        List<OptionList> listB = itemRepository.findOptionNo(page_no);

        String str = null;
        List<String> listC = new ArrayList<String >();

        for(int i=0;i<listA.size();i++){
            for(int j=0;j<listB.size();j++){
               if(listA.get(i).getId().equals(listB.get(j).getId())){

                  str = listA.get(i).getOptionDetail();

                  listC.add(str);
               }
            }
        }

        return listC;
    }

    @Transactional
    public int cash(Long no, String selectedTextColor, String selectedTextBothSides, String selectedCoverCoating, String selectedCoverSide, String selectedCoverColor, String selectedAnnalsCoverColor, String selectedCoverType, String selectedHardGold, String selectedSize, String selectedBinding, String selectedBindingDirection, String selectedPaper) {

                List<Item> items =itemRepository.findCash(no);

        System.out.println(items.get(0).getItemBasePrice());
        int basic = items.get(0).getItemBasePrice();

        int add1=0,add2=0,add3=0,add4=0,add5=0,add6=0,add7=0,add8=0,
                add9=0,add10=0,add11=0,add12=0;

        System.out.println("베이직~~~"+basic+"//"+add1);

        if(selectedTextColor!=null){
            add1 = itemRepository.findAddCash(selectedTextColor).get(0).getOptionPrice();
        }
        if(selectedAnnalsCoverColor!=null){
            add2 = itemRepository.findAddCash(selectedAnnalsCoverColor).get(0).getOptionPrice();
        }
        if(selectedBinding!=null){
            add3 = itemRepository.findAddCash(selectedBinding).get(0).getOptionPrice();
        }
        if(selectedBindingDirection!=null){
            add4 = itemRepository.findAddCash(selectedBindingDirection).get(0).getOptionPrice();
        }
        if(selectedCoverCoating!=null){
            add5 = itemRepository.findAddCash(selectedCoverCoating).get(0).getOptionPrice();
        }
        if(selectedCoverColor!=null){
            add6 = itemRepository.findAddCash(selectedCoverColor).get(0).getOptionPrice();
        }
        if(selectedCoverSide!=null){
            add7 = itemRepository.findAddCash(selectedCoverSide).get(0).getOptionPrice();
        }
        if(selectedCoverType!=null){
            add8 = itemRepository.findAddCash(selectedCoverType).get(0).getOptionPrice();
        }
        if(selectedHardGold!=null){
            add9 = itemRepository.findAddCash(selectedHardGold).get(0).getOptionPrice();
        }
        if(selectedPaper!=null){
            add10 = itemRepository.findAddCash(selectedPaper).get(0).getOptionPrice();
        }
        if(selectedSize!=null){
            add11 = itemRepository.findAddCash(selectedSize).get(0).getOptionPrice();
        }
        if(selectedTextBothSides!=null){
            add12 = itemRepository.findAddCash(selectedTextBothSides).get(0).getOptionPrice();
        }
        System.out.println(basic+"//"+add1 +"//"+add2+"//"+add3+"//"+add4+"//"+add5+"//"+add6+"//"+add7+"//"+add8+"//"+add9+"//"+add10+"//"+add11+"//"+add12);

        return basic+add1+add2+add3+add4+add5+add6+add7+add8+add9+add10+add11+add12;
    }

    public int signature(String selectedSignaturePage) {
         return itemRepository.findAddCash(selectedSignaturePage).get(0).getOptionPrice();
    }

    // 전체 아이템 조회 메서드
    public List<Item> findItems() {
        return itemRepository.findAll();
    }

    // 특정 아이템 조회
    public Item findOne(Long id){
        return itemRepository.findOne(id);
    }
}
