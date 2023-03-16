package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SellListDTO;

@Repository
public class SellListDAOImpl implements SellListDAO {
	// 마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.selllistMapper";
	
	

	@Override
	public List<SellListDTO> getSellList(PageDTO dto) {

		return sqlSession.selectList(namespace + ".getSellList", dto);
	}//

	@Override
	public int getSellCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getSellCount", pageDTO);

	}//
	
	
	

}// class
