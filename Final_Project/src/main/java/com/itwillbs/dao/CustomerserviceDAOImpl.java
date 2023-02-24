package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Cs_PageDTO;
import com.itwillbs.domain.Cs_commentDTO;
import com.itwillbs.domain.CustomerserviceDTO;

@Repository
public class CustomerserviceDAOImpl implements CustomerserviceDAO{
	//마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;
	//sql구문이름
	private static final String namespace="com.itwillbs.mappers.customerserviceMapper";
	
	@Override
	public void insertBoard(CustomerserviceDTO dto) {
		sqlSession.insert(namespace+".insertBoard", dto);
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}
	

	@Override
	public List<CustomerserviceDTO> getBoardList(Cs_PageDTO dto) {
		
		return sqlSession.selectList(namespace+".getBoardList",dto);
	}

	@Override
	public int getBoardCount(String searchText) {
		return sqlSession.selectOne(namespace+".getBoardCount", searchText);
	}
//
	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace+".updateReadcount", num);
	}
//
	@Override
	public CustomerserviceDTO getBoard(int num) {
		return sqlSession.selectOne(namespace+".getBoard", num);
	}
	
	@Override
	public void boardUpdatePro(CustomerserviceDTO dto) {
		sqlSession.update(namespace + ".boardUpdatePro", dto);
	}
	@Override
	public void Delete(int num) {
		sqlSession.delete(namespace + ".Delete1", num);
		sqlSession.delete(namespace + ".Delete2", num);
	}
	
	
	
	
	
	
	@Override
	public Integer getCsComMaxNum(Cs_commentDTO cs_dto) {
		return sqlSession.selectOne(namespace+".getCsComMaxNum", cs_dto);
	}
	
	@Override
	public void insertCom(Cs_commentDTO cs_dto) {
		sqlSession.insert(namespace+".insertCom", cs_dto);
	}
	
	@Override
	public List<Cs_commentDTO> getCsComList(Cs_PageDTO dto) {
		return sqlSession.selectList(namespace+".getCsComList",dto);
	}
	
	
	@Override
	public int getComBoardCount(int num) {
		return sqlSession.selectOne(namespace+".getComBoardCount", num);
	}
	
	@Override
	public void cs_comdelete(Cs_commentDTO cs_dto) {
		sqlSession.delete(namespace + ".cs_comdelete", cs_dto);
	}	
	
	
	
	
	
	
	
	

	
	@Override
	public Integer getCsComComMaxNum(Cs_commentDTO cs_dto) {
		return sqlSession.selectOne(namespace+".getCsComComMaxNum", cs_dto);
	}
	
	@Override
	public void insertComCom(Cs_commentDTO cs_dto) {
		System.out.println(cs_dto.getMemId());
		sqlSession.insert(namespace+".insertComCom", cs_dto);
	}
	@Override
	public void CsComCommdelete(Cs_commentDTO cs_dto) {
		sqlSession.delete(namespace + ".CsComCommdelete", cs_dto);
	}
	
	
	
	
	
	
	
	
	// content에서 처리과정 변경
	@Override
	public void processChange(CustomerserviceDTO dto) {
		sqlSession.update(namespace+".processChange", dto);
	}
	
}
