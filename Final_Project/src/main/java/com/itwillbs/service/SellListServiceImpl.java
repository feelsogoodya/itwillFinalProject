package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SellListDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.SellListDTO;

@Service
public class SellListServiceImpl implements SellListService {
	@Inject
	private SellListDAO sellListDAO;

	@Override
	public List<SellListDTO> getSellList(PageDTO dto) {
	
		// startRow 구하기
				int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
				// endRow 구하기
				int endRow=startRow+dto.getPageSize()-1;
				
				// 디비 limit startRow-1 
				dto.setStartRow(startRow-1);
				dto.setEndRow(endRow);
				
				return sellListDAO.getSellList(dto);
	}

	@Override
	public int getSellCount(PageDTO pageDTO) {

		return sellListDAO.getSellCount( pageDTO);
	}
	

}
