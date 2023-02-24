package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.FreeBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.FreeBoardService;

@Controller
public class FreeBoardController {
	
	@Inject
	private FreeBoardService boardService;

	@RequestMapping(value = "/free/list", method = RequestMethod.GET)
	public String freeboard(HttpServletRequest request, Model model) {
		
		int pageSize = 15;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum="1";
		
		int currentPage = Integer.parseInt(pageNum);
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch(request.getParameter("search"));
		
		List<FreeBoardDTO> boardList = boardService.getBoardList(pageDTO);
		
		int count = boardService.getBoardCount(pageDTO);
		
		int pageBlock = 10;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		if(endPage > pageCount) endPage = pageCount;
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "freeboard/freeboard";
	}
	
	@RequestMapping(value = "/free/wirte", method = RequestMethod.GET)
	public String writeForm() {
		return "freeboard/writeForm";
	}
	
	@RequestMapping(value = "/free/writePro", method = RequestMethod.POST)
	public String writePro(HttpServletRequest request) {
		
		FreeBoardDTO freeBoardDTO = new FreeBoardDTO();
		freeBoardDTO.setMemberId(request.getParameter("memberId"));
		freeBoardDTO.setSubject(request.getParameter("subject"));
		freeBoardDTO.setContent(request.getParameter("content"));
		
		boardService.insertBoard(freeBoardDTO);
		
		return "redirect:/free/list";
	}
	@RequestMapping(value = "/free/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		
		int freeboardNum = Integer.parseInt(request.getParameter("freeboardNum"));
		
		FreeBoardDTO freeBoardDTO = boardService.getBoard(freeboardNum);
		
		model.addAttribute("freeboardDTO", freeBoardDTO);
		
		return "freeboard/content";
	}
	
	@RequestMapping(value = "/free/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		
		int freeboardNum = Integer.parseInt(request.getParameter("freeboardNum"));
		
		FreeBoardDTO freeBoardDTO = boardService.getBoard(freeboardNum);
		
		model.addAttribute("freeboardDTO", freeBoardDTO);
		
		return "freeboard/updateForm";
	}
	
	@RequestMapping(value = "/free/updatePro", method = RequestMethod.POST)
	public String updatePro(HttpServletRequest request, Model model) {
		
		FreeBoardDTO freeBoardDTO = new FreeBoardDTO();
		freeBoardDTO.setFreeboardNum(Integer.parseInt(request.getParameter("freeboardNum")));
		freeBoardDTO.setSubject(request.getParameter("subject"));
		freeBoardDTO.setContent(request.getParameter("content"));
		
		boardService.updateBoard(freeBoardDTO);
		
		model.addAttribute("freeboardDTO", freeBoardDTO);
		
		return "redirect:/free/list";
	}
	
	@RequestMapping(value = "/free/delete", method = RequestMethod.GET)
	public String delete(HttpServletRequest request) {
		
		int freeboardNum = Integer.parseInt(request.getParameter("freeboardNum"));
		
		boardService.deleteBoard(freeboardNum);
		
		return "redirect:/free/list";
	}
}
