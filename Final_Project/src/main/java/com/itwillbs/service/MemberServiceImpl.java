package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		 MemberDTO dto = memberDAO.userCheck(memberDTO);
		 System.out.println("service "+dto.getMemId());
		 System.out.println("service "+dto.getMemPass());
		return dto;
	}

}
