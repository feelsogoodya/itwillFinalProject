package com.itwillbs.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.ProcessBuilder.Redirect;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileExistsException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.Cs_PageDTO;
import com.itwillbs.domain.Cs_commentDTO;
import com.itwillbs.domain.CustomerserviceDTO;
import com.itwillbs.service.CustomerserviceService;


@Controller
public class CustomerserviceController {
	@Inject
	private CustomerserviceService customerservice;
	
	@Resource(name="uploadPath1")
	private String uploadPath1;
	@Resource(name="uploadPath2")
	private String uploadPath2;
	
	@RequestMapping(value = "/customerservice/write", method = RequestMethod.GET)	
	public String write() {
		return "customerservice/writeForm";
	}//
	
	
	@RequestMapping(value = "/customerservice/writePro", method = RequestMethod.POST)
	public String writePro(@RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest request) throws Exception {
		
		
		
		// 파일 업로드 시작
		
		// 첨부파일 있고 없고를 비교해주는 것 isnotnull
		String isnotnull = "";
		for(int i = 0; i < multiFileList.size(); i++) {
			isnotnull = multiFileList.get(i).getOriginalFilename();
		}
		
		
		String fileList0 = "";
		String fileList1 = "";
		String fileList2 = "";
		
//		System.out.println(request.getSession().getServletContext().getRealPath("resources"));
		// isnotnull 이 비어있지 않을 때
		if (!isnotnull.isEmpty()) {
			
			// 받아온것 출력 확인
//			System.out.println("multiFileList : " + multiFileList);

			// path 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources");
			String root = path + "\\" + "customerservice" + "\\" + "img";
			File fileCheck = new File(root);
			if(!fileCheck.exists()) fileCheck.mkdirs();
			
			
			
			List<Map<String, String>> fileList = new ArrayList<>();
			


			
			for(int i = 0; i < multiFileList.size(); i++) {
				String originFile = multiFileList.get(i).getOriginalFilename();
				String ext = originFile.substring(originFile.lastIndexOf("."));
				String changeFile = UUID.randomUUID().toString() + ext;
				String mixFile = UUID.randomUUID().toString()+"高"+ originFile;
//				String changeFile = UUID.randomUUID().toString()+"_"+ originFile+ext;
					
					
				Map<String, String> map = new HashMap<>();
				map.put("originFile", originFile);
				map.put("changeFile", changeFile);
				map.put("mixFile", mixFile);
				fileList.add(map);
				}

				
				
				
				
				try {
					for(int i = 0; i < multiFileList.size(); i++) {
//						File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
//						multiFileList.get(i).transferTo(uploadFile);
						// spring에 저장
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath1, fileList.get(i).get("mixFile")));
						// 새로고침안하고 바로보이게 하기위해서 하나더 추가함 즉 2군대 저장함
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath2, fileList.get(i).get("mixFile")));
					}
					
					System.out.println("다중 파일 업로드 성공!");
					
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패 ㅠㅠ");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					
					e.printStackTrace();
				}
				

				// 위에서 파일이 없을경우 처음부터 if문이 동작하지않으므로(즉 파일 하나라도 넣었다는 뜻) fileList0는 if문을 쓸필요없다
				// 파일이 1개인지 2개인지 판별을위해서 아래와 같이 if문 사용함
				System.out.println("multiFileList.size() : "+multiFileList.size());
				// 파일이 1개일경우
				fileList0 = fileList.get(0).get("mixFile");
				// 파일이 2개일경우
				if (multiFileList.size() == 2) {
					fileList1 = fileList.get(1).get("mixFile");
				}
				// 파일이 3개일경우
				if (multiFileList.size() == 3) {
					fileList1 = fileList.get(1).get("mixFile");
					fileList2 = fileList.get(2).get("mixFile");
				}
		}
		// 파일 업로드 끝
		
		
		
		
		
		
		
		
//		UUID uuid = UUID.randomUUID();
//		String filename = uuid.toString()+"_"+fileName.getOriginalFilename();
//		FileCopyUtils.copy(fileName.getBytes(), new File(uploadPath, filename));
		
		
		
		CustomerserviceDTO dto =  new CustomerserviceDTO();
		dto.setMemNname(request.getParameter("memNname"));
		dto.setMemId(request.getParameter("memId"));
		dto.setCsCategory(request.getParameter("csCategory"));
		dto.setCsProcess(request.getParameter("csProcess"));
		dto.setCsSub(request.getParameter("csSub"));
		dto.setCsFile0(fileList0);
		dto.setCsFile1(fileList1);
		dto.setCsFile2(fileList2);
		dto.setCsContent(request.getParameter("csContent"));
		
		String cs_secret = request.getParameter("csSecret");
		if (cs_secret == null) {
			cs_secret = "N";
		}
		dto.setCsSecret(cs_secret);
//		
//		
		customerservice.insertBoard(dto);
		
		
		return "redirect:/customerservice/list";
	}//
	
	@RequestMapping(value = "/customerservice/list", method = RequestMethod.GET)	
	public String list(Model model, HttpServletRequest request) {
		String searchText = request.getParameter("searchText");
		
		int pageSize=12;
		// 현 페이지 번호 파라미터값 가져오기
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum==null){
		 	pageNum="1";
		}
		// pageNum => 정수형 currentPage
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		Cs_PageDTO dto=new Cs_PageDTO();
		// set 메서드 호출
		dto.setPageSize(pageSize);
		dto.setPageNum(pageNum);
		dto.setCurrentPage(currentPage);
		dto.setSearchText(searchText);
		
		List<CustomerserviceDTO> boardList=customerservice.getBoardList(dto);
		
		int count=customerservice.getBoardCount(searchText);
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }

		
		
		dto.setCount(count);
		dto.setPageBlock(pageBlock);
		dto.setStartPage(startPage);
		dto.setEndPage(endPage);
		dto.setPageCount(pageCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageDto", dto);
		
		return "customerservice/list";
	}//

	
	@RequestMapping(value = "/customerservice/content", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model, Cs_commentDTO cs_dto, HttpSession session) {
		int num = Integer.parseInt(request.getParameter("num"));
		// 돈터치
		CustomerserviceDTO dto = customerservice.getBoard(num);
		customerservice.updateReadcount(num);	
		model.addAttribute("dto", dto);
		// 돈터치 끝
		
		
		
		
		
		int cs_com_num1 = 0;
		if (request.getParameter("csComNum1") != null) {
			cs_com_num1 = Integer.parseInt(request.getParameter("csComNum1"));
		}
		
		
		Integer CsComMaxNum = customerservice.getCsComMaxNum(cs_dto);

		
		int pageSize=10;
		
		// 나중에 처리할것!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		String pageNum=request.getParameter("pageNum");
		// 페이지 번호가 없으면 => "1" 설정
		if(pageNum==null){
		 	pageNum="1";
		}
		// pageNum => 정수형 currentPage
		int currentPage=Integer.parseInt(pageNum);
		// PageDTO 객체생성
		Cs_PageDTO dto2=new Cs_PageDTO();
		// set 메서드 호출
		dto2.setCsNum(num);
		dto2.setPageSize(pageSize);
		dto2.setPageNum(pageNum);
		dto2.setCurrentPage(currentPage);
		List<Cs_commentDTO> cs_comList=customerservice.getCsComList(dto2);

		
		int count=customerservice.getComBoardCount(num);
		int pageBlock=10; 
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount = count/pageSize+(count%pageSize==0 ? 0 : 1);
		if(endPage > pageCount){
	 	   endPage=pageCount;
	    }
		dto2.setCount(count);
		dto2.setPageBlock(pageBlock);
		dto2.setStartPage(startPage);
		dto2.setEndPage(endPage);
		dto2.setPageCount(pageCount);


		
		model.addAttribute("cs_comList", cs_comList);
		
		
		// 젤밑에 댓글작성할때 cs_com_num1 숫자 hidden 으로 설정해줌
		model.addAttribute("csComNum1", CsComMaxNum);
		
		
		model.addAttribute("pageDto", dto2);
		
		return "customerservice/content";
	}

	
	
	
//	댓글작성할때
	
	@RequestMapping(value = "/customerservice/cs_comwritepro", method = RequestMethod.POST)
	public String cs_comwritepro(@RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest request, Model model, HttpSession session) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		
		
		
		// 파일 업로드 시작
		
		// 첨부파일 있고 없고를 비교해주는 것 isnotnull
		String isnotnull = "";
		for(int i = 0; i < multiFileList.size(); i++) {
			isnotnull = multiFileList.get(i).getOriginalFilename();
		}
		
		String fileList0 = "";
		String fileList1 = "";
		String fileList2 = "";
		
		// isnotnull 이 비어있지 않을 때
		if (!isnotnull.isEmpty()) {
			
			// 받아온것 출력 확인
//					System.out.println("multiFileList : " + multiFileList);

			// path 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources");
			String root = path + "\\" + "customerservice" + "\\" + "img";
			File fileCheck = new File(root);
			if(!fileCheck.exists()) fileCheck.mkdirs();
			
			
			List<Map<String, String>> fileList = new ArrayList<>();


			
			for(int i = 0; i < multiFileList.size(); i++) {
				String originFile = multiFileList.get(i).getOriginalFilename();
				String ext = originFile.substring(originFile.lastIndexOf("."));
				String changeFile = UUID.randomUUID().toString() + ext;
				String mixFile = UUID.randomUUID().toString()+"高"+ originFile;
//						String changeFile = UUID.randomUUID().toString()+"_"+ originFile+ext;
					
					
				Map<String, String> map = new HashMap<>();
				map.put("originFile", originFile);
				map.put("changeFile", changeFile);
				map.put("mixFile", mixFile);
				fileList.add(map);
				}

				System.out.println(fileList);
				
				try {
					for(int i = 0; i < multiFileList.size(); i++) {
//								File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
//								multiFileList.get(i).transferTo(uploadFile);
						// spring에 저장
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath1, fileList.get(i).get("mixFile")));
						// 새로고침안하고 바로보이게 하기위해서 하나더 추가함 즉 두 군데 저장함
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath2, fileList.get(i).get("mixFile")));
					}
					
					System.out.println("다중 파일 업로드 성공!");
					
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패 ㅠㅠ");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					
					e.printStackTrace();
				}
				
				// 위에서 파일이 없을경우 처음부터 if문이 동작하지않으므로(즉 파일 하나라도 넣었다는 뜻) fileList0는 if문을 쓸필요없다
				// 파일이 1개인지 2개인지 판별을위해서 아래와 같이 if문 사용함
				System.out.println("multiFileList.size() : "+multiFileList.size());
				// 파일이 1개일경우
				fileList0 = fileList.get(0).get("mixFile");
				// 파일이 2개일경우
				if (multiFileList.size() == 2) {
					fileList1 = fileList.get(1).get("mixFile");
				}
				// 파일이 3개일경우
				if (multiFileList.size() == 3) {
					fileList1 = fileList.get(1).get("mixFile");
					fileList2 = fileList.get(2).get("mixFile");
				}
		}
				// 파일 업로드 끝
		
		
		
		
		
		
		Cs_commentDTO cs_dto = new Cs_commentDTO();
		cs_dto.setCsNum(num);
		cs_dto.setCsComNum1(Integer.parseInt(request.getParameter("csComNum1")));
		cs_dto.setCsComNum2((Integer)0);
		cs_dto.setMemId((String)session.getAttribute("memId"));
		cs_dto.setMemNname((String)session.getAttribute("memNname"));
		cs_dto.setCsComContent(request.getParameter("csComContent"));
		cs_dto.setCsComFile0(fileList0);
		cs_dto.setCsComFile1(fileList1);
		cs_dto.setCsComFile2(fileList2);
		customerservice.insertCom(cs_dto);
		
		
		model.addAttribute("num", num);
		
		
		
		return "redirect:/customerservice/content";
	}
	
	
	@RequestMapping(value = "/customerservice/cs_comdelete", method = RequestMethod.GET)
	public String cs_comdelete(HttpServletRequest request,  Model model) {
		int csComNum1 = Integer.parseInt(request.getParameter("csComNum1"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		Cs_commentDTO cs_dto = new Cs_commentDTO();
		cs_dto.setCsComNum1(csComNum1);
		cs_dto.setCsNum(num);
		
		
		
		customerservice.cs_comdelete(cs_dto);
		
		
		
		model.addAttribute("num", num);
		return "redirect:/customerservice/content";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
//	대댓글작성할때사용할것 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	
	@RequestMapping(value = "/customerservice/CsComComwritepro", method = RequestMethod.POST)
	public String CsComComwritepro(@RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest request, Model model, HttpSession session) throws Exception {
		int num = Integer.parseInt(request.getParameter("num"));
		int cs_com_num1 = Integer.parseInt(request.getParameter("csComNum1"));
//		int cs_com_num2 = Integer.parseInt(request.getParameter("cs_com_num2"));
		
		
		
		
// 파일 업로드 시작

		// 첨부파일 있고 없고를 비교해주는 것 isnotnull
		String isnotnull = "";
		for(int i = 0; i < multiFileList.size(); i++) {
			isnotnull = multiFileList.get(i).getOriginalFilename();
		}
		
		String fileList0 = "";
		String fileList1 = "";
		String fileList2 = "";
		
		
		// isnotnull 이 비어있지 않을 때
		if (!isnotnull.isEmpty()) {
			
			// 받아온것 출력 확인
//					System.out.println("multiFileList : " + multiFileList);

			// path 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources");
			String root = path + "\\" + "customerservice" + "\\" + "img";
			File fileCheck = new File(root);
			if(!fileCheck.exists()) fileCheck.mkdirs();
			
			
			
			List<Map<String, String>> fileList = new ArrayList<>();
			


			
			for(int i = 0; i < multiFileList.size(); i++) {
				String originFile = multiFileList.get(i).getOriginalFilename();
				String ext = originFile.substring(originFile.lastIndexOf("."));
				String changeFile = UUID.randomUUID().toString() + ext;
				String mixFile = UUID.randomUUID().toString()+"高"+ originFile;
//						String changeFile = UUID.randomUUID().toString()+"_"+ originFile+ext;
					
					
				Map<String, String> map = new HashMap<>();
				map.put("originFile", originFile);
				map.put("changeFile", changeFile);
				map.put("mixFile", mixFile);
				fileList.add(map);
				}

				
				
				
				System.out.println(fileList);
				
				try {
					for(int i = 0; i < multiFileList.size(); i++) {
//								File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
//								multiFileList.get(i).transferTo(uploadFile);
						// spring에 저장
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath1, fileList.get(i).get("mixFile")));
						// 새로고침안하고 바로보이게 하기위해서 하나더 추가함 즉 두 군데 저장함
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath2, fileList.get(i).get("mixFile")));
					}
					
					System.out.println("다중 파일 업로드 성공!");
					
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패 ㅠㅠ");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					
					e.printStackTrace();
				}
				

				// 위에서 파일이 없을경우 처음부터 if문이 동작하지않으므로(즉 파일 하나라도 넣었다는 뜻) fileList0는 if문을 쓸필요없다
				// 파일이 1개인지 2개인지 판별을위해서 아래와 같이 if문 사용함
				System.out.println("multiFileList.size() : "+multiFileList.size());
				// 파일이 1개일경우
				fileList0 = fileList.get(0).get("mixFile");
				// 파일이 2개일경우
				if (multiFileList.size() == 2) {
					fileList1 = fileList.get(1).get("mixFile");
				}
				// 파일이 3개일경우
				if (multiFileList.size() == 3) {
					fileList1 = fileList.get(1).get("mixFile");
					fileList2 = fileList.get(2).get("mixFile");
				}
		}
		// 파일 업로드 끝		
		
		
		
		
		Cs_commentDTO cs_dto = new Cs_commentDTO();
		cs_dto.setCsNum(num);
		cs_dto.setCsComNum1(cs_com_num1);
		cs_dto.setMemId((String)session.getAttribute("memId"));
		cs_dto.setMemNname((String)session.getAttribute("memNname"));
		cs_dto.setCsComContent(request.getParameter("csComContent"));
		cs_dto.setCsComFile0(fileList0);
		cs_dto.setCsComFile1(fileList1);
		cs_dto.setCsComFile2(fileList2);
		
//		System.out.println(cs_dto.getCsComFile0());
//		System.out.println(cs_dto.getCsComFile1());
//		System.out.println(cs_dto.getCsComFile2());
//		System.out.println(cs_dto.getCsNum());
		
		
		customerservice.getCsComComMaxNum(cs_dto);
		customerservice.insertComCom(cs_dto);
		
		
		model.addAttribute("num", num);
//		model.addAttribute("cs_com_num1", cs_com_num1);  //??
		
		return "redirect:/customerservice/content";
	}
	
	@RequestMapping(value = "/customerservice/CsComCommdelete", method = RequestMethod.GET)
	public String CsComCommdelete(HttpServletRequest request,  Model model) {
		int cs_com_num2 = Integer.parseInt(request.getParameter("csComNum2"));
		int cs_com_num1 = Integer.parseInt(request.getParameter("csComNum1"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		Cs_commentDTO cs_dto = new Cs_commentDTO();
		cs_dto.setCsComNum2(cs_com_num2);
		cs_dto.setCsComNum1(cs_com_num1);
		cs_dto.setCsNum(num);
		
		
		
		customerservice.CsComCommdelete(cs_dto);
		
		
		
		model.addAttribute("num", num);
		return "redirect:/customerservice/content";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/customerservice/update", method = RequestMethod.GET)
	public String UpdateForm(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		CustomerserviceDTO dto = customerservice.getBoard(num);
		model.addAttribute("dto", dto);
		return "customerservice/updateForm";
	}
	
	@RequestMapping(value = "/customerservice/UpdatePro", method = RequestMethod.POST)
	public String UpdatePro(@RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest request, Model model) throws Exception {

		
		// 파일 업로드 시작
		
		// 첨부파일 있고 없고를 비교해주는 것 isnotnull
		String isnotnull = "";
		for(int i = 0; i < multiFileList.size(); i++) {
			isnotnull = multiFileList.get(i).getOriginalFilename();
		}
		
		
		String fileList0 = "";
		String fileList1 = "";
		String fileList2 = "";
		if (multiFileList.size() == 1) {
			fileList0 = request.getParameter("csFile0");
		}
		if (multiFileList.size() == 2) {
			fileList0 = request.getParameter("csFile0");
			fileList1 = request.getParameter("csFile1");
		}
		if (multiFileList.size() == 3) {
			fileList0 = request.getParameter("csFile0");
			fileList1 = request.getParameter("csFile1");
			fileList2 = request.getParameter("csFile2");
		}
		
		
		// isnotnull 이 비어있지 않을 때
		if (!isnotnull.isEmpty()) {
			
			// 받아온것 출력 확인
//			System.out.println("multiFileList : " + multiFileList);

			// path 가져오기
			String path = request.getSession().getServletContext().getRealPath("resources");
			String root = path + "\\" + "customerservice" + "\\" + "img";
			File fileCheck = new File(root);
			if(!fileCheck.exists()) fileCheck.mkdirs();
			
			
			
			List<Map<String, String>> fileList = new ArrayList<>();
			


			
			for(int i = 0; i < multiFileList.size(); i++) {
				String originFile = multiFileList.get(i).getOriginalFilename();
				String ext = originFile.substring(originFile.lastIndexOf("."));
				String changeFile = UUID.randomUUID().toString() + ext;
				String mixFile = UUID.randomUUID().toString()+"高"+ originFile;
//				String changeFile = UUID.randomUUID().toString()+"_"+ originFile+ext;
					
					
				Map<String, String> map = new HashMap<>();
				map.put("originFile", originFile);
				map.put("changeFile", changeFile);
				map.put("mixFile", mixFile);
				fileList.add(map);
				}

				
				
				
				System.out.println(fileList);
				
				try {
					for(int i = 0; i < multiFileList.size(); i++) {
//						File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
//						multiFileList.get(i).transferTo(uploadFile);
						// spring에 저장
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath1, fileList.get(i).get("mixFile")));
						// 새로고침안하고 바로보이게 하기위해서 하나더 추가함 즉 두 군데 저장함
						FileCopyUtils.copy(multiFileList.get(i).getBytes(), new File(uploadPath2, fileList.get(i).get("mixFile")));
					}
					
					System.out.println("다중 파일 업로드 성공!");
					
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패 ㅠㅠ");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					
					e.printStackTrace();
				}
				

				// 위에서 파일이 없을경우 처음부터 if문이 동작하지않으므로(즉 파일 하나라도 넣었다는 뜻) fileList0는 if문을 쓸필요없다
				// 파일이 1개인지 2개인지 판별을위해서 아래와 같이 if문 사용함
				System.out.println("multiFileList.size() : "+multiFileList.size());
				// 파일이 1개일경우
				fileList0 = fileList.get(0).get("mixFile");
				// 파일이 2개일경우
				if (multiFileList.size() == 2) {
					fileList1 = fileList.get(1).get("mixFile");
				}
				// 파일이 3개일경우
				if (multiFileList.size() == 3) {
					fileList1 = fileList.get(1).get("mixFile");
					fileList2 = fileList.get(2).get("mixFile");
				}
		}
		// 파일 업로드 끝
		
		
		
		
		CustomerserviceDTO dto =  new CustomerserviceDTO();
		dto.setCsNum(Integer.parseInt(request.getParameter("csNum")));
		dto.setMemNname(request.getParameter("memNname"));
		dto.setMemId(request.getParameter("memId"));
		dto.setCsCategory(request.getParameter("csCategory"));
		dto.setCsProcess(request.getParameter("csProcess"));
		dto.setCsSub(request.getParameter("csSub"));
		dto.setCsFile0(fileList0);
		dto.setCsFile1(fileList1);
		dto.setCsFile2(fileList2);
		dto.setCsContent(request.getParameter("csContent"));
		
		String cs_secret = request.getParameter("csSecret");
		if (cs_secret == null) {
			cs_secret = "N";
		}
		dto.setCsSecret(cs_secret);
		
		System.out.println(dto.toString());
		customerservice.boardUpdatePro(dto);
//		model.addAttribute("dto", dto);
		
		model.addAttribute("num", dto.getCsNum());
		return "redirect:/customerservice/content";
	}
	
	
	
	
	
	
	
	
	
	
	
// 파일 다운로드 시작 ----------------------------------------------------------------------------------------------------------

// 브라우저 종류에 따른 인코딩 때문에 이렇게 처리함
	public String getFileNm(String browser, String fileNm){
		String reFileNm = null;
		try {
			if (browser.equals("MSIE") ||
				browser.equals("Trident") ||
				browser.equals("Edge")) {
				reFileNm = URLEncoder.encode(fileNm, "UTF-8").replaceAll("\\+", "%20");
			} else {
				if(browser.equals("Chrome")){
					StringBuffer sb = new StringBuffer();
					for (int i = 0; i < fileNm.length(); i++) {
						char c = fileNm.charAt(i);
						if (c > '~') {
							sb.append(URLEncoder.encode(Character.toString(c), "UTF-8"));
						} else {
							sb.append(c);
						}
					} reFileNm = sb.toString();
				} else{
					reFileNm = new String(fileNm.getBytes("UTF-8"), "ISO-8859-1");
				}
				if(browser.equals("Safari") || browser.equals("Firefox"))
					reFileNm = URLDecoder.decode(reFileNm);
			}
		} catch(Exception e){}
		return reFileNm;
	}
	
// 브라우저 종류에 따른 인코딩 때문에 이렇게 처리함
	public String getBrowser(HttpServletRequest req) {
		String userAgent = req.getHeader("User-Agent");
		if(userAgent.indexOf("MSIE") > -1
			|| userAgent.indexOf("Trident") > -1 //IE11
			|| userAgent.indexOf("Edge") > -1) {
			return "MSIE";
		} else if(userAgent.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if(userAgent.indexOf("Opera") > -1) {
			return "Opera";
		} else if(userAgent.indexOf("Safari") > -1) {
			return "Safari";
		} else if(userAgent.indexOf("Firefox") > -1){
			return "Firefox";
		} else{
			return null;
		}
	}
	
	
	

	@RequestMapping(value = "/customerservice/fileDown", method = RequestMethod.GET)
	public void fileDown(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
		String filename = request.getParameter("filename");
//		System.out.println("이거 경로 어떻게 됨??"+uploadPath+"\\"+filename);
		System.out.println(filename);
		  try {
	        	String path = uploadPath2+"\\"+filename; // 경로에 접근할 때 역슬래시('\') 사용
	        	String browser = getBrowser(request);
	        	// 파일저장 이름
	        	
	        	System.out.println(filename);
	        	String path1[] = path.split("高");
	        	System.out.println(path1[1]);
	        	File file = new File(path1[1]);
	        	
	        	response.setHeader("Content-Description", "file download");
	        	response.setHeader("Content-Disposition", "attachment;filename=\"".concat(getFileNm(browser, file.getName()))); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
	        	response.setHeader("Content-Transfer-Encoding", "binary");
	        	
	        	
//	        	long fileLength = file.length();
//	        	response.setHeader("Content-Transfer-Encoding", "binary");
//	        	response.setHeader("Content-Length", "" + fileLength);
//	        	response.setHeader("Pragma", "no-cache;");
//	        	response.setHeader("Expires", "-1;");
//	        	response.setCharacterEncoding("UTF-8");
//	        	response.setContentType("text/html; charset=utf-8");
//	        	response.setHeader("Content-Disposition", "attachment;filename=" +  URLEncoder.encode("한글되나요?", "encodeName")); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
	        	// 파일저장 이름 끝
	        	
	        	
	        	FileInputStream fileInputStream = new FileInputStream(path); // 파일 읽어오기 
	        	OutputStream out = response.getOutputStream();
	        	
	        	int read = 0;
	                byte[] buffer = new byte[1024];
	                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
	                    out.write(buffer, 0, read);
	                }
	                
	        } catch (Exception e) {
	            throw new Exception("download error");
	        }
		  
	}
	
// 파일 다운로드 끝 ----------------------------------------------------------------------------------------------------------
	
	
	
	
	@RequestMapping(value = "/customerservice/delete", method = RequestMethod.GET)
	public String Delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		customerservice.Delete(num);
		
		return "redirect:/customerservice/list";
	}
	
	
	
}//
