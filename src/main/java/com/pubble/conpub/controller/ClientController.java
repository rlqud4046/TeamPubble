package com.pubble.conpub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClientController {

    @RequestMapping("/client/page")
    public String clientpage(){
        return "Mdirectory/Client_Page";
    }

}
