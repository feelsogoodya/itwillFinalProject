package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SellListDTO;

public interface SellListDAO {
	public List<SellListDTO> getSellList(PageDTO dto);

	public int getSellCount(PageDTO pageDTO);
		

}
