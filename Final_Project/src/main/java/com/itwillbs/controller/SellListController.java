package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

@Controller
public class SellListController {
	
	
	@Inject
	private ProductService productService;



	@RequestMapping(value = "/list/selllist", 
			method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request, HttpSession session, ProductDTO productDTO) {
		// http://localhost:8080/myweb/board/list
		// http://localhost:8080/myweb/board/list?pageNum=2
		// 한 화면에 보여줄 글 개수 설정 (10개 설정)
		int pageSize=10;
		// 현 페이지 번호 파라미터값 가져오기
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum == null){
		 	pageNum="1";
		}
		// pageNum => 정수형 currentPage
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		PageDTO pageDTO=new PageDTO();
		// set 메서드 호출
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSellmemId((String)session.getAttribute("memId"));
		System.out.println("세션 아이디:"+(String)session.getAttribute("memId"));
		// 디비작업 메서드 호출
		// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
		// List<BoardDTO> boardList =dao.getBoardList(dto);
		List<ProductDTO> sellList= productService.getSellList(pageDTO);
		System.out.println("sellList 리스트!!!!!!!!!!!!!");
		//페이징 작업
		// 전체 게시판 글의 개수 가져오기
		// select count(*) from board  
		int count=productService.getSellCount();
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		// model 담아서 이동
		model.addAttribute("sellList", sellList);
		model.addAttribute("pageDTO",pageDTO);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "list/selllist";
	}//
	

	
	
	
}
