package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WishDAO;
import com.itwillbs.domain.PageDTO;

@Service
public class WishServiceImpl implements WishService{
	
	@Inject
	private WishDAO wishDAO;

	@Override
	public List<Map<String, Object>> getWishList(String memberId, PageDTO pageDTO) {
		
		/*
		 * int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1; 
		 * int endRow=startRow+pageDTO.getPageSize()-1;
		 * 
		 * pageDTO.setStartRow(startRow-1); pageDTO.setEndRow(endRow);
		 */
		
		return wishDAO.getWishList(memberId, pageDTO);
	}

	@Override
	public int getwishCount() {
		return wishDAO.getwishCount();
	}

}
