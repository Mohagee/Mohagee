package com.kh.mohagee.gymBoard.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.gymBoard.model.vo.GymBoard;
import com.kh.mohagee.gymBoard.model.vo.gbComment;

@Repository
public class gbCommentDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	public int insertgbComment(gbComment gbc) {
		return sqlSession.insert("gbComment-mapper.insertgbComment", gbc);
	}

	public List<GymBoard> selectListgbComment(int bNo) {
		return sqlSession.selectList("gbComment-mapper.selectListgbComment", bNo);
	}

	public int updategbComment(gbComment gbComment) {
		return sqlSession.update("gbComment-mapper.updategbComment", gbComment);
	}

	public int deletegbComment(int bcNo) {
		return sqlSession.update("gbComment-mapper.deletegbComment", bcNo);
	}

}
