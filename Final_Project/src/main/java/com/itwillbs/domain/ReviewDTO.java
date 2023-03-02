package com.itwillbs.domain;

public class ReviewDTO {
	
	private int revNum;
	private String reviewee;
	private String reviewer;
	private int productNum;
	private int revScore;

	private int revTotal;
	private String revContent;
	private String revCate;
	
	
	
	public int getRevTotal() {
		return revTotal;
	}
	public void setRevTotal(int revTotal) {
		this.revTotal = revTotal;
	}

	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getRevCate() {
		return revCate;
	}
	public void setRevCate(String revCate) {
		this.revCate = revCate;
	}
	public int getRevNum() {
		return revNum;
	}
	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	public String getReviewee() {
		return reviewee;
	}
	public void setReviewee(String reviewee) {
		this.reviewee = reviewee;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public int getRevScore() {
		return revScore;
	}
	public void setRevScore(int revScore) {
		this.revScore = revScore;
	}

	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	
	
	
	
	

}
