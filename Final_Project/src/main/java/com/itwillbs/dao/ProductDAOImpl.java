package com.itwillbs.dao;

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
	public ProductDTO getProduct() {
		
		return null;
	}
}
