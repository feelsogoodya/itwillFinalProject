package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.FreeBoardCommDTO;
import com.itwillbs.domain.FreeBoardDTO;
import com.itwillbs.domain.PageDTO;

public interface FreeBoardService {
	
	public void insertBoard(FreeBoardDTO freeBoardDTO);
	public List<FreeBoardDTO> getBoardList(PageDTO pageDTO);
	public int getBoardCount(PageDTO pageDTO);
	public FreeBoardDTO getBoard(int num);
	public void updateBoard(FreeBoardDTO freeBoardDTO);
	public void deleteBoard(int num);
	public List<FreeBoardCommDTO> getCommList(int freeboardNum);
	public void insertComm(FreeBoardCommDTO freeBoardCommDTO);
	public void deleteComm(String commNum);
}
