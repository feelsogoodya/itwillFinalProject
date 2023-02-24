package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

@Controller
public class MainController {
	
	@Inject
	private ProductService productService;
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) {
		
		// 존재하는 카테고리 전부 불러오기 => 추후 Map으로 카테고리이름-이미지파일이름 수정
		List<String> categories = productService.getCategories();
		
		// 조회순으로 상품 6개 가져오기
		List<ProductDTO> wishList = productService.getPrdTopWishList();
			
		// 관심순으로 상품 6개 가져오기
		List<ProductDTO> orderViews = productService.getPrdTopViews();
		
		// 최근 등록된 상품 6개 가져오기
		List<ProductDTO> latestPrdList = productService.getPrdFromTheLatest();
		
		session.setAttribute("categories", categories);
		
		
		//DB 부재로 에러
		model.addAttribute("wishList", wishList);
		model.addAttribute("orderViews", orderViews);
		model.addAttribute("latestPrdList", latestPrdList);
		
		return "main/main";
	}
}
