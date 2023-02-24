package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

@RestController
public class AjaxController {
	// MemberService 객체생성
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.GET)	
	public ResponseEntity<String> idCheck(HttpServletRequest request) {
		String result="";
		// data:{'id':$('.id').val()},
		String id=request.getParameter("memId");
		//MemberDTO   = getMember() 메서드 호출
		MemberDTO dto=memberService.getMember(id);
		
		if(dto!=null) {
			// 아이디 있음 => 아이디 중복
			result = "iddup";
		}else {
			// 아이디 없음 => 아이디 사용가능
			result = "idok";
		}
		//ResponseEntity에 출력결과를 담아서 리턴
		ResponseEntity<String> entity=
				new ResponseEntity<String>(result,HttpStatus.OK);
		return entity;
	}
	
}
