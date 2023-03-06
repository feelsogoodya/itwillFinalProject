package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.NoticePageDTO;
import com.itwillbs.service.NoticeService;


@Controller
public class NoticeController {
	//자동으로 객체생성  부모=자식
	@Inject
	private NoticeService noticeService;
	
	
	  
	//xml 업로드 경로 (자원이름)=> 변수 저장
		@Resource(name = "uploadPath")
		private String uploadPath;
//	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)	
//	public String list() {
//		// 기본 이동방식 : 주소변경 없이 이동 
//		return "notice/list";
//	}//
	
	@RequestMapping(value = "/notice/writeForm", method = RequestMethod.GET)	
	public String write() {
		// 기본 이동방식 : 주소변경 없이 이동 
		return "notice/writeForm";
	}//
	
	@RequestMapping(value = "/notice/writePro", method = RequestMethod.POST)	
	public String writePro(HttpServletRequest request,MultipartFile file, MultipartFile file1, MultipartFile file2) throws Exception{
		System.out.println("NoticeController writePro() ");
		// 업로드 파일명 => 랜덤문자_파일이름 => 파일이름 중복 안됨
		UUID uuid=UUID.randomUUID();
		 NoticeDTO noticeDTO=new NoticeDTO();
				if (file.isEmpty()) {
					 noticeDTO.setNotiImage(file.getOriginalFilename());
				}else {
					String filename=uuid.toString()+"_"+file.getOriginalFilename();
					FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
					 noticeDTO.setNotiImage(filename);
				}
				
				if (file1.isEmpty()) {
					 noticeDTO.setNotiImage1(file1.getOriginalFilename());
				}else {
					String filename1=uuid.toString()+"_"+file1.getOriginalFilename();
					FileCopyUtils.copy(file1.getBytes(), new File(uploadPath, filename1));
					noticeDTO.setNotiImage1(filename1);
				}

				if (file2.isEmpty()) {
					noticeDTO.setNotiImage2(file2.getOriginalFilename());
				}else {
					String filename2=uuid.toString()+"_"+file2.getOriginalFilename();
					// 원본 파일 복사 => upload 복사
//				FileCopyUtils.copy(원본, 복사해서 새롭게 파일 만들기);
					FileCopyUtils.copy(file2.getBytes(), new File(uploadPath, filename2));
					noticeDTO.setNotiImage2(filename2);
				}
				
		
				
				 noticeDTO.setMemId(request.getParameter("memId"));
				 noticeDTO.setNotiTitle(request.getParameter("notiTitle"));
				 noticeDTO.setNotiContent(request.getParameter("notiContent"));
			
		
		// 글쓰기 메서드 호출()
		noticeService.insertNotice(noticeDTO);
		// 이동방식 : 주소변경 하면서 이동 
	    // response.sendRedirect() 이동
		return "redirect:/notice/list";
	}//
	
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)	
	public String list(Model model, HttpServletRequest request) {
		// http://localhost:8080/myweb/board/list
		// http://localhost:8080/myweb/board/list?pageNum=2
		// 한 화면에 보여줄 글 개수 설정 (10개 설정)
		System.out.println("teasdas" + request.getParameter("search"));
		int pageSize=10;
		// 현 페이지 번호 파라미터값 가져오기
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum==null){
		 	pageNum="1";
		}
		// pageNum => 정수형 currentPage
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		NoticePageDTO dto=new NoticePageDTO();
		// set 메서드 호출
		dto.setPageSize(pageSize);
		dto.setPageNum(pageNum);
		dto.setCurrentPage(currentPage);
		dto.setSearch(request.getParameter("search"));
		// 디비작업 메서드 호출
		// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
		// List<BoardDTO> boardList =dao.getBoardList(dto);
		List<NoticeDTO> noticeList=noticeService.getNoticeList(dto);
//		System.out.println(noticeList.get(1).toString());
		//페이징 작업
		// 전체 게시판 글의 개수 가져오기
		// select count(*) from board  
		int count=noticeService.getNoticeCount();
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		dto.setCount(count);
		dto.setPageBlock(pageBlock);
		dto.setStartPage(startPage);
		dto.setEndPage(endPage);
		dto.setPageCount(pageCount);
		
		// model 담아서 이동
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageDto", dto);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "notice/list";
	}//
	
	@RequestMapping(value = "/notice/content", method = RequestMethod.GET)	
	public String content(HttpServletRequest request,Model model) {
		// /notice/content?num=2
		int num=Integer.parseInt(request.getParameter("num"));
		// 조회수 증가
		noticeService.updateReadcount(num);
		// 글가져오기 메서드 호출
		NoticeDTO dto=noticeService.getNotice(num);
		//model 데이터 담기
		model.addAttribute("dto", dto);
		// 기본 이동방식 : 주소변경 없이 이동 
		return "notice/content";
	}//
	
	@RequestMapping(value = "/notice/delete", method = RequestMethod.GET)	
	public String deletePro(HttpServletRequest request) {
		System.out.println("NoticeController deletePro() ");
		int notiNum=Integer.parseInt(request.getParameter("notiNum"));
			noticeService.deleteNotice(notiNum);
			// 세션초기화
//			session.invalidate();
			// 이동방식 : 주소변경 하면서 이동 
			// response.sendRedirect() 이동
			return "redirect:/notice/list";
		
	}//
	
//	@RequestMapping(value = "/notice/delete")	
//	public String deletePro(NoticeDTO dto) {
//		System.out.println("NoticeController deletePro() ");
//		noticeService.deleteNotice(dto);
//		// 세션초기화
////			session.invalidate();
//		// 이동방식 : 주소변경 하면서 이동 
//		// response.sendRedirect() 이동
//		return "redirect:/notice/list";
//		
//	}//
	
	@RequestMapping(value = "/notice/update", method = RequestMethod.GET)	
	public String update(HttpServletRequest request,Model model) {
		int num=Integer.parseInt(request.getParameter("notiNum"));
		
		NoticeDTO dto=noticeService.getNotice(num);
		
		model.addAttribute("dto", dto);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "notice/updateForm";
	}//
	
	@RequestMapping(value = "/notice/updatePro", method = RequestMethod.POST)	
	public String updatePro(HttpServletRequest request,MultipartFile file, MultipartFile file1, MultipartFile file2) throws Exception{
		System.out.println("NoticeController updatePro() ");
		UUID uuid=UUID.randomUUID();
		 NoticeDTO noticeDTO=new NoticeDTO();
				if (file.isEmpty()) {
					 noticeDTO.setNotiImage(request.getParameter("oldfile"));
				}else {
					String filename=uuid.toString()+"_"+file.getOriginalFilename();
					FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
					 noticeDTO.setNotiImage(filename);
					 System.out.println(noticeDTO.getNotiImage());
				}
				
				if (file1.isEmpty()) {
					 noticeDTO.setNotiImage1(request.getParameter("oldfile1"));
				}else {
					String filename1=uuid.toString()+"_"+file1.getOriginalFilename();
					FileCopyUtils.copy(file1.getBytes(), new File(uploadPath, filename1));
					noticeDTO.setNotiImage1(filename1);
					System.out.println(noticeDTO.getNotiImage1());
				}

				if (file2.isEmpty()) {
					noticeDTO.setNotiImage2(request.getParameter("oldfile2"));
				}else {
					String filename2=uuid.toString()+"_"+file2.getOriginalFilename();
					// 원본 파일 복사 => upload 복사
//				FileCopyUtils.copy(원본, 복사해서 새롭게 파일 만들기);
					FileCopyUtils.copy(file2.getBytes(), new File(uploadPath, filename2));
					noticeDTO.setNotiImage2(filename2);
					System.out.println(noticeDTO.getNotiImage2());
				}
				
		
				 noticeDTO.setNotiNum(Integer.parseInt(request.getParameter("notiNum")));
				 noticeDTO.setMemId(request.getParameter("memId"));
				 noticeDTO.setNotiTitle(request.getParameter("notiTitle"));
				 noticeDTO.setNotiContent(request.getParameter("notiContent"));
			
		
		
		noticeService.updateNotice(noticeDTO);
		
		return "redirect:/notice/list";
	}//
	
}//
