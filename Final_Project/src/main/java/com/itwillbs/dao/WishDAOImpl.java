package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WishDAOImpl implements WishDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private Map<String, String> param = new HashMap<String, String>();
	
	private static final String namespace = "com.itwillbs.mappers.wishMapper";

	@Override
	public List<Map<String, Object>> getWishList(String memberId) {
		System.out.println(memberId);
		return sqlSession.selectList(namespace+".getMyWish", memberId);
	}


}
