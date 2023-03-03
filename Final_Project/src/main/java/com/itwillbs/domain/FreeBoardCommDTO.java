package com.itwillbs.domain;


public class FreeBoardCommDTO {
	private int commNum;
	private int freeboardNum;
	private String memberId;
	private String memberNick;
	private String content;
	private String date;
	
	public int getCommNum() {
		return commNum;
	}
	public void setCommNum(int commNum) {
		this.commNum = commNum;
	}
	public int getFreeboardNum() {
		return freeboardNum;
	}
	public void setFreeboardNum(int freeboardNum) {
		this.freeboardNum = freeboardNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	
	
}
