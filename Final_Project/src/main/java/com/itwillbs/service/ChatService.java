package com.itwillbs.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChatDAO;
import com.itwillbs.domain.ChatRoomDTO;
import com.itwillbs.domain.MessageDTO;


@Service
public class ChatService {

	@Inject
	private ChatDAO chatDAO;

    //application.properties에 설정
	@Resource(name = "txtUploadPath")
    private String fileUploadPath;
	
    //채팅방 불러오기
    public List<Map<String, Object>> findAllRoom(String memberId) {
        //채팅방 최근 생성 순으로 반환
    	List<Map<String, Object>> result = chatDAO.findAllRoom(memberId);
        Collections.reverse(result);
        
        return result;
    }

    //채팅방 하나 불러오기
    public Map<String, Object> findById(String roomId) {
        return chatDAO.findById(roomId);
    }

    //채팅방 생성
    public void createRoom(ChatRoomDTO chatRoomDTO) {
    	System.out.println("service");
    	System.out.println(chatRoomDTO);
    	System.out.println("uuid");
        chatRoomDTO.setRoomId(UUID.randomUUID().toString());
        
    	chatDAO.createRoom(chatRoomDTO);
    }
    
    public ChatRoomDTO findByIdAndNum(ChatRoomDTO chatRoomDTO) {
    	return chatDAO.findByIdAndNum(chatRoomDTO);
    }
    
    
    // ---------textFile---------
	public void createFile(ChatRoomDTO chatRoomDTO) throws IOException {
        System.out.println("createFile start");
        String fileName = chatRoomDTO.getProductNum() + "_" + chatRoomDTO.getRoomId() + ".txt";
        String pathName = fileUploadPath + fileName;
        System.out.println(pathName);
        //File 클래스에 pathName 할당
        File txtFile = new File(pathName);
        //로컬경로에 파일 생성
        txtFile.createNewFile();
        System.out.println("createFile end");
//        chatRoomDAO.updateFileName(chatRoomDTO.getRoomId(), fileName);
    }
	
    //no connection with DB
    public List<MessageDTO> readChatHistory(Map<String, Object> chatRoomMap) throws IOException {
        
    	String fileName = chatRoomMap.get("productNum") + "_" + chatRoomMap.get("roomId") + ".txt";
    	
        String pathName = fileUploadPath + fileName;
        
        System.out.println(pathName);
        
        //DB에 저장된 chat.txt 파일을 읽어옴 
        BufferedReader br = new BufferedReader(new FileReader(pathName));
        //View에 ChatRoomDTO 객체로 전달
        MessageDTO messageDTO = new MessageDTO();
        List<MessageDTO> chatHistory = new ArrayList<MessageDTO>();
        
        String chatLine;
        int idx = 0;
        
        while ((chatLine = br.readLine()) != null) {
            //1개 메시지는 3줄(보낸사람,메시지내용,보낸시간)로 구성돼있음
                
        	switch (idx) {
				case 0:messageDTO.setSender(chatLine);idx++;break; //보낸사람
				case 1:messageDTO.setMessage(chatLine);idx++;break; //메시지내용
				case 2:messageDTO.setSendTime(chatLine);idx++;break;//보낸시간
			}
        	
            if(idx == 3) {
            	//메시지 담긴 ChatRoom 객체 List에 저장
            	chatHistory.add(messageDTO);
            	//객체 초기화, 줄(row)인덱스 초기화
            	messageDTO = new MessageDTO();
            	idx %= 3;
           	}
        }
        return chatHistory;
    }
    
    public void appendMessage(MessageDTO messageDTO) throws FileNotFoundException, IOException {
		
		String roomId = messageDTO.getRoomId();
		
		Map<String, Object> chatRoomMap = chatDAO.findById(roomId);
		
		String fileName = chatRoomMap.get("productNum") + "_" + chatRoomMap.get("roomId") + ".txt";
		
		String pathName = fileUploadPath + fileName;
		
		FileOutputStream fos = new FileOutputStream(pathName, true);
		String message = messageDTO.getMessage();
		String sender = messageDTO.getSender();
		String sendTime = messageDTO.getSendTime();
		System.out.println("print:" + message);
		
		String writeContent = sender + "\n" + message + "\n" + sendTime + "\n";
		
		byte[] b = writeContent.getBytes();
		
		fos.write(b);
		fos.close();
		
//		if (sender.equals(chatRoomDTO.getSellerId())) {
//			updateChatReadBuy(chatRoomDTO.getRoomId(), 0);
//		} else {
//			updateChatReadSell(chatRoomDTO.getRoomId(), 0);
//		}
		
	}
    
    public void setRead(ChatRoomDTO chatRoomDTO) {
		chatDAO.setRead(chatRoomDTO);
	}
    
    public void deleteRoom(MessageDTO messageDTO, String productNum, String senderNick) throws IOException {
    	String roomId = messageDTO.getRoomId();
		
		String fileName = productNum + "_" + roomId + ".txt";
		
		String pathName = fileUploadPath + fileName;
		
		FileOutputStream fos = new FileOutputStream(pathName, true);
		String sendTime = messageDTO.getSendTime();
		
		String writeContent = senderNick + "\n회원님이 방을 나가셨습니다.\n" + sendTime + "\n";
		
		byte[] b = writeContent.getBytes();
		
		fos.write(b);
		fos.close();
		
		System.out.println(roomId);
		
		chatDAO.deleteRoom(messageDTO);
    }
}