package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.ProductDTO;

public interface ProductDAO {
	
	public List<ProductDTO> getPrdFromTheLatest();
	
	public List<ProductDTO> getPrdTopViews();
<<<<<<< HEAD
=======
	
	public List<ProductDTO> getPrdTopWishList();
	
	public ProductDTO getProductInfo(String productNum);
>>>>>>> 4d06fe1e7b851275c4cdb6e3c5f082d47f7ec6df
}
