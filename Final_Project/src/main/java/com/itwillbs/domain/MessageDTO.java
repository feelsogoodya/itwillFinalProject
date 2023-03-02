package com.itwillbs.domain;

public class MessageDTO {
	private MessageType type;
	private String roomId;
    private String message;
    private String sender;
    private String sendTime;

    public MessageDTO() {
    	
    }
    
	public MessageDTO(String message, String sender, String sendTime) {
    	this.message = message;
    	this.sender = sender;
    	this.sendTime = sendTime;
    }
    
    public enum MessageType {
        ENTER, TALK
    }
    public MessageType getType() {
        return type;
    }

    public void setType(MessageType type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	
}
