package com.its.member.Controller;

import com.its.member.DTO.BoardDTO;
import com.its.member.DTO.CommentDTO;
import com.its.member.DTO.PageDTO;
import com.its.member.Service.BoardService;
import com.its.member.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;
    @Autowired
    CommentService commentService;

    @GetMapping("/main")
    public String main(@RequestParam(value = "page", required = false, defaultValue = "1") int page
            , HttpSession session, Model model){
        String login = (String)session.getAttribute("loginMemberId");
        BoardDTO boardFirstDTO = boardService.findFirst();
        if(login != null){
            if(boardFirstDTO == null){
                return "board/save";
            }
            List<BoardDTO> boardList = boardService.findAll(page);
            PageDTO paging = boardService.paging(page);
            model.addAttribute("boardList", boardList);
            model.addAttribute("paging",paging);
            return "board/main";
        }else{
            return "member/login";
        }
    }

    @GetMapping("/save")
    public String save(){
        return "/board/save";
    }

    @PostMapping("/save")
    public String saveForm(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/main";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("b_id") Long b_id,
                         @RequestParam("page") int page, Model model){
        BoardDTO boardDTO = boardService.detail(b_id);
        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("page", page);

        List<CommentDTO> commentList = commentService.findAll(b_id);
        model.addAttribute("commentList", commentList);
        return "/board/detail";
    }

    @GetMapping("/deleteBoard")
    public String deleteBoard(@ModelAttribute("b_id") Long b_id){
        boardService.deleteBoard(b_id);
        return "redirect:/board/main";
    }

    @GetMapping("/updateBoard")
    public String updateBoard(@RequestParam("b_id") Long b_id,
                              @RequestParam("page") int page,
                              Model model){
        BoardDTO boardDTO = boardService.detail(b_id);
        model.addAttribute("boardDTO", boardDTO);
        model.addAttribute("page", page);
        return "/board/updateBoard";
    }

    @PostMapping("/updateBoard")
    public String updateBoardForm(@ModelAttribute BoardDTO boardDTO,
                                  @RequestParam("page") int page,
                                  Model model){
        boardService.updateBoard(boardDTO);
        BoardDTO boardDTO1 = boardService.detail(boardDTO.getB_id());
        model.addAttribute("boardDTO",boardDTO1);
        model.addAttribute("page", page);
        return "/board/detail";
    }

    @GetMapping("/search")
    public String search(@RequestParam("type") String type,
                         @RequestParam("search") String search, Model model){
        List<BoardDTO> boardDTOList = boardService.search(type,search);
        model.addAttribute("boardList", boardDTOList);
        return "/board/main";
    }
}
