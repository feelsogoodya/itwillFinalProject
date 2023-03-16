package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BuyListDTO;
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

		sqlSession.insert(namespace+".insertReview", reviewDTO);
		
	}

	@Override
	public ReviewDTO getReviewee(String reviewee) {
		
		return sqlSession.selectOne(namespace+".getReviewee", reviewee);
	}

	@Override
	public void updateReview(ReviewDTO reviewDTO) {
		
		sqlSession.update(namespace+".updateReview", reviewDTO);

	}

	@Override
	public void updateBuyList(BuyListDTO buyListDTO) {
		sqlSession.update(namespace+".UpdateBuyList", buyListDTO);
		
	}
	
	

	
	
	

}// class
