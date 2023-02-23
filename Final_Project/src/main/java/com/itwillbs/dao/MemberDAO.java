package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;

public interface MemberDAO {
	//추상메서드
	public void insertMember(MemberDTO dto);
	
	// MemberDTO 리턴할형  userCheck(MemberDTO dto)
	public MemberDTO userCheck(MemberDTO dto);
	
	//MemberDTO dto=memberService.getMember(id);
	public MemberDTO getMember(String memId);
	
	// memberService.updateMember(dto);
	public void updateMember(MemberDTO dto);
	
	public void deleteMember(MemberDTO dto);
	
//	List<MemberDTO> memberList=memberService.getMemberList();
	public List<MemberDTO> getMemberList();
	
	public MemberDTO memberIdSearch(MemberDTO searchVO);
	
	public int memberPwdCheck(MemberDTO searchVO);
	
	public void passwordUpdate(MemberDTO searchVO);
	
}
