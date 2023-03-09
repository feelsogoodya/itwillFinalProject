package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BuyListDTO;
import com.itwillbs.domain.PageDTO;


public interface BuyListDAO {
	public List<BuyListDTO> getbuyList(PageDTO dto);

	public int getBuyCount();
		

}
