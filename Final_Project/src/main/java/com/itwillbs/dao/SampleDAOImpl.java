package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.SampleDTO;

@Repository
public class SampleDAOImpl implements SampleDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.sampleMapper";

	@Override
	public void insertTest(SampleDTO sampleDTO) {

		sqlSession.insert(namespace+".insertTest", sampleDTO);
	}

}
