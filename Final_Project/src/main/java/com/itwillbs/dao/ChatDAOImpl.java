package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChatRoomDTO;


@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.chatMapper";

	@Override
	public List<Map<String, Object>> findAllRoom(String memberId) {
		return sqlSession.selectList(namespace + ".findAllRoom", memberId);
	}

	@Override
	public Map<String, Object> findById(String roomId) {
		return sqlSession.selectOne(namespace + ".findById", roomId);
	}

	@Override
	public void createRoom(ChatRoomDTO chatRoomDTO) {
		sqlSession.insert(namespace + ".createRoom", chatRoomDTO);
	}
	
	@Override
	public ChatRoomDTO findByIdAndNum(ChatRoomDTO chatRoomDTO) {
		return sqlSession.selectOne(namespace + ".findByIdAndNum", chatRoomDTO);
	}

	@Override
	public void setRead(ChatRoomDTO chatRoomDTO) {
		sqlSession.update(namespace + ".setRead", chatRoomDTO);
	}

}
