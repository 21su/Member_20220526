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
}
