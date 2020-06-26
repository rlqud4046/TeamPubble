package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Item;
import com.pubble.conpub.domain.Member;
import com.pubble.conpub.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ItemController {

    @Autowired
    private ItemService itemService;

    @RequestMapping("/item/list")
    public String item_list(Model model){
        List<Item> items = itemService.findItems();
        model.addAttribute("List", items);

        return "admin/admin_item_list";
    }

    @RequestMapping("/item/edit")
    public String item_edit(Model model, @RequestParam("id") Long id){

        Item item = itemService.findOne(id);
        model.addAttribute("Item", item);

        return "admin/admin_item_edit";
    }
}
