package com.itwillbs.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.MessageDTO;
import com.itwillbs.service.ChatService;


@RestController
public class ChatAjaxController {
	
	@Inject
	private ChatService chatService;
	
    // 모든 채팅방 목록 반환
    @RequestMapping(value = "/chat/rooms", method = RequestMethod.GET)
    public List<Map<String, Object>> room(HttpServletRequest request) {
    	String memberId = request.getParameter("memberId");
    	List<Map<String, Object>> list = chatService.findAllRoom(memberId);
    	if(list == null) {
    		return new ArrayList<Map<String, Object>>();
    	}
        return list;
    }
    
	// 채팅방 조회 후 없으면 생성
	@RequestMapping(value = "/chat/room", method = RequestMethod.POST)
    public String chat(HttpServletRequest request) throws IOException {
		System.out.println("시작");
		String memberId = request.getParameter("memberId");
		int productNum = Integer.parseInt(request.getParameter("productNum"));
		
		ChatRoomDTO chatRoomDTO = new ChatRoomDTO();
		
		chatRoomDTO.setBuyerId(memberId);
		chatRoomDTO.setProductNum(productNum);
		
		chatRoomDTO = chatService.findByIdAndNum(chatRoomDTO); // 채팅방조회
		System.out.println("채팅방 조회 완료");
		// 없으면 생성
		if(chatRoomDTO == null) {
			chatRoomDTO = new ChatRoomDTO();
			chatRoomDTO.setBuyerId(memberId);
			chatRoomDTO.setProductNum(productNum);
			chatRoomDTO.setSellerId(request.getParameter("seller"));
			chatRoomDTO.setDate(new Timestamp(System.currentTimeMillis()));
			System.out.println(chatRoomDTO);
			chatService.createRoom(chatRoomDTO);
			chatRoomDTO = chatService.findByIdAndNum(chatRoomDTO);
			chatService.createFile(chatRoomDTO); // 파일 생성
		}
		System.out.println("끝");
		// 입장
        return "/chat/room/enter/" + chatRoomDTO.getRoomId();
    }
	
	// 내 채팅방 삭제
    @RequestMapping(value = "/chat/delete", method = RequestMethod.POST)
    public void deleteRoom(HttpServletRequest request) throws IOException {

    	String roomId = request.getParameter("roomId"); 
    	String sender = request.getParameter("sender");
    	String senderNick = request.getParameter("senderNick");
    	
    	MessageDTO messageDTO = new MessageDTO();
    	messageDTO.setRoomId(roomId);
    	messageDTO.setSender(sender);
    	messageDTO.setSendTime("[" + new Timestamp(System.currentTimeMillis()).toString() + "]");
    	String productNum = request.getParameter("productNum");
    	chatService.deleteRoom(messageDTO, productNum, senderNick);
    }
}
