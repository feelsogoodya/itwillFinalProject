package com.itwillbs.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParser;
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

	public void updateImg(MemberDTO dto);

}
