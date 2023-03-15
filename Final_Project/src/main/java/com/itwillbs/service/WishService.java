package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;

public interface WishService {
	
	public List<Map<String, Object>> getWishList(String memberId, PageDTO pageDTO);
	
	public int getwishCount(String memberId);
	
	public int getWishCheck(String productNum, String memberId);
}
