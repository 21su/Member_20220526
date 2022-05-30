package com.its.member.Service;

import com.its.member.DTO.BoardDTO;
import com.its.member.DTO.PageDTO;
import com.its.member.Repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    BoardRepository boardRepository;

    static final int PAGE_LIMIT = 5;
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

    public BoardDTO findFirst() {
        return boardRepository.findFirst();
    }

    public void save(BoardDTO boardDTO) throws IOException {
        MultipartFile boardFile = boardDTO.getBoardFile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;
        boardDTO.setBoardFileName(boardFileName);
        String savePath = "D:\\spring_img\\" + boardFileName;
        if (!boardFile.isEmpty()){
            boardFile.transferTo((new File(savePath)));
        }
        System.out.println("BoardService.save");
        boardRepository.save(boardDTO);
    }

    public BoardDTO detail(Long b_id) {
        boardRepository.hits(b_id);
        return boardRepository.detail(b_id);
    }

    public void deleteBoard(Long b_id) {
        boardRepository.deleteBoard(b_id);
    }

    public void updateBoard(BoardDTO boardDTO) {
        boardRepository.updateBoard(boardDTO);
    }

    public List<BoardDTO> search(String type, String search) {
        Map<String,String> map = new HashMap<>();
        map.put("type", type);
        map.put("search",search);
        return boardRepository.search(map);
    }
}
