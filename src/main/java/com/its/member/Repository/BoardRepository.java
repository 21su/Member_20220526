package com.its.member.Repository;

import com.its.member.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    SqlSessionTemplate sql;
    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> findAll(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.findAll",pagingParam);
    }

    public BoardDTO findFirst() {
        return sql.selectOne("Board.findFirst");
    }

    public void save(BoardDTO boardDTO) {
        System.out.println("BoardRepository.save");
        sql.insert("Board.save", boardDTO);
    }

    public BoardDTO detail(Long b_id) {
        sql.update("Board.hits", b_id);
        return sql.selectOne("Board.detail", b_id);
    }

    public void deleteBoard(Long b_id) {
        sql.delete("Board.deleteBoard",b_id);
    }
}
