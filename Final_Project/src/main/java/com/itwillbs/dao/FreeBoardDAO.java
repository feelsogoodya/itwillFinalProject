package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.FreeBoardDTO;
import com.itwillbs.domain.PageDTO;

public interface FreeBoardDAO {

	public void insertBoard(FreeBoardDTO freeBoardDTO);
	public Integer getMaxNum();
	public List<FreeBoardDTO> getBoardList(PageDTO pageDTO);
	public int getBoardCount();
	public FreeBoardDTO getBoard(int num);
	public void updateBoard(FreeBoardDTO freeBoardDTO);
	public void deleteBoard(int num);
}
