package com.kh.mohagee.search.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.member.model.vo.FavoriteBoard;

@Repository
public class SearchDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<FavoriteBoard> indexSearch(String indexSearch) {
		return sqlSession.selectList("search-mapper.indexSearch", indexSearch);
	}
}
