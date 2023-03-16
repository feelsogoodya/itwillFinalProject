package com.itwillbs.domain;

public class BuyListDTO {

	private int buyNum;
	private String buymemName;
	private String prodTitle;
	private String prodPic;
	private int prodPrice;
	private String buyDate;
	private String prodSeller;
	private String revResult;

	public String getProdSeller() {
		return prodSeller;
	}
	public void setProdSeller(String prodSeller) {
		this.prodSeller = prodSeller;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public String getBuymemName() {
		return buymemName;
	}
	public void setBuymemName(String buymemName) {
		this.buymemName = buymemName;
	}
	public String getProdTitle() {
		return prodTitle;
	}
	public void setProdTitle(String prodTitle) {
		this.prodTitle = prodTitle;
	}
	public String getProdPic() {
		return prodPic;
	}
	public void setProdPic(String prodPic) {
		this.prodPic = prodPic;
	}
	public int getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public String getRevResult() {
		return revResult;
	}
	public void setRevResult(String revResult) {
		this.revResult = revResult;
	}
	
}
