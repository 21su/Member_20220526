package com.its.member.Repository;

import com.its.member.DTO.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void save(MemberDTO memberDTO) {
        sql.insert("Member.save",memberDTO);
    }

    public MemberDTO memberIdCheck(String memberId) {
        return sql.selectOne("Member.same",memberId);
    }

    public MemberDTO loginCheck(MemberDTO loginDTO) {
        return sql.selectOne("Member.login",loginDTO);
    }

    public MemberDTO detail(Long id) {
        return sql.selectOne("Member.detail", id);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update", memberDTO);
    }

    public void deleteId(Long m_id) {
        sql.delete("Member.deleteId",m_id);
    }

    public List<MemberDTO> findAll() {
        System.out.println("MemberRepository.findAll");
        return sql.selectList("Member.findAll");
    }
}
