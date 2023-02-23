package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private Map<String, String> param = new HashMap<String, String>();
	
	private static final String namespace = "com.itwillbs.mappers.productMapper";

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
		System.out.println("전달!");
		Map<String, Object> map = sqlSession.selectOne(namespace+".productInfo", param);
		System.out.println((String)map.get(productNum)+" 들고나왔따!");
		return map;
	}

	@Override
	public List<Map<String, Object>> getSellerProduct(Map<String, Object> productMap) {
		System.out.println((String)productMap.get("productNum")+" : 주문번호 DAO");
		param.put("productNum", (String)productMap.get("productNum"));
		param.put("productSeller", (String)productMap.get("productSeller"));
		return sqlSession.selectList(namespace + ".productInfo", param);
	}
}
