package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Inject
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewDTO reviewDTO) {
		
		
		if(reviewDTO.getRevTotalscore() == 0) {
			reviewDTO.setRevTotalscore(30);
		} 
		
		reviewDAO.insertReview(reviewDTO);

	}

	@Override
	public ReviewDTO getReviewer(String reviewer) {
		
		return reviewDAO.getReviewer(reviewer);
	}

}
