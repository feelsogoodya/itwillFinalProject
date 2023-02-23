package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	// 마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.reviewMapper";
	
	@Override
	public void insertReview(ReviewDTO reviewDTO) {
		System.out.println("DAOIMPL");
		System.out.println(reviewDTO.getRevScore());
		System.out.println(reviewDTO.getRevContent());
		sqlSession.insert(namespace+".insertReview", reviewDTO);
		
	}
	

	
	
	

}// class
