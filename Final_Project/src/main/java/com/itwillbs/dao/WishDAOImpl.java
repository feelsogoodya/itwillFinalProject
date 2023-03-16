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
	Map<String, String> param = new HashMap<String, String>();
	private static final String namespace = "com.itwillbs.mappers.wishMapper";

	@Override
	public List<Map<String, Object>> getWishList(String memberId, PageDTO pageDTO) {
		
		param.put("memberId", memberId);
		param.put("startRow", pageDTO.getStartRow() + "");
		param.put("pageSize", pageDTO.getPageSize() + "");
		return sqlSession.selectList(namespace+".getMyWish",param);
	}

	@Override
	public int getwishCount(String memberId) {
		param.put("memberId", memberId);
		return sqlSession.selectOne(namespace+".getwishCount", param);
	}

	@Override
	public int getWishCheck(String productNum, String memberId) {
		param.put("memberId", memberId);
		param.put("productNum", productNum);
		return sqlSession.selectOne(namespace + ".getWishCheck", param);
	}


}
