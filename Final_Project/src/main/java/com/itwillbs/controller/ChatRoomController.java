package com.itwillbs.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.MessageDTO;
import com.itwillbs.service.ChatService;


@Controller
public class ChatRoomController {
	
	@Inject
	private ChatService chatService;
	
    @Autowired(required = false)
    private SimpMessagingTemplate simpMessage;
	
    // 채팅방 입장 화면
    @RequestMapping(value = "/chat/list", method = RequestMethod.GET)
    public String roomList(){
        return "chat/room";
    }
	
    @MessageMapping("/chat/message")
    public void enter(MessageDTO message) throws FileNotFoundException, IOException {
    	message.setSendTime("[" + new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()).toString() + "]");
    	chatService.appendMessage(message);
        simpMessage.convertAndSend("/user/chat/room/"+message.getRoomId(), message);
    }
    
    // 채팅방 입장 화면
    @RequestMapping(value = "/chat/room/enter/{roomId}", method = RequestMethod.GET)
    public String roomDetail(Model model, @PathVariable String roomId) throws IOException{
    	
    	Map<String, Object> chatRoomMap = chatService.findById(roomId);
    	
//    	chatService.setRead(chatRoomDTO);
    	List<MessageDTO> chatHistory = chatService.readChatHistory(chatRoomMap);
    		
    	Collections.reverse(chatHistory);
    	
    	model.addAttribute("chatRoomMap", chatRoomMap);
    	model.addAttribute("chatHistory", chatHistory);
        model.addAttribute("roomId", roomId);
        return "chat/roomdetail";
    }
}