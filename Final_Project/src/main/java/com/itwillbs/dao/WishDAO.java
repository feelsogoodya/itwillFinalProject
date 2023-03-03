package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

public interface WishDAO {
	
	public List<Map<String, Object>> getWishList(String memberId);
}
