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
		if(reviewDTO.getRevTotal() == 0) {
			reviewDTO.setRevTotal(20);
		}
		
		
		ReviewDTO reviewDTO2 = reviewService.getReviewer(reviewDTO.getReviewer()); 
		System.out.println("리뷰DTO getReviewer: "+reviewDTO.getReviewer());
		

		

		System.out.println("리뷰 카테고리: "+reviewDTO.getRevCate());
		
		if(reviewDTO.getRevCate().equals("bad") ) {
			reviewDTO.setRevScore(-(reviewDTO.getRevContent().split(",").length));
			System.out.println("bad 스코어: " + reviewDTO.getRevScore());
		}else if (reviewDTO.getRevCate().equals("soso")) {
			reviewDTO.setRevScore(0);
			System.out.println("soso 스코어: " + reviewDTO.getRevScore());
		}else {
			reviewDTO.setRevScore(reviewDTO.getRevContent().split(",").length);
			System.out.println("good 스코어: " + reviewDTO.getRevScore());
		}
		
		if(reviewDTO2 != null) {
			System.out.println("Reviewer 있으면 업데이트");
			reviewService.updateReview(reviewDTO);	
		}else {
			System.out.println("reviewer 없으면 인서트");
			reviewService.insertReview(reviewDTO);		
		}
		
		
	
//		System.out.println("가져온 ID: "+reviewer);
		session.setAttribute("productNum", productDTO.getProductNum());
		System.out.println("productNum: "+ productDTO.getProductNum());
		
		session.setAttribute("reviewer", memberDTO.getMemId());
		System.out.println("아이디: "+ memberDTO.getMemId());
		
		session.setAttribute("reviewee", productDTO.getProductSeller());
		
		// 기본 이동방식 : 주소변경 없이 이동
		return null;
	}
		
	
	
	
	
		
		 
		
		
	}
	
	

	
	
