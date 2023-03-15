package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.FreeBoardCommDTO;
import com.itwillbs.domain.FreeBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.FreeBoardService;

@RestController
public class FreeBoardAjaxController {
	
	@Inject
	private FreeBoardService boardService;
	
	@RequestMapping(value = "/free/comm", method = RequestMethod.POST)
	public List<FreeBoardCommDTO> getCommList(HttpServletRequest request) {
		return boardService.getCommList(Integer.parseInt(request.getParameter("freeboardNum")));
	}

	@RequestMapping(value = "/free/incomm", method = RequestMethod.POST)
	public void insertComm(HttpServletRequest request) {
		FreeBoardCommDTO freeBoardCommDTO = new FreeBoardCommDTO();
		freeBoardCommDTO.setFreeboardNum(Integer.parseInt(request.getParameter("freeboardNum")));
		freeBoardCommDTO.setMemberId(request.getParameter("memberId"));
		freeBoardCommDTO.setContent(request.getParameter("content"));
		
		System.out.println(freeBoardCommDTO.getFreeboardNum());
		System.out.println(freeBoardCommDTO.getMemberId());
		System.out.println(freeBoardCommDTO.getContent());
		
		boardService.insertComm(freeBoardCommDTO);
	}
	
	@RequestMapping(value = "/free/deleteComm", method = RequestMethod.POST)
	public void deleteComm(HttpServletRequest request) {
		String commNum = request.getParameter("commNum");
		
		boardService.deleteComm(commNum);
	}
}
