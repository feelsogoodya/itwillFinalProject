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

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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

	public void updateImg(String memberImg, String memId);

	public String getAccessToken(String code);

	String access_Token = "";
	String refresh_Token = "";
	String reqURL = "https://kauth.kakao.com/oauth/token";

	try
	{
		URL url = new URL(reqURL);

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");

		sb.append("&client_id=REST_API키"); // 본인이 발급받은 key
		sb.append("&redirect_uri=REDIRECT_URI"); // 본인이 설정한 주소

		sb.append("&code=" + authorize_code);
		bw.write(sb.toString());
		bw.flush();

		// 결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);

		// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = "";
		String result = "";

		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("response body : " + result);

		// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);

		access_Token = element.getAsJsonObject().get("access_token").getAsString();
		refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

		System.out.println("access_token : " + access_Token);
		System.out.println("refresh_token : " + refresh_Token);

		br.close();
		bw.close();
	}catch(
	IOException e)
	{
		e.printStackTrace();
	}return access_Token;
}

}
