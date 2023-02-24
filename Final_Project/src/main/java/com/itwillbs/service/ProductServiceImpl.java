package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductDAO;
import com.itwillbs.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Inject
	private ProductDAO productDAO;

	@Override
	public List<String> getCategories() {
		return productDAO.getCategories();
	}
	
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
	public Map<String, Object> getProductInfo(String productNum) {
		return productDAO.getProductInfo(productNum);
	}

	@Override
	public List<Map<String, Object>> getSellerProduct(Map<String, Object> productMap) {
		return productDAO.getSellerProduct(productMap);
	}

}
