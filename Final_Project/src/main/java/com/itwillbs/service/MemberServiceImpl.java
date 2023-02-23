package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.MemberDAOImpl;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject  
	private MemberDAO memberDAO;
	
	@Override
	public void insertMember(MemberDTO dto) {
		System.out.println("MemberServiceImpl insertMember()");
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
		//MemberController => MemberService => MemberDAO
//		MemberDAO memberDAO=new MemberDAOImpl();
		memberDAO.insertMember(dto);
		
	}

	@Override
	public MemberDTO userCheck(MemberDTO dto) {
		System.out.println("MemberServiceImpl userCheck()");
		System.out.println(dto.getMemId());
		System.out.println(dto.getMemPass());
		
		// 객체생성
		//메서드 호출
//		MemberDAO memberDAO=new MemberDAOImpl();
		return memberDAO.userCheck(dto);
		
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		memberDAO.updateMember(dto);
	}

	@Override
	public void deleteMember(MemberDTO dto) {
		memberDAO.deleteMember(dto);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public MemberDTO memberIdSearch(MemberDTO searchVO) {
	    return memberDAO.memberIdSearch(searchVO);
	}

	@Override
	public int memberPwdCheck(MemberDTO searchVO) {
	    return memberDAO.memberPwdCheck(searchVO);
	}

	@Override
	public void passwordUpdate(MemberDTO searchVO) {
		memberDAO.passwordUpdate(searchVO);
	}

}
