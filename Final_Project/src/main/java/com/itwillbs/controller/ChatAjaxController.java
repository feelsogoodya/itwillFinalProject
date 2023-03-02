package com.itwillbs.controller;

import java.io.IOException;
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
		
		String memberId = request.getParameter("memberId");
		int productNum = Integer.parseInt(request.getParameter("productNum"));
		
		ChatRoomDTO chatRoomDTO = new ChatRoomDTO();
		
		chatRoomDTO.setBuyerId(memberId);
		chatRoomDTO.setProductNum(productNum);
		
		chatRoomDTO = chatService.findByIdAndNum(chatRoomDTO); // 채팅방조회
		
		// 없으면 생성
		if(chatRoomDTO == null) {
			chatRoomDTO = new ChatRoomDTO();
			chatRoomDTO.setBuyerId(memberId);
			chatRoomDTO.setProductNum(productNum);
			chatRoomDTO.setSellerId(request.getParameter("seller"));
			System.out.println(chatRoomDTO);
			chatService.createRoom(chatRoomDTO);
			chatRoomDTO = chatService.findByIdAndNum(chatRoomDTO);
			chatService.createFile(chatRoomDTO); // 파일 생성
		}
		
		// 입장
        return "/chat/room/enter/" + chatRoomDTO.getRoomId();
    }
}
