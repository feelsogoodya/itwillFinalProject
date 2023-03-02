package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WishDAO;

@Service
public class WishServiceImpl implements WishService{
	
	@Inject
	private WishDAO wishDAO;

	@Override
	public List<Map<String, Object>> getWishList() {
		// TODO Auto-generated method stub
		return null;
	}

}
