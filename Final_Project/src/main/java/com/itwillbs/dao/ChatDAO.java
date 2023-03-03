package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.MessageDTO;


public interface ChatDAO {
	
	public List<Map<String, Object>> findAllRoom(String memberId);
	
	public Map<String, Object> findById(String roomId);
	
	public void createRoom(ChatRoomDTO chatRoomDTO);
	
	public ChatRoomDTO findByIdAndNum(ChatRoomDTO chatRoomDTO);
	
	public void setRead(ChatRoomDTO chatRoomDTO);
	
	public void deleteRoom(MessageDTO messageDTO);
}
