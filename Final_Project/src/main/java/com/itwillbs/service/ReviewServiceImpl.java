package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReviewDAO;
import com.itwillbs.domain.BuyListDTO;
import com.itwillbs.domain.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Inject
	private ReviewDAO reviewDAO;

	@Override
	public void insertReview(ReviewDTO reviewDTO) {
		
		
		if(reviewDTO.getRevTotal() == 0) {
			reviewDTO.setRevTotal(30);
		} 
		
		reviewDAO.insertReview(reviewDTO);

	}

	@Override
	public ReviewDTO getReviewer(String reviewer) {
		
		return reviewDAO.getReviewer(reviewer);
	}

	@Override
	public void updateReview(ReviewDTO reviewDTO) {
		
		reviewDAO.updateReview(reviewDTO);
	}

	@Override
	public void updateBuyList(BuyListDTO buyListDTO) {
		reviewDAO.updateBuyList(buyListDTO);
		
	}

}
