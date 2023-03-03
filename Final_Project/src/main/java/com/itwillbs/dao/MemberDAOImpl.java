package com.itwillbs.dao;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
//import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.memberMapper";

	@Override
	public void insertMember(MemberDTO dto) {
		System.out.println("MemberDAOImpl insertMember()");
		System.out.println(dto.getMemId());
		System.out.println(dto.getMemPass());
		System.out.println(dto.getMemName());
		System.out.println(dto.getMemNname());
		System.out.println(dto.getMemNum());
		System.out.println(dto.getMemPhone());
		System.out.println(dto.getMemEmail());
		System.out.println(dto.getMemAddress());
		System.out.println(dto.getMemAccount());
		System.out.println(dto.getMemPhone());
		Timestamp date=new Timestamp(System.currentTimeMillis());
		dto.setMemTime(date);
		
		sqlSession.insert(namespace+".insertMember",dto);
	}

	@Override
	public MemberDTO userCheck(MemberDTO dto) {
		System.out.println("MemberDAOImpl userCheck()");
		System.out.println(dto.getMemId());
		System.out.println(dto.getMemPass());
		
		return sqlSession.selectOne(namespace+".userCheck", dto);
	}

	@Override
	public MemberDTO getMember(String memId) {
		return sqlSession.selectOne(namespace+".getMember", memId);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update(namespace+".updateMember", dto);
	}

	@Override
	public void deleteMember(MemberDTO dto) {
		sqlSession.delete(namespace+".deleteMember", dto);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return sqlSession.selectList(namespace+".getMemberList");
	}
	
	@Override
	public MemberDTO memberIdSearch(MemberDTO searchVO) {
		return sqlSession.selectOne(namespace+".memberIdSearch", searchVO);
	}

	@Override
	public int memberPwdCheck(MemberDTO searchVO) {
		return sqlSession.selectOne(namespace+".memberPwdCheck", searchVO);
	}

	@Override
	public void passwordUpdate(MemberDTO searchVO) {
		System.out.println(searchVO.getMemId());
		System.out.println(searchVO.getMemName());
		System.out.println(searchVO.getMemPhone());
		sqlSession.selectOne(namespace+".passwordUpdate", searchVO);
	}
	
}
