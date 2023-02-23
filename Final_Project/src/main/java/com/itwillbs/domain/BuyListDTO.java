package com.itwillbs.domain;

public class BuyListDTO {

	private int buyNum;
	private String buymemId;
	private String prodName;
	private String prodPic;
	private int prodPrice;
	private String buyDate;
	
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public String getBuymemId() {
		return buymemId;
	}
	public void setBuymemId(String buymemId) {
		this.buymemId = buymemId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
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
	
	
}
