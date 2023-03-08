package com.itwillbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.Cs_PageDTO;
import com.itwillbs.domain.CustomerserviceDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;



@RestController
public class Pd_AjaxController {
	
	@Inject
	private ProductService productService;
	
	@RequestMapping(value = "/product/addWish", method = RequestMethod.GET)	
	public void addWish(HttpServletRequest request) {
		String memId = request.getParameter("memId");
		String productNum = request.getParameter("productNum");
		
		System.out.println(memId);
		System.out.println(productNum);

		productService.addwish(memId, productNum);
	}
	
	@RequestMapping(value = "/product/removeWish", method = RequestMethod.GET)	
	public void removeWish(HttpServletRequest request) {
		String memId = request.getParameter("memId");
		String productNum = request.getParameter("productNum");
		

		productService.removewish(memId, productNum);
	}
	
	

		
	
	@RequestMapping(value = "/product/list/partial", method = RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> getProductListPartial(Model model, 
																		@RequestParam String offset, 
																		@RequestParam String limit,
																		@RequestParam String productCate,
																		@RequestParam String searchText,
																		@RequestParam String filter,
																		@RequestParam String memId,
																		@RequestParam String startPrice,
																		@RequestParam String endPrice
																		) {
		
		
		System.out.println("productCate : " + filter);
		
		Map<String, String> params = new HashMap<>();
		params.put("memId", memId);
		params.put("productCate", productCate);
	    params.put("searchText", searchText);
	    params.put("offset", offset);
	    params.put("limit", limit);
	    params.put("filterValue", filter);
	    params.put("startPrice", startPrice);
	    params.put("endPrice", endPrice);

	    
	    
	    
	    
	    List<Map<String, Object>> productList = productService.getProductList(params);
	    System.out.println("========================");
	    System.out.println(productList);
	    model.addAttribute("productList", productList);
	    
		ResponseEntity<List<Map<String, Object>>> entity=
				new ResponseEntity<List<Map<String, Object>>>(productList,HttpStatus.OK);
		return entity;
	}
		
	
	
	

}
