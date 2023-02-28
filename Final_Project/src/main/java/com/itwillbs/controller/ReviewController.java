package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.service.ReviewService;

@Controller
public class ReviewController {
	
	
	@Inject
	private ReviewService reviewService;

	

	@RequestMapping(value = "/review/review", method = RequestMethod.GET)
	public String review() {
		// 기본 이동방식 : 주소변경 없이 이동

		return "review/insertReview";
	}
	
	
	
	@RequestMapping(value = "/review/insertReview", method = RequestMethod.POST)
	public String insertReview(ReviewDTO reviewDTO, HttpSession session, MemberDTO memberDTO, ProductDTO productDTO ) {
		System.out.println("컨트롤러review 시작!!!!!!!!!!!!");
		System.out.println("컨트롤러 reviewDTO: "+ reviewDTO.getRevScore());
		System.out.println("컨트롤러 reviewDTO: "+ reviewDTO.getRevContent().split(",").length);
		
		
//		reviewDTO.setRevScore(reviewDTO.getRevContent().split(",").length);
		System.out.println(reviewDTO.getReviewer());
		
		ReviewDTO reviewDTO2 = reviewService.getReviewer(reviewDTO.getReviewer()); 
		
		if(reviewDTO2 != null) {
			System.out.println("Reviewer 있음");
//			reviewService.updateReview(reviewDTO);	
		}else {
			System.out.println("reviewer 없음");
			reviewService.insertReview(reviewDTO);		
		}
		
//		if(reviewDTO.getRevTotalscore() == 0) {
//			reviewDTO.setRevTotalscore(30+reviewDTO.getRevScore());
//		}
	
//		System.out.println("가져온 ID: "+reviewer);

		session.setAttribute("reviewer", memberDTO.getMemId());
		System.out.println("아이디: "+ memberDTO.getMemId());
		session.setAttribute("reviewee", productDTO.getProductSeller());
		System.out.println("리뷰 카테고리"+reviewDTO.getRevCate());
		// 기본 이동방식 : 주소변경 없이 이동
		return null;
	}
		
	
	
	
	
	
//	@RequestMapping(value = "/review/updateReview", method = RequestMethod.GET)	
//	public String updateReview(HttpServletRequest request,Model model) {
//		int num=Integer.parseInt(request.getParameter("num"));
//		
//		ReviewDTO reviewDTO =reviewService.get;
//		
//		model.addAttribute("dto", dto);
//		
//		// 기본 이동방식 : 주소변경 없이 이동 
//		return "center/updateForm";
//	}//
//	
		
	@RequestMapping(value = "/review/showreview", method = RequestMethod.GET)
	public String showreview() {
		return "review/showreview";
	}
	
	
	
		
		 
		
		
	}
	
	

	
	
