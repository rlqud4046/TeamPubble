package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Board;
import com.pubble.conpub.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @RequestMapping("/")
    public String a(){
        return "index";
    }

    @GetMapping("/board/write")
    public String boardWrite(Model model){
        return "board/boardWriteForm";
    }

    @PostMapping("/board/writeOk")
    public String boardWriteOk(Board board){

        return "redirect:/";
    }

}
