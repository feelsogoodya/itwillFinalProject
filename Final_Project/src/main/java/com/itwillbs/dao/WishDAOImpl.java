package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;

@Repository
public class WishDAOImpl implements WishDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private Map<String, Object> param = new HashMap<String, Object>();
	
	private static final String namespace = "com.itwillbs.mappers.wishMapper";

	@Override
	public List<Map<String, Object>> getWishList(String memberId, PageDTO pageDTO) {
		param.put("memberId", memberId);
		param.put("pageDTO", pageDTO);
		System.out.println(memberId);
		return sqlSession.selectList(namespace+".getMyWish",param);
	}

	@Override
	public int getwishCount() {
		return sqlSession.selectOne(namespace+".getwishCount");
	}

}
