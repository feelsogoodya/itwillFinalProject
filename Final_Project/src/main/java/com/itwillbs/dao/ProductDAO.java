package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.ProductDTO;

public interface ProductDAO {
	
	public List<ProductDTO> getPrdFromTheLatest();
	
	public List<ProductDTO> getPrdTopViews();
}
