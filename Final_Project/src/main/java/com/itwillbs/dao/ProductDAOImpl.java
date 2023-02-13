package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.productMapper";

	@Override
	public List<ProductDTO> getPrdFromTheLatest() {
		
		return sqlSession.selectList(namespace+".fromTheLatest");
	}
}
