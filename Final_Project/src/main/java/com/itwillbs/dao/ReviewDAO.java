package com.itwillbs.dao;

import com.itwillbs.domain.BuyListDTO;
import com.itwillbs.domain.ReviewDTO;

public interface ReviewDAO {

	public void insertReview(ReviewDTO reviewDTO);
		
	public ReviewDTO getReviewer(String reviewer); 
	
	public void updateReview(ReviewDTO reviewDTO);
	
	public void updateBuyList(BuyListDTO buyListDTO);
}
