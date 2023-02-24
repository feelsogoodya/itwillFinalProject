package com.itwillbs.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CustomerserviceDAO;
import com.itwillbs.domain.Cs_PageDTO;
import com.itwillbs.domain.Cs_commentDTO;
import com.itwillbs.domain.CustomerserviceDTO;

@Service
public class CustomerserviceServiceImpl implements CustomerserviceService{
	//자동 객체생성 부모=자식
	@Inject
	private CustomerserviceDAO customerserviceDAO; 
	
	
	@Override
	public void insertBoard(CustomerserviceDTO dto) {
		// name,subject,content
		// num,readcount,date
		// num = max(num) + 1 
		if(customerserviceDAO.getMaxNum()==null) {
			//글이 없는 경우
			dto.setCsNum(1);
		}else {
			//글이 있는 경우
			dto.setCsNum(customerserviceDAO.getMaxNum()+1);
		}
		
		dto.setCsReadcount(0);
//		dto.setCs_date(new Timestamp(System.currentTimeMillis()));
		dto.setCsDate(new SimpleDateFormat("yyyy.MM.dd HH:mm").format(new Timestamp(System.currentTimeMillis())));
		
		//메서드 호출
		customerserviceDAO.insertBoard(dto);
	}

	@Override
	public List<CustomerserviceDTO> getBoardList(Cs_PageDTO dto) {
		// startRow 구하기
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+dto.getPageSize()-1;
		
		// 디비 limit startRow-1 
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);
		
		return customerserviceDAO.getBoardList(dto);
	}

	@Override
	public int getBoardCount(String searchText) {
		return customerserviceDAO.getBoardCount(searchText);
	}

	@Override
	public void updateReadcount(int num) {
		customerserviceDAO.updateReadcount(num);
	}

	@Override
	public CustomerserviceDTO getBoard(int num) {
		return customerserviceDAO.getBoard(num);
	}
	
	@Override
	public void boardUpdatePro(CustomerserviceDTO dto) {
		customerserviceDAO.boardUpdatePro(dto);
	}
	@Override
	public void Delete(int num) {
		customerserviceDAO.Delete(num);
	}
	
	@Override
	public int getCsComMaxNum(Cs_commentDTO cs_dto) {
		return customerserviceDAO.getCsComMaxNum(cs_dto);
	}
	
	@Override
	public void insertCom(Cs_commentDTO cs_dto) {
		if(customerserviceDAO.getCsComMaxNum(cs_dto)== 0) {
			//글이 없는 경우
			cs_dto.setCsComNum1(1);
		}else {
			//글이 있는 경우
			cs_dto.setCsComNum1(customerserviceDAO.getCsComMaxNum(cs_dto)+1);
		}
		
		cs_dto.setCsComDate(new SimpleDateFormat("yyyy.MM.dd HH:mm").format(new Timestamp(System.currentTimeMillis())));
		customerserviceDAO.insertCom(cs_dto);
	}
	
	@Override
	public List<Cs_commentDTO> getCsComList(Cs_PageDTO dto) {
		
		
		// startRow 구하기
		int startRow=(dto.getCurrentPage()-1)*dto.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+dto.getPageSize()-1;
		
		// 디비 limit startRow-1 
		dto.setStartRow(startRow-1);
		dto.setEndRow(endRow);
		return customerserviceDAO.getCsComList(dto);
	}
	
	
	@Override
	public int getComBoardCount(int num) {
		return customerserviceDAO.getComBoardCount(num);
	}
	
	
	@Override
	public void cs_comdelete(Cs_commentDTO cs_dto) {
		customerserviceDAO.cs_comdelete(cs_dto);
	}
	
	
	
	
	
	
	
	
	
	
	
	//대댓글 작성
	
	@Override
	public int getCsComComMaxNum(Cs_commentDTO cs_dto) {
		return customerserviceDAO.getCsComComMaxNum(cs_dto);
	}
	
	
	@Override
	public void insertComCom(Cs_commentDTO cs_dto) {
//		System.out.println("이거 왜 1임?????"+customerserviceDAO.getCsComComMaxNum(cs_dto));
		
		
		if(customerserviceDAO.getCsComComMaxNum(cs_dto)== 1) {
			//글이 없는 경우
			cs_dto.setCsComNum2(1);
		}else {
			//글이 있는 경우
			cs_dto.setCsComNum2(customerserviceDAO.getCsComComMaxNum(cs_dto));
		}
		
		cs_dto.setCsComDate(new SimpleDateFormat("yyyy.MM.dd HH:mm").format(new Timestamp(System.currentTimeMillis())));
		customerserviceDAO.insertComCom(cs_dto);
	}
	
	
	
	@Override
	public void CsComCommdelete(Cs_commentDTO cs_dto) {
		customerserviceDAO.CsComCommdelete(cs_dto);		
	}
	
	
	
	
	
	// content에서 처리과정 변경
	@Override
	public void processChange(CustomerserviceDTO dto) {
		customerserviceDAO.processChange(dto);
	}
	
	

	

	

}
