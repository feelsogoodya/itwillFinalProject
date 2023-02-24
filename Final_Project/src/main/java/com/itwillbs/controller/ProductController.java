package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.output.TaggedOutputStream;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

@Controller
public class ProductController {
	
	@Inject
	ProductService productService;
	
	@RequestMapping(value = "/product/details", method = RequestMethod.GET)
	public String productDetails(Model model) {
		//TODO 추후 연결 시, 수정
//		HttpServletRequest request, String productNum = request.getParameter("productNum");
		String productNum = "2302001";
		
		Map<String, Object> productMap = productService.getProductInfo(productNum);
		
		System.out.println((String)productMap.get("productSeller")+" : 주문번호 Controller");
		//판매자 다른 상품 정보 가져오기
		List<Map<String, Object>> sellerProducts = productService.getSellerProduct(productMap);
		
		
		model.addAttribute("productMap", productMap);
		model.addAttribute("sellerProducts", sellerProducts);
		
		return "product/details";
	}
	
}
