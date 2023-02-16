package com.itwillbs.domain;

public class FreeBoardDTO {
	private int freeboardNum;
	private String memberId;
	private String subject;
	private String context;
	private int readcount;
	private String date;
	private int likeCount;
	
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	
}
