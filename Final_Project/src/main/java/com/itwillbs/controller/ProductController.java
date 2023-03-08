package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProductDTO;
import com.itwillbs.service.ProductService;

@Controller
public class ProductController {
	
	@Inject
	ProductService productService;
	
//	xml 업로드 경로 (자원이름)=> 변수저장
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/product/details", method = RequestMethod.GET)
	public String productDetails(Model model) {
		//TODO 추후 연결 시, 수정
		//선택한 상품의 정보 가져오기
//		HttpServletRequest request, String productNum = request.getParameter("productNum");
		String productNum = "2302004";
		Map<String, Object> productMap = productService.getProductInfo(productNum);
		
		
		//판매자 다른 상품 정보 가져오기
		List<Map<String, Object>> sellerProducts = productService.getSellerProduct(productMap);
		
		
		model.addAttribute("productMap", productMap);
		model.addAttribute("sellerProducts", sellerProducts);
		
		return "product/details";
	}
	
	@RequestMapping(value = "/product/insertForm", method = RequestMethod.GET)	
	public String insertForm(Model model) {
		// 기본 이동방식 : 주소변경 없이 이동 
		List<String> categories = productService.getCategories();
		model.addAttribute("categories", categories);
		return "product/insertForm";
	}//

	
	@RequestMapping(value = "/product/insertPro", method = RequestMethod.POST)	
	public String insertPro(HttpServletRequest request,
							HttpSession session,
							MultipartFile file, 
							MultipartFile file1, 
							MultipartFile file2, 
							MultipartFile file3, 
							MultipartFile file4, 
							MultipartFile file5) throws Exception {
		
		System.out.println("ProductController insertPro() ");
		
		MultipartFile[] files = {file, file1, file2, file3, file4, file5};
		String resultFilename = "";
		for(MultipartFile f : files) {
			
			if(!f.getOriginalFilename().equals("")) {
				UUID uuid =UUID.randomUUID();
				String filename=uuid.toString()+"_"+f.getOriginalFilename();
				FileCopyUtils.copy(f.getBytes(), new File(uploadPath, filename));
				resultFilename += (filename + "|");
			}
		}
		resultFilename = resultFilename.substring(0, resultFilename.length() - 1);
		System.out.println(resultFilename);
		
//		String filename=uuid.toString()+"_"+file.getOriginalFilename();
		
		//원본 파일복사 =>upload 복사
//		FileCopyUtils.copy(원본, 복사해서 새롭게 파일 만드릭);
//		FileCopyUtils.copy(file.getBytes(), new File(경로, 파일이름));
		
//		FileCopyUtils.copy(file.getBytes(), new File(uploadPath, filename));
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductPic(resultFilename);
		productDTO.setProductSeller((String)session.getAttribute("memId"));
		productDTO.setProductTitle(request.getParameter("productTitle"));
		productDTO.setProductCate(request.getParameter("productCate"));
		productDTO.setProductContent(request.getParameter("productContent"));
		productDTO.setProductGrade(request.getParameter("productGrade"));
//		productDTO.setProductLoca(request.getParameter("productLoca"));
		productDTO.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		System.out.println(resultFilename);
		productService.insertProduct(productDTO);
		
		
		// 이동방식 : 주소변경 하면서 이동 
		// response.sendRedirect() 이동
		return "redirect:/notice/list";
	}//
	
	@RequestMapping(value = "/product/update", method = RequestMethod.GET)	
	public String update(HttpServletRequest request,Model model) {
		int num=Integer.parseInt(request.getParameter("productNum"));
		
		ProductDTO dto=productService.getProduct(num);
		
		model.addAttribute("dto", dto);
		
		// 기본 이동방식 : 주소변경 없이 이동 
		return "product/updateForm";
	}//
	
	
	@RequestMapping(value = "/product/updatePro", method = RequestMethod.POST)	
	public String updatePro(HttpServletRequest request,
							HttpSession session,
							MultipartFile file, 
							MultipartFile file1, 
							MultipartFile file2, 
							MultipartFile file3, 
							MultipartFile file4, 
							MultipartFile file5) throws Exception {
		
		System.out.println("ProductController updatePro() ");
		
		MultipartFile[] files = {file, file1, file2, file3, file4, file5};
		String resultFilename = "";
		for(MultipartFile f : files) {
			
			if(!f.getOriginalFilename().equals("")) {
				UUID uuid =UUID.randomUUID();
				String filename=uuid.toString()+"_"+f.getOriginalFilename();
				FileCopyUtils.copy(f.getBytes(), new File(uploadPath, filename));
				resultFilename += (filename + "|");
			}
		}
		resultFilename = resultFilename.substring(0, resultFilename.length() - 1);
		System.out.println(resultFilename);
		
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(Integer.parseInt(request.getParameter("num")));
		productDTO.setProductPic(resultFilename);
		productDTO.setProductSeller((String)session.getAttribute("memId"));
		productDTO.setProductTitle(request.getParameter("productTitle"));
		productDTO.setProductCate(request.getParameter("productCate"));
		productDTO.setProductContent(request.getParameter("productContent"));
		productDTO.setProductGrade(request.getParameter("productGrade"));
//		productDTO.setProductLoca(request.getParameter("productLoca"));
		productDTO.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
		productService.updateProduct(productDTO);
		
		// 이동방식 : 주소변경 하면서 이동 
		// response.sendRedirect() 이동
		return "redirect:/list/selllist";
		
	}//
	
	@RequestMapping(value = "/product/delete", method = RequestMethod.GET)	
	public String delete(HttpServletRequest request) {
		int productNum=Integer.parseInt(request.getParameter("productNum"));
		
		productService.deleteProduct(productNum);
		
		
		return "redirect:/list/selllist";
	}//
	
}
