package com.its.member.Service;

import com.its.member.DTO.BoardDTO;
import com.its.member.DTO.PageDTO;
import com.its.member.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    static final int PAGE_LIMIT = 3;
    static final int BLOCK_LIMIT = 3;

    public PageDTO paging(int page) {
        int boardCount = boardRepository.boardCount();
        int maxPage = (int)(Math.ceil((double)boardCount/PAGE_LIMIT));
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage){
            endPage = maxPage;
        }
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public List<BoardDTO> findAll(int page) {
        int pagingStart = (page-1) *PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start",pagingStart);
        pagingParam.put("limit",PAGE_LIMIT);
        List<BoardDTO> pagingList = boardRepository.findAll(pagingParam);
        return pagingList;
    }
}
