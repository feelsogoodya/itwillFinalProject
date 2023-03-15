package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;

public interface WishDAO {
	
	public List<Map<String, Object>> getWishList(String memberId, PageDTO pageDTO);
	
	public int getwishCount(String memberId);
}
