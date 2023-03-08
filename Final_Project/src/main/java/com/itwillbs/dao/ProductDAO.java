package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

public interface ProductDAO {
	
	//------------------도연
	
	public List<String> getCategories();
	
	public List<ProductDTO> getPrdFromTheLatest();
	
	public List<ProductDTO> getPrdTopViews();
	
	public List<ProductDTO> getPrdTopWishList();
	
	public Map<String, Object> getProductInfo(String productNum);
	
	public List<Map<String, Object>> getSellerProduct(Map<String, Object> productMap);
	
	//-------------------성일
	
	public void insertProduct(ProductDTO productDTO);
	
	public void updateProduct(ProductDTO productDTO);
	
	public Integer getMaxNum();
	
	public ProductDTO getProduct(int num);
	
	public void deleteProduct(int num);
	
	//-------------------도경
	
	public List<ProductDTO> getSellList(PageDTO pageDTO);
	
	public int getSellCount();
	
}
