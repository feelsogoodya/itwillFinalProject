package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;
import com.itwillbs.domain.SellListDTO;

public interface ProductDAO {
	
	public List<ProductDTO> getPrdFromTheLatest();
	
	public List<ProductDTO> getPrdTopViews();
	
	public List<ProductDTO> getPrdTopWishList();
	
	public ProductDTO getProductInfo(String productNum);
	
	public List<ProductDTO> getSellerProduct(String productSeller);
	
	public List<ProductDTO> getSellList(PageDTO pageDTO);

	public int getSellCount();


}
