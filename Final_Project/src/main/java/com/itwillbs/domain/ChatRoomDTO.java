package com.itwillbs.domain;

import java.sql.Timestamp;

public class ChatRoomDTO {

    private String roomId;
    private int productNum;
    private String sellerId;
    private String buyerId;
    private Timestamp date;
    private int read;
    
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		System.out.println(roomId);
		this.roomId = roomId;
	}
	
	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getRead() {
		return read;
	}

	public void setRead(int read) {
		this.read = read;
	}

}