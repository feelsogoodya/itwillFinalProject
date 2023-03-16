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
		Timestamp date=new Timestamp(System.currentTimeMillis());
		dto.setMemTime(date);
		
		sqlSession.insert(namespace+".insertMember",dto);
	}

	@Override
	public MemberDTO userCheck(MemberDTO dto) {
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
		sqlSession.selectOne(namespace+".passwordUpdate", searchVO);
	}

	@Override
	public void updateImg(MemberDTO dto) {
		sqlSession.update(namespace+".updateImg", dto);
	}
	
}
