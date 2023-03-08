package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BuyListDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SellListDTO;

@Repository
public class BuyListDAOImpl implements BuyListDAO {
	// 마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.buylistMapper";
	
	@Override
	public List<BuyListDTO> getbuyList(PageDTO dto) {
		
		return sqlSession.selectList(namespace + ".getBuyList", dto);
	}
	
	@Override
	public int getBuyCount() {
		return sqlSession.selectOne(namespace + ".getBuyCount");
	}
	


}// class
