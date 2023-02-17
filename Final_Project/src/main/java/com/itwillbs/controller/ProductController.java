package com.itwillbs.controller;

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
	
	ProductService productService;
	
	@RequestMapping(value = "/product/details", method = RequestMethod.GET)
	public String productDetails(Model model) {
		//TODO 추후 연결 시, 수정
//		HttpServletRequest request, String productNum = request.getParameter("productNum");
		String productNum = "2302005";
		System.out.println("productDetails");
		
		ProductDTO productDTO = productService.getProductInfo(productNum);
		
		System.out.println(productDTO.getProductPrice());
		System.out.println(productDTO.getProductTitle());
		System.out.println(productDTO.getProductContent());
		
		model.addAttribute("productDTO", productDTO);
		
		return "product/details";
	}
	
}
