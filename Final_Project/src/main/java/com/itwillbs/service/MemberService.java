package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.protobuf.Message;
import com.itwillbs.domain.MemberDTO;

public interface MemberService {
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
