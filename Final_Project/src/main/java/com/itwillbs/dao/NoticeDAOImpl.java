package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.NoticePageDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	//마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;
	//sql구문이름
	private static final String namespace="com.itwillbs.mappers.noticeMapper";
	
	@Override
	public void insertNotice(NoticeDTO noticeDTO) {
		sqlSession.insert(namespace+".insertNotice", noticeDTO);
		
	}

	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public List<NoticeDTO> getNoticeList(NoticePageDTO dto) {
		System.out.println(dto.getSearch());
		return sqlSession.selectList(namespace+".getNoticeList",dto);
	}

	@Override
	public int getNoticeCount() {
		return sqlSession.selectOne(namespace+".getNoticeCount");
	}

	@Override
	public void updateReadcount(int num) {
		sqlSession.update(namespace+".updateReadcount", num);
	}

	@Override
	public NoticeDTO getNotice(int num) {
		return sqlSession.selectOne(namespace+".getNotice", num);
	}



	@Override
	public void updateNotice(NoticeDTO noticeDTO) {
		System.out.println(noticeDTO.getNotiNum());
		sqlSession.update(namespace +".updateNotice", noticeDTO);
	}

	@Override
	public void deleteNotice(int num) {
		sqlSession.delete(namespace + ".delete", num);
		
	}


}
