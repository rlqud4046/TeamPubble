package com.pubble.conpub.controller;

import com.pubble.conpub.domain.Board;
import com.pubble.conpub.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.print.Pageable;

@Controller
//공지/QNA/견적 순서대로 1/2/3번
public class BoardController {

    @Autowired
    BoardService boardService;

    /*
    @GetMapping({"", "/"})
    public String board(@RequestParam(value="idx", defaultValue = "0") Long idx,
                        Model model) {
        model.addAttribute("board", boardService.findBoardByIdx(idx));
        return "/board/form";
    }

    @GetMapping("/list")
    public String list(@PageableDefault Pageable pageable, Model model) {
        Page<Board> boardList = boardService.findBoardList(pageable);
        boardList.stream().forEach(e -> e.getContent()); //getContent 구현 필요
        model.addAttribute("boardList", boardList);

        return "/board/list";
    }
    */
}
