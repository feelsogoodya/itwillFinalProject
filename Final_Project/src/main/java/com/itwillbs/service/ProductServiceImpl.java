package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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
	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		// name,subject,content
		// num,readcount,date
		// num = max(num) + 1 
		if(productDAO.getMaxNum()==null) {
//					//글이 없는 경우
			productDTO.setProductNum(1);
		}else {
//					//글이 있는 경우
			productDTO.setProductNum(productDAO.getMaxNum()+1);
		}
		
		productDTO.setProductReadcount(0);
		productDTO.setProductDate(new Timestamp(System.currentTimeMillis()));
		//메서드 호출
		productDAO.insertProduct(productDTO);
		
	}
	
	@Override
	public void updateProduct(ProductDTO productDTO) {
		productDAO.updateProduct(productDTO);
		
	}
	
	@Override
	public ProductDTO getProduct(int num) {
		return productDAO.getProduct(num);
	}

	@Override
	public void deleteProduct(int num) {
		productDAO.deleteProduct(num);
	}



	@Override
	public List<Map<String, Object>> getProductList(Map<String, String> params) {
		
		return productDAO.getProductList(params);
	}
	
	@Override
	public void addwish(String memId, String productNum) {
		productDAO.addwish(memId, productNum);
	}
	
	@Override
	public void removewish(String memId, String productNum) {
		productDAO.removewish(memId, productNum);
	}
	
	@Override
	public List<Map<String, Object>> getproductCateList() {
		
		return productDAO.getproductCateList();
	}
	
	@Override
	public int getproductMax(Map<String, String> params) {
		return productDAO.getproductMax(params);
	}
}
