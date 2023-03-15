package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FreeBoardCommDTO;
import com.itwillbs.domain.FreeBoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.freeboardMapper";

	@Override
	public void insertBoard(FreeBoardDTO freeBoardDTO) {
		sqlSession.insert(namespace + ".insert", freeBoardDTO);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace + ".getMaxNum");
	}

	@Override
	public List<FreeBoardDTO> getBoardList(PageDTO pageDTO) {
		System.out.println(pageDTO.getSearch());
		return sqlSession.selectList(namespace + ".getBoardList", pageDTO);
	}

	@Override
	public int getBoardCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace + ".getBoardCount", pageDTO);
	}

	@Override
	public FreeBoardDTO getBoard(int num) {
		sqlSession.update(namespace + ".updateReadcount", num);
		return sqlSession.selectOne(namespace + ".getBoard", num);
	}

	@Override
	public void updateBoard(FreeBoardDTO freeBoardDTO) {
		sqlSession.update(namespace + ".update", freeBoardDTO);
	}

	@Override
	public void deleteBoard(int num) {
		sqlSession.delete(namespace + ".delete", num);
	}

	@Override
	public List<FreeBoardCommDTO> getCommList(int freeboardNum) {
		return sqlSession.selectList(namespace + ".getCommList", freeboardNum);
	}

	@Override
	public void insertComm(FreeBoardCommDTO freeBoardCommDTO) {
		sqlSession.insert(namespace + ".insertComm", freeBoardCommDTO);
	}
	
	@Override
	public Integer getMaxCommNum() {
		System.out.println("maxComm");
		return sqlSession.selectOne(namespace + ".getMaxCommNum");
	}

	@Override
	public void deleteComm(String commNum) {
		sqlSession.delete(namespace + ".deleteComm", commNum);
	}
	
}
