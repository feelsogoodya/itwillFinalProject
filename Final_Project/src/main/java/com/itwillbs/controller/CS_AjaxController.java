package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.CustomerserviceDTO;
import com.itwillbs.service.CustomerserviceService;



@RestController
public class CS_AjaxController {
	
	@Inject
	private CustomerserviceService customerservice;
	
	@RequestMapping(value = "/customerservice/processChange", method = RequestMethod.GET)
	public void processChange(HttpServletRequest request) {
		int processFieldnum = Integer.parseInt(request.getParameter("processField"));
		int Cs_num = Integer.parseInt(request.getParameter("Cs_num"));
		
		CustomerserviceDTO dto = new CustomerserviceDTO();
		
//		System.out.println("이거 깡통임??"+dto.getCs_num());
//		System.out.println("출력되나요....ㅜㅜㅜㅜㅜ"+dto.getCs_process());
		
		String processField ="";
		if (processFieldnum == 1) {
			processField = "접수대기";
		};
		if (processFieldnum == 2) {
			processField = "처리중";
		};
		if (processFieldnum == 3) {
			processField = "처리완료";
		};
		
		
		dto.setCsProcess(processField);
		dto.setCsNum(Cs_num);
		System.out.println(dto.getCsProcess());
		System.out.println(dto.getCsNum());
		customerservice.processChange(dto);
		



		
		

		
	}
	
	

}
