package com.its.member.Service;

import com.its.member.DTO.MemberDTO;
import com.its.member.Repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public void save(MemberDTO memberDTO) throws IOException {
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        memberDTO.setMemberProfileName(memberProfileName);
        String savePath = "D:\\spring_img\\" + memberProfileName;
        if (!memberProfile.isEmpty()){
            memberProfile.transferTo((new File(savePath)));
        }
        memberRepository.save(memberDTO);
    }

    public boolean memberIdCheck(String memberId) {
        MemberDTO memberIdCheck = memberRepository.memberIdCheck(memberId);
        if(memberIdCheck == null){
            return true;
        }else {
            return false;
        }
    }

    public MemberDTO loginCheck(MemberDTO loginDTO) {
        return memberRepository.loginCheck(loginDTO);
    }

    public MemberDTO detail(Long id) {
        return memberRepository.detail(id);
    }

    public String update(MemberDTO memberDTO) throws IOException {
        MultipartFile memberProfile = memberDTO.getMemberProfile();
        String memberProfileName = memberProfile.getOriginalFilename();
        memberProfileName = System.currentTimeMillis() + "-" + memberProfileName;
        if(memberProfileName.length() != 14){
            memberDTO.setMemberProfileName(memberProfileName);
            String savePath = "D:\\spring_img\\" + memberProfileName;
            if (!memberProfile.isEmpty()){
                memberProfile.transferTo((new File(savePath)));
            }
        }
        memberRepository.update(memberDTO);
        return memberDTO.getMemberProfileName();
    }

    public void deleteId(Long m_id) {
        memberRepository.deleteId(m_id);
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }
}
