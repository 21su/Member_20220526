package com.its.member.Service;

import com.its.member.DTO.CommentDTO;
import com.its.member.Repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentRepository commentRepository;

    public List<CommentDTO> findAll(Long b_id) {
        return commentRepository.findAll(b_id);
    }

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }
}
