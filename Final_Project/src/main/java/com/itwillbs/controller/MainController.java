package com.itwillbs.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProductDTO;

@Controller
public class MainController {

	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main(Model model) {
		
		// 존재하는 카테고리 전부 불러오기 => 추후 Map으로 카테고리이름-이미지파일이름 수정
		List<String> categories = new ArrayList<String>(
										Arrays.asList("의류", "잡화", "디지털/가전", "서적", "생활용품"
													, "뷰티/미용", "취미/게임/음반", "스포츠/레저", "기타"));
		
		// 조회순으로 상품 6개 가져오기
			
		// 관심순으로 상품 6개 가져오기
		
		// 최근 등록된 상품 6개 가져오기
		
		
		model.addAttribute("categories", categories);
		
		return "main/main";
	}
}
