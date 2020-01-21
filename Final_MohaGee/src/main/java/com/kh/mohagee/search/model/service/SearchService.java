package com.kh.mohagee.search.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.member.model.vo.FavoriteBoard;
import com.kh.mohagee.search.model.dao.SearchDAO;

@Service
public class SearchService {
	
	@Autowired
	SearchDAO searchDao;

	public List<FavoriteBoard> indexSearch(String indexSearch) {
		return searchDao.indexSearch(indexSearch);
	}
	
}
