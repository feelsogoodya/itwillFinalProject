package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

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
		//TODO 추후 수정
//		String memberId = session.getId();
		String memberId = "spring";
		
		List<Map<String, Object>> wishMapList = wishService.getWishList(memberId);
		
		model.addAttribute("wishMapList", wishMapList);
		
		return "wish/wishList";
	}
}
