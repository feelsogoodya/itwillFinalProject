package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductDAO productDAO;

	@Override
	public List<ProductDTO> getPrdFromTheLatest() {
		return productDAO.getPrdFromTheLatest();
	}

	@Override
	public List<ProductDTO> getPrdTopViews() {
		return productDAO.getPrdTopViews();
	}

	@Override
	public List<ProductDTO> getPrdTopWishList() {
		
		return productDAO.getPrdTopWishList();
	}

	@Override
	public ProductDTO getProductInfo(String productNum) {
		System.out.println("productService");
		return productDAO.getProductInfo(productNum);
	}

	@Override
	public List<ProductDTO> getSellerProduct(String productSeller) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> getSellList(PageDTO pageDTO) {
		// startRow 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		// endRow 구하기
		int endRow=startRow+pageDTO.getPageSize()-1;
		
		// 디비 limit startRow-1 
		pageDTO.setStartRow(startRow-1);
		pageDTO.setEndRow(endRow);
		
		return productDAO.getSellList(pageDTO);
	}

	@Override
	public int getSellCount() {

		return productDAO.getSellCount();
	}
}
