package com.itwillbs.domain;

import java.sql.Timestamp;

public class ProductDTO {
	
	private int productNum;
	private String memberId;
	private String productCate;
	private String productTitle;
	private String productContent;
	private int productPrice;
	private String productGrade;
	private String productPic;
	private int productReadcount;
	private Timestamp productDate;
	
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProductCate() {
		return productCate;
	}
	public void setProductCate(String productCate) {
		this.productCate = productCate;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductGrade() {
		return productGrade;
	}
	public void setProductGrade(String productGrade) {
		this.productGrade = productGrade;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	public int getProductReadcount() {
		return productReadcount;
	}
	public void setProductReadcount(int productReadcount) {
		this.productReadcount = productReadcount;
	}
	public Timestamp getProductDate() {
		return productDate;
	}
	public void setProductDate(Timestamp productDate) {
		this.productDate = productDate;
	}
	
}
