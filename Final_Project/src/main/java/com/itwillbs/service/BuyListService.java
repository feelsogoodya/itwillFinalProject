package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BuyListDTO;
import com.itwillbs.domain.PageDTO;


public interface BuyListService {
	public List<BuyListDTO> getbuyList(PageDTO dto);
	
	public int getBuyCount();
	

}
