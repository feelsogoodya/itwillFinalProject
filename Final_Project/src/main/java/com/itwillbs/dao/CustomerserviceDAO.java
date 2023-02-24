package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.Cs_PageDTO;
import com.itwillbs.domain.Cs_commentDTO;
import com.itwillbs.domain.CustomerserviceDTO;

public interface CustomerserviceDAO {
	//추상메서드
	// 리턴할형 없음 insertBoard(BoardDTO 주소값 저장하는 변수) 메서드 정의
	public void insertBoard(CustomerserviceDTO dto);
	// getMaxNum
	public Integer getMaxNum();
//	
//	// List<BoardDTO> 리턴할형 getBoardList(PageDTO dto) 메서드 정의
	public List<CustomerserviceDTO> getBoardList(Cs_PageDTO dto);
//	
	public int getBoardCount(String searchText);
//	
//	// 조회수 증가
	public void updateReadcount(int num);
//	
//	// 글가져오기 메서드 호출
	public CustomerserviceDTO getBoard(int num);
	
	public void boardUpdatePro(CustomerserviceDTO dto);
	
	public void Delete (int num);
	
	
	
	
	
	
	
	public Integer getCsComMaxNum(Cs_commentDTO cs_dto);
	
	public void insertCom(Cs_commentDTO cs_dto);
	
	public List<Cs_commentDTO> getCsComList(Cs_PageDTO dto);
	
	public int getComBoardCount(int num);
	
	public void cs_comdelete(Cs_commentDTO cs_dto);
	
	
	
	
	
	
	// 대댓글 작성
	
	public Integer getCsComComMaxNum(Cs_commentDTO cs_dto);
	
	public void insertComCom(Cs_commentDTO cs_dto);
	
	public void CsComCommdelete(Cs_commentDTO cs_dto);
	
	

	
	
	
	
	
	
	// content에서 처리과정 변경
	public void processChange(CustomerserviceDTO dto);
	
	
}
