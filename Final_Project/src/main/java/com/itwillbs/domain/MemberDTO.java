package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private int memNum;
	private String memId;
	private String memPass;
	private String memPhone;
	private String memName;
	private String memNname;
	private String memEmail;
	private String memAddress;
	private String memAccount;
	private Timestamp memTime;
	
	public int getMemNum() {
		return memNum;
	}
	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemNname() {
		return memNname;
	}
	public void setMemNname(String memNname) {
		this.memNname = memNname;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemAccount() {
		return memAccount;
	}
	public void setMemAccount(String memAccount) {
		this.memAccount = memAccount;
	}
	public Timestamp getMemTime() {
		return memTime;
	}
	public void setMemTime(Timestamp memTime) {
		this.memTime = memTime;
	}

}
