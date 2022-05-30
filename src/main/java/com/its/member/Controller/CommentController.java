package com.its.member.Controller;

import com.its.member.DTO.CommentDTO;
import com.its.member.Service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> saveComment(@ModelAttribute CommentDTO commentDTO){
        System.out.println("commentDTO = " + commentDTO);
        System.out.println("아아");
        commentService.save(commentDTO);
        List<CommentDTO> commentList = commentService.findAll(commentDTO.getB_id());
        return commentList;
    }
}
