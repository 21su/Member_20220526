package com.its.member.Controller;

import com.its.member.DTO.BoardDTO;
import com.its.member.DTO.MemberDTO;
import com.its.member.DTO.PageDTO;
import com.its.member.Service.BoardService;
import com.its.member.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    @Autowired
    private BoardService boardService;

    @GetMapping("/save")
    public String saveForm(){
        return "/member/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberService.save(memberDTO);
        return "/index";
    }

    @PostMapping("/memberIdCheck")
    public @ResponseBody boolean memberIdCheck(@RequestParam("memberId") String memberId){
        return memberService.memberIdCheck(memberId);
    }

    @GetMapping("/login")
    public String loginForm(){
        return "/member/login";
    }

    @PostMapping("/loginCheck")
    public @ResponseBody boolean roginCheck(@ModelAttribute MemberDTO loginDTO){
        MemberDTO memberLogin = memberService.loginCheck(loginDTO);
        if(memberLogin != null){
            return true;
        }else{
            return false;
        }
    }

    @PostMapping("/login")
    public String rogin(@ModelAttribute MemberDTO memberDTO, HttpSession session){
        MemberDTO loginDTO = memberService.loginCheck(memberDTO);
        if (loginDTO != null){
            session.setAttribute("loginId", loginDTO.getM_id());
            session.setAttribute("loginMemberId", loginDTO.getMemberId());
            session.setAttribute("loginMemberName", loginDTO.getMemberName());
            session.setAttribute("loginMemberProfileName", loginDTO.getMemberProfileName());
            return "redirect:/member/main";
        }else{
            System.out.println("로그인 실패");
            return "/member/login";
        }
    }

    @GetMapping("/main")
    public String main(@RequestParam(value = "page", required = false, defaultValue = "1") int page
            ,HttpSession session,Model model){
        String login = (String)session.getAttribute("loginMemberId");
        if(login != null){
            List<BoardDTO> boardList = boardService.findAll(page);
            PageDTO paging = boardService.paging(page);
            model.addAttribute("boardDTO", boardList);
            return "board/main";
        }else{
            return "member/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "/index";
    }

    @GetMapping("/detail")
    public String detail(Model model, HttpSession session){
        Long id = (Long)session.getAttribute("loginId");
        if(id != null){
            MemberDTO loginDTO = memberService.detail(id);
            model.addAttribute("loginDTO",loginDTO);
            return "/member/detail";
        }else{
            return "/member/login";
        }
    }

    @GetMapping("/detailAdmin")
    public String detailAdmin(@RequestParam("m_id") Long m_id,Model model){
        MemberDTO loginDTO = memberService.detail(m_id);
        model.addAttribute("loginDTO",loginDTO);
        return "/member/detailAdmin";
    }

    @GetMapping("/update")
    public String update(@RequestParam("m_id") Long m_id,
                         Model model){
        MemberDTO loginDTO = memberService.detail(m_id);
        model.addAttribute("loginDTO", loginDTO);
        return "/member/update";
    }

    @PostMapping("/update")
    public String updateFrom(@ModelAttribute MemberDTO memberDTO,HttpSession session) throws IOException {
        String profileName = memberService.update(memberDTO);
        session.setAttribute("loginMemberProfileName", profileName);
        return "redirect:/member/detail";
    }

    @GetMapping("/deleteId")
    public String deleteId(@RequestParam("m_id")Long m_id){
        memberService.deleteId(m_id);
        return "redirect:/member/logout";
    }

    @GetMapping("/deleteAdmin")
    public String deleteAdmin(@RequestParam("m_id")Long m_id){
        memberService.deleteId(m_id);
        return "redirect:/member/findAll";
    }

    @GetMapping("/admin")
    public String admin(){
        return "/member/admin";
    }

    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberList = memberService.findAll();
        model.addAttribute("memberList",memberList);
        System.out.println(memberList);
        return "/member/findAll";
    }
}
