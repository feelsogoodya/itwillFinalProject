package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

public interface ProductService {
	
	//-----------------도연
	public List<String> getCategories();
	
	public List<ProductDTO> getPrdFromTheLatest();
	
	public List<ProductDTO> getPrdTopViews();
	
	public List<ProductDTO> getPrdTopWishList();
	
	public Map<String, Object> getProductInfo(String productNum);
	
	public List<Map<String, Object>> getSellerProduct(Map<String, Object> productMap);
	
	//-----------------성일
	
	public void insertProduct(ProductDTO productDTO);
	
	public void updateProduct(ProductDTO productDTO);
	
	public ProductDTO getProduct(int num);
	
	public void deleteProduct(int num);
	

	
	//-----------------보정
	
	public List<Map<String, Object>> getProductList(Map<String, String> params);
	
	public void addwish(String memId, String productNum);
	
	public void removewish(String memId, String productNum);
	
	public List<Map<String, Object>> getproductCateList();
	
	public int getproductMax(Map<String, String> params);
}
