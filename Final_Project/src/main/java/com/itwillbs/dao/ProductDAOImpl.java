package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private Map<String, String> param = new HashMap<String, String>();
	
	private static final String namespace = "com.itwillbs.mappers.productMapper";
	
	@Override
	public List<String> getCategories() {
		return sqlSession.selectList(namespace+".getCategories");
	}
	
	@Override
	public List<ProductDTO> getPrdFromTheLatest() {
		param.put("GB", "date");
		return sqlSession.selectList(namespace+".orderProduct", param);
	}

	@Override
	public List<ProductDTO> getPrdTopViews() {
		param.put("GB", "views");
		return sqlSession.selectList(namespace+".orderProduct", param);
	}

	@Override
	public List<ProductDTO> getPrdTopWishList() {
		param.put("GB", "wish");
		return sqlSession.selectList(namespace+".orderProduct", param);
	}

	@Override
	public Map<String, Object> getProductInfo(String productNum) {
		param.put("productNum", productNum);
		param.put("productSeller", null);
		return sqlSession.selectOne(namespace+".productInfo", param);
	}

	@Override
	public List<Map<String, Object>> getSellerProduct(Map<String, Object> productMap) {
		param.put("productNum", ""+productMap.get("productNum"));
		param.put("productSeller", (String)productMap.get("productSeller"));
		return sqlSession.selectList(namespace + ".productInfo", param);
	}

	@Override
	public void insertProduct(ProductDTO productDTO) {
		sqlSession.insert(namespace+".insertProduct", productDTO);
	}
	
	@Override
	public Integer getMaxNum() {
		return sqlSession.selectOne(namespace+".getMaxNum");
	}
	
	@Override
	public List<ProductDTO> getSellList(PageDTO pageDTO) {

		return sqlSession.selectList(namespace+".getSellList", pageDTO);
	}
	
	@Override
	public int getSellCount() {
		return sqlSession.selectOne(namespace + ".getSellCount");

	}//
}
