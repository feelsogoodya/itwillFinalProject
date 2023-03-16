package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SellListDTO;

public interface SellListService {
	public List<SellListDTO> getSellList(PageDTO pageDTO);
	
	public int getSellCount(PageDTO pageDTO);
	
}
