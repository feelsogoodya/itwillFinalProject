package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SampleDAO;
import com.itwillbs.domain.SampleDTO;

@Service
public class SampleServiceImpl implements SampleService{
	
	@Inject
	private SampleDAO sampleDAO;

	@Override
	public void insertTest(SampleDTO sampleDTO) {
		
		sampleDAO.insertTest(sampleDTO);
	} 
	
}
