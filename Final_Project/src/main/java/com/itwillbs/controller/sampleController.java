package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.SampleDTO;
import com.itwillbs.service.SampleService;

@Controller
public class sampleController {
	
	@Inject
	private SampleService sampleService;
	
	//폼 태그로 입력값을 받을 때 ex) 회원가입, 로그인 -> post 방식
	//그 외에 get 방식
	
	//가상 주소 유지하면서 이동: 폴더명/파일명
		/*
		 * 현재 가상주소: /member/login
		 * 이동하고자 하는 페이지: 로그인 페이지 => return "member/loginForm";
		 */
	
	//주소가 바뀌면서 이동: redirect:가상주소
		/*
		 * 현재 가상주소: /member/login
		 * 이동하고자 하는 페이지: 메인 페이지 => return "redirect:/market/main";
		 */
	
	@RequestMapping(value = "/sample/index", method = RequestMethod.GET)
	public String index() {
		
		return "sample/index";
	}
	
	@RequestMapping(value = "/sample/test", method = RequestMethod.GET)
	public String test() {
		
		return "sample/test";
	}
	@RequestMapping(value = "/sample/testPro", method = RequestMethod.POST)
	public String insertTest(SampleDTO sampleDTO) {
		
		sampleService.insertTest(sampleDTO);
		
		return "redirect:/sample/index";
	}
	
	
	
}
