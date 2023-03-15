package com.itwillbs.controller;

import javax.inject.Inject;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BuyListDTO;

import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.service.ReviewService;

@Controller
public class ReviewController {
	
	
	@Inject
	private ReviewService reviewService;

	

	@RequestMapping(value = "/review/review", method = RequestMethod.GET)
	public String review(HttpSession session, Model model, BuyListDTO buylistDTO) {
		// 기본 이동방식 : 주소변경 없이 이동
		String reviewee = buylistDTO.getProdSeller();
		
		model.addAttribute("buyNum", buylistDTO.getBuyNum());
		model.addAttribute("reviewee", reviewee);
		System.out.println("세션넘버: "+buylistDTO.getBuyNum());
		
//		reviewDTO.setReviewer((String)session.getAttribute("productSeller"));
		System.out.println("세션셀러: "+reviewee);



		
		

		
		return "review/insertReview";
	}
	
	
	
	@RequestMapping(value = "/review/insertReview", method = RequestMethod.POST)
	public String insertReview(ReviewDTO reviewDTO,Model model, HttpSession session, BuyListDTO buylistDTO ) {
		System.out.println("컨트롤러review 시작!!!!!!!!!!!!");
		System.out.println("@@@@@@@@"+buylistDTO.getBuyNum());
		System.out.println("컨트롤러 reviewDTO: "+ reviewDTO.getRevScore());
		System.out.println("컨트롤러 reviewDTO: "+ reviewDTO.getRevContent().split(",").length);

		ReviewDTO reviewDTO2 = reviewService.getReviewee(reviewDTO.getReviewee()); 
		System.out.println("리뷰DTO getReviewee: "+reviewDTO.getReviewee());
		

		System.out.println("리뷰 카테고리: "+reviewDTO.getRevCate());
		
		int checkCnt = reviewDTO.getRevContent().split(",").length;
		
		if(reviewDTO.getRevCate().equals("bad") ) {
			reviewDTO.setRevScore((-(checkCnt))*0.1);
			System.out.println("bad 스코어: " + String.format("%.2f",reviewDTO.getRevScore()));
			
		}else if (reviewDTO.getRevCate().equals("soso")) {
			reviewDTO.setRevScore((checkCnt)*0.1);
			System.out.println("soso 스코어: " +String.format("%.2f",reviewDTO.getRevScore()));
			
		}else {
			reviewDTO.setRevScore((checkCnt)*0.2);
			System.out.println("good 스코어: " +String.format("%.2f",reviewDTO.getRevScore()));
		}
		
		
		if(reviewDTO.getRevTotal() == 0) {
			reviewDTO.setRevTotal(20 + reviewDTO.getRevScore());
		}
		
		
		if(reviewDTO2 != null) {
			System.out.println("Reviewee 있으면 업데이트");
			reviewService.updateReview(reviewDTO);	
		}else {
			System.out.println("reviewee 없으면 인서트");
			reviewService.insertReview(reviewDTO);		
		}
		
		
		
		
		
		
		reviewService.updateBuyList(buylistDTO);
		model.addAttribute("reviewDTO", reviewDTO);
		
		
		
		
		
//		System.out.println("가져온 ID: "+reviewer);
//		session.setAttribute("productNum", productDTO.getProductNum());
//		System.out.println("productNum: "+ productDTO.getProductNum());
//		
//		session.setAttribute("memId", memberDTO.getMemId());
//		System.out.println("아이디: "+ memberDTO.getMemId());
//		
//		session.setAttribute("prodSeller", productDTO.getProductSeller());
//		System.out.println("판매자아이디: "+productDTO.getProductSeller());
		// 기본 이동방식 : 주소변경 없이 이동
		return null;
			
	}
	
	
	
	
	}
	

	
	
