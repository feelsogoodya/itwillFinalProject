package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.WishService;


@Controller
public class WishController {
	
	@Inject
	private WishService wishService;
	
	@RequestMapping(value = "/mypage/wish", method = RequestMethod.GET)
	public String productDetails(HttpSession session, HttpServletRequest request, Model model) {
		
		//TODO 추후 수정
		String memberId = (String)session.getAttribute("memId");
		
		//화면에 보여줄 글개수 
		int pageSize=3;
		//페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum == null) pageNum="1";
		
		int currentPage=Integer.parseInt(pageNum);
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
//		List<BoardDTO> boardList=boardService.getBoardList(pageDTO);
		List<Map<String, Object>> wishMapList = wishService.getWishList(memberId, pageDTO);
		
		int count = wishService.getwishCount(memberId);
		
		int pageBlock=3; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		
		if(endPage > pageCount) endPage=pageCount;
	    
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		
		//데이터 담기
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("wishMapList", wishMapList);
		
		
		return "wish/wishList";
	}
}
