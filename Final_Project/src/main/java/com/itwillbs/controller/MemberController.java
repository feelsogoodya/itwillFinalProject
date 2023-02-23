package com.itwillbs.controller;

import java.lang.System.Logger;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;


@Controller
public class MemberController {

	@Inject
	private MemberService memberService;

	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert() {
		return "member/insertForm";
	}
	
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:/member/login";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		return "member/loginForm";
	}
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO dto, HttpSession session) {
		System.out.println("MemberController loginPro() ");
		System.out.println(dto.getMemId());
		System.out.println(dto.getMemPass());

		MemberDTO memberDTO = memberService.userCheck(dto);
		System.out.println(memberDTO);

		if (memberDTO != null) {
			session.setAttribute("memId", memberDTO.getMemId());
			return "redirect:/member/mypage";
		} else {
			return "member/msg";
		}
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/member/idFind", method = RequestMethod.GET)
	public String idFind(HttpServletRequest request, Model model, MemberDTO searchVO) {
		return "member/idFind";
	}
	
	@RequestMapping(value = "/member/searchId")
	public String searchId(HttpServletRequest request, Model model,
	    @RequestParam(required = true, value = "memName") String memName, 
	    @RequestParam(required = true, value = "memPhone") String memPhone,
	    MemberDTO searchVO) {
	try {
	    searchVO.setMemName(memName);
	    searchVO.setMemPhone(memPhone);
	    MemberDTO memberSearch = memberService.memberIdSearch(searchVO);
	    
	    model.addAttribute("searchVO", memberSearch);
	 
	} catch (Exception e) {
	    System.out.println(e.toString());
	    model.addAttribute("msg", "오류가 발생되었습니다.");
	}
	
	return "member/searchId";
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/member/passFind", method = RequestMethod.GET)
	public String passFind(HttpServletRequest request, Model model) {
		return "member/passFind";
	}
	
	@RequestMapping(value = "/member/searchPass", method = RequestMethod.POST)
	public String searchPass(HttpServletRequest request, Model model,
	    @RequestParam(required = true, value = "memName") String memName, 
	    @RequestParam(required = true, value = "memPhone") String memPhone, 
	    @RequestParam(required = true, value = "memId") String memId, MemberDTO searchVO) {
	 
	try {
	    searchVO.setMemName(memName);
	    searchVO.setMemPhone(memPhone);
	    searchVO.setMemId(memId);
	    int memberSearch = memberService.memberPwdCheck(searchVO);
	    
	    if(memberSearch == 0) {
	        model.addAttribute("msg", "기입된 정보가 잘못되었습니다. 다시 입력해주세요.");
	        return "/member/searchPass";
	    }
	    
	    String newPwd = RandomStringUtils.randomAlphanumeric(10);
	    searchVO.setMemPass(newPwd);
	    
	    memberService.passwordUpdate(searchVO);
	    
	    model.addAttribute("newPwd", newPwd);
	 
	} catch (Exception e) {
	    System.out.println(e.toString());
	    model.addAttribute("msg", "오류가 발생되었습니다.");
	}
	 
	 
	return "/member/searchPass";
	}

	// 약관
	@RequestMapping(value = "/member/terms", method = RequestMethod.GET)
	public String terms() {
		return "member/terms";
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		// 로그아웃 처리
		session.invalidate();
		return "redirect:/member/mypage";
	}

	@RequestMapping(value = "/member/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String memId = (String) session.getAttribute("memId");
		MemberDTO dto = memberService.getMember(memId);
		model.addAttribute("dto", dto);
		return "member/mypage";
	}
	
	
	@RequestMapping(value = "/member/myshop", method = RequestMethod.GET)
	public String myshop(HttpSession session, Model model) {
		String memId = (String) session.getAttribute("memId");
		MemberDTO dto = memberService.getMember(memId);
		model.addAttribute("dto", dto);
		return "member/myshop";
	}

	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		String memId = (String) session.getAttribute("memId");
		MemberDTO dto = memberService.getMember(memId);
		model.addAttribute("dto", dto);
		return "member/updateForm";
	}
	
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)	
	public String updatePro(MemberDTO dto) {
			memberService.updateMember(dto);
			return "redirect:/member/mypage";
	}
	
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, Model model) {
		String memId = (String) session.getAttribute("memId");
		MemberDTO dto = memberService.getMember(memId);
		model.addAttribute("dto", dto);
		return "member/deleteForm";
	}

	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO dto, HttpSession session) {
			memberService.deleteMember(dto);
			session.invalidate();
			return "redirect:/member/mypage";
	}
	
}
