package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.FreeBoardDTO;
import com.itwillbs.domain.PageDTO;

public interface FreeBoardService {
	
	public void insertBoard(FreeBoardDTO freeBoardDTO);
	public List<FreeBoardDTO> getBoardList(PageDTO pageDTO);
	public int getBoardCount();
	public FreeBoardDTO getBoard(int num);
	public void updateBoard(FreeBoardDTO freeBoardDTO);
	public void deleteBoard(int num);
}
