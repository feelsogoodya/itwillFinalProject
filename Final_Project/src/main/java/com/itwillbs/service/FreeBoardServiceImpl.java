package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.FreeBoardDAO;
import com.itwillbs.domain.FreeBoardCommDTO;
import com.itwillbs.domain.FreeBoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Inject
	private FreeBoardDAO freeBoardDAO;
	
	@Override
	public void insertBoard(FreeBoardDTO freeBoardDTO) {
		freeBoardDTO.setReadcount(0);
		freeBoardDTO.setLikeCount(0);
		freeBoardDTO.setDate(new Timestamp(System.currentTimeMillis()).toString());
		
		Integer maxNum = freeBoardDAO.getMaxNum();
		
		freeBoardDTO.setFreeboardNum(maxNum == null ? 1 : maxNum + 1);
		
		freeBoardDAO.insertBoard(freeBoardDTO);
	}

	@Override
	public List<FreeBoardDTO> getBoardList(PageDTO pageDTO) {
		int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
		int endRow = startRow + pageDTO.getPageSize() - 1;
		
		pageDTO.setStartRow(startRow - 1);
		pageDTO.setEndRow(endRow);
		
		return freeBoardDAO.getBoardList(pageDTO);
	}

	@Override
	public int getBoardCount(PageDTO pageDTO) {
		return freeBoardDAO.getBoardCount(pageDTO);
	}

	@Override
	public FreeBoardDTO getBoard(int num) {
		return freeBoardDAO.getBoard(num);
	}

	@Override
	public void updateBoard(FreeBoardDTO freeBoardDTO) {
		freeBoardDAO.updateBoard(freeBoardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		freeBoardDAO.deleteBoard(num);
	}

	@Override
	public List<FreeBoardCommDTO> getCommList(int freeboardNum) {
		return freeBoardDAO.getCommList(freeboardNum);
	}

	@Override
	public void insertComm(FreeBoardCommDTO freeBoardCommDTO) {
		
		Integer maxNum = freeBoardDAO.getMaxCommNum();
		
		System.out.println("maxNum : " + maxNum);
		
		freeBoardCommDTO.setCommNum(maxNum == null ? 1 : maxNum + 1);
		freeBoardCommDTO.setDate(new Timestamp(System.currentTimeMillis()).toString());
		System.out.println(freeBoardCommDTO.getDate());
		
		freeBoardDAO.insertComm(freeBoardCommDTO);
	}

	@Override
	public void deleteComm(String commNum) {
		freeBoardDAO.deleteComm(commNum);
	}

	
}
