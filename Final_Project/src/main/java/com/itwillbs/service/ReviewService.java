package com.itwillbs.service;

import com.itwillbs.domain.ReviewDTO;

public interface ReviewService {

	public void insertReview(ReviewDTO reviewDTO);
	
	public ReviewDTO getReviewer(String reviewer); 
	
	public void updateReview(ReviewDTO reviewDTO);
	
}
