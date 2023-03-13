package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;

public interface MemberDAO {
	public void insertMember(MemberDTO dto);
	
	public MemberDTO userCheck(MemberDTO dto);
	
	public MemberDTO getMember(String memId);
	
	public void updateMember(MemberDTO dto);
	
	public void deleteMember(MemberDTO dto);
	
	public List<MemberDTO> getMemberList();
	
	public MemberDTO memberIdSearch(MemberDTO searchVO);
	
	public int memberPwdCheck(MemberDTO searchVO);
	
	public void passwordUpdate(MemberDTO searchVO);
	
}
