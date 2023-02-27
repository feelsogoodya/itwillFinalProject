package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
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
		
		reviewDTO.setRevScore(reviewDTO.getRevContent().split(",").length);
		
		if(reviewDTO.getRevTotalscore() == 0) {
			reviewDTO.setRevTotalscore(30);
		}
		reviewDTO.setRevTotalscore(reviewDTO.getRevScore()+reviewDTO.getRevTotalscore());
		reviewService.insertReview(reviewDTO);
//		System.out.println("가져온 ID: "+reviewer);

		session.setAttribute("reviewer", memberDTO.getMemId());
		System.out.println("아이디: "+ memberDTO.getMemId());
		session.setAttribute("reviewee", productDTO.getProductSeller());
		// 기본 이동방식 : 주소변경 없이 이동
		return null;
	}
		
		
		
		 
		
		
	}
	
	

	
	
