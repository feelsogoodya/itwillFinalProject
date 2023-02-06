package com.itwillbs.dao;

import com.itwillbs.domain.SampleDTO;

public interface SampleDAO {
	//DAO 인터페이스
	//DAOImpl에서 사용할 추상메서드 작성
	public void insertTest(SampleDTO sampleDTO);
}
