package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.OpenBankingService;


public class OpenBankingAPIController {
	
	@Inject
	private OpenBankingService openBankingService;
	
	@RequestMapping (value = "/transaction", method = RequestMethod.GET)
	public String getToken(Model model) throws Exception{
		//인증
		/*
		 * //인증 응답 메시지 명세 System.out.println("code:" + requestTokenDTO.getCode());
		 * System.out.println("Client_info:" + requestTokenDTO.getClient_info());
		 * System.out.println("Scope:" + requestTokenDTO.getScope());
		 * System.out.println("State:" + requestTokenDTO.getState());
		 */
		
		//토큰 발급 => code, client_id, client_secret, redirect_uri
		//			grant_type
		
		// 토큰 발급 처리 
		/*
		 * ResponseTokenDTO responseTokenDTO =
		 * openBankingService.requestToken(requestTokenDTO);
		 */
		
		// 리턴 정보를 Model에 저장
//		model.addAttribute("responseTokenDTO", responseTokenDTO);
		
		return "market/details"; //bank_main.jsp
	}
}
