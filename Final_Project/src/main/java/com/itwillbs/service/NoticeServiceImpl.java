package com.itwillbs.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.NoticeDAO;
import com.itwillbs.domain.NoticeDTO;
import com.itwillbs.domain.NoticePageDTO;

@Service
public class NoticeServiceImpl implements NoticeService{
	//자동 객체생성 부모=자식
	@Inject
	private NoticeDAO noticeDAO;
	
	@Override
	public void insertNotice(NoticeDTO noticeDTO) {
		// name,subject,content
		// num,readcount,date
		// num = max(num) + 1 
		if(noticeDAO.getMaxNum()==null) {
			//글이 없는 경우
			noticeDTO.setNotiNum(1);
		}else {
			//글이 있는 경우
			noticeDTO.setNotiNum(noticeDAO.getMaxNum()+1);
		}
		
		noticeDTO.setNotiReadcount(0);
		noticeDTO.setNotiDate(new SimpleDateFormat("yyyy.MM.dd HH:mm").format(new Timestamp(System.currentTimeMillis())));
		//메서드 호출
		noticeDAO.insertNotice(noticeDTO);
	}

	@Override
	public List<NoticeDTO> getNoticeList(NoticePageDTO dto) {
		// startRow 구하기
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+dto.getPageSize()-1;
		
		// 디비 limit startRow-1 
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);
		
		return noticeDAO.getNoticeList(dto);
	}

	@Override
	public int getNoticeCount() {
		return noticeDAO.getNoticeCount();
	}

	@Override
	public void updateReadcount(int num) {
		noticeDAO.updateReadcount(num);
	}

	@Override
	public NoticeDTO getNotice(int num) {
		return noticeDAO.getNotice(num);
	}

	@Override
	public void deleteNotice(NoticeDTO dto) {
		noticeDAO.deleteNotice(dto);	
		
	}

	@Override
	public void updateNotice(NoticeDTO noticeDTO) {
		noticeDAO.updateNotice(noticeDTO);
		
	}

}
