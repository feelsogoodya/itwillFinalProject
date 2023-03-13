package com.itwillbs.domain;

public class ReviewDTO {
	
	private int revNum;
	private String reviewee;
	private String reviewer;
	private int productNum;
	private double revScore;

	private double revTotal;
	private String revContent;
	private String revCate;
	
	
	

	public double getRevTotal() {
		return revTotal;
	}
	public void setRevTotal(double revTotal) {
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

	public double getRevScore() {
		return revScore;
	}
	public void setRevScore(double revScore) {
		this.revScore = revScore;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	
	
	
	
	

}
