package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BuyListDAO;
import com.itwillbs.domain.BuyListDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BuyListServiceImpl implements BuyListService{
	
	@Inject
	private BuyListDAO buyListDAO;

	@Override
	public List<BuyListDTO> getbuyList(PageDTO dto) {
		
		// startRow 구하기
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+dto.getPageSize()-1;
		
		// 디비 limit startRow-1 
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);
		
		return buyListDAO.getbuyList(dto);
	}

	@Override
	public int getBuyCount() {
		return buyListDAO.getBuyCount();
	}
	
}
