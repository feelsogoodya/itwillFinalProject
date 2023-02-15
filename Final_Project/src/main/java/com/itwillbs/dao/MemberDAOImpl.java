package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.memberMapper";

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		MemberDTO dto = sqlSession.selectOne(namespace+".userCheck", memberDTO);
		System.out.println("dao "+dto.getMemId());
		 System.out.println("dao "+dto.getMemPass());
		return dto;
	}

	

}
