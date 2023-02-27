package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.WishService;


@Controller
public class WishController {
	
	@Inject
	private WishService wishService;
	
	@RequestMapping(value = "/mypage/wish", method = RequestMethod.GET)
	public String productDetails(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
//		String name = session.getId();
		String name = "spring";
		
		
		
		return "wish/wishList";
	}
}
