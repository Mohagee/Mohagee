package com.kh.mohagee.showBoard.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.showBoard.model.vo.ShowAttachment;
import com.kh.mohagee.showBoard.model.vo.ShowBoard;

@Repository
public class ShowBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	public List<ShowBoard> selectList() {
	// "매퍼의 실행할 SQL 명", 파라미터로 받을 값, RowBounds 전용 공간 
		return sqlSession.selectList("ShowBoard-mapper.selectList");
	}

	public int selectTotalContents() {
		return sqlSession.selectOne("ShowBoard-mapper.selectTotalContents");
	}
	
	public int insertShowBoard(ShowBoard showBoard) {
		
		return sqlSession.insert("ShowBoard-mapper.insertShowBoard", showBoard);
	}
	
	public int insertShowAttachment(ShowAttachment a) {
		return sqlSession.insert("ShowBoard-mapper.insertShowAttachment", a);
	}

	public ShowBoard selectOneShowBoard(int bNo) {
		return sqlSession.selectOne("ShowBoard-mapper.selectShowBoard", bNo);
	}

	public List<ShowAttachment> selectShowAttachment(int bNo) {
		return sqlSession.selectList("ShowBoard-mapper.selectShowAttachment", bNo);
	}

	public int updateShowBoard(ShowBoard originBoard) {
		
		return sqlSession.update("ShowBoard-mapper.updateShowBoard", originBoard);
	}
	
	public int updateShowAttachment(ShowAttachment a) {
		return sqlSession.insert("ShowBoard-mapper.updateShowAttachment", a);
	}

	public int deleteShowBoard(int bNo) {
		return sqlSession.delete("ShowBoard-mapper.deleteShowBoard", bNo);
	}

	public int deleteShowAttachment(int bNo) {
		return sqlSession.delete("ShowBoard-mapper.deleteShowAttachment", bNo);
	}


	
	
}
