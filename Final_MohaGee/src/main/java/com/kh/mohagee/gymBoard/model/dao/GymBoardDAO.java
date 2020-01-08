package com.kh.mohagee.gymBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.gymBoard.model.vo.GymBoard;
import com.kh.mohagee.gymBoard.model.vo.GymAttachment;

@Repository
public class GymBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	public List<Map<String, String>> selectList() {
	// "매퍼의 실행할 SQL 명", 파라미터로 받을 값, RowBounds 전용 공간 
		return sqlSession.selectList("GymBoard-mapper.selectList");
	}

	public int selectTotalContents() {
		return sqlSession.selectOne("GymBoard-mapper.selectTotalContents");
	}
	
	public int insertGymBoard(GymBoard board) {
		
		return sqlSession.insert("GymBoard-mapper.insertBoard", board);
	}
	
	public int insertGymAttachment(GymAttachment a) {
		return sqlSession.insert("GymBoard-mapper.insertAttachment", a);
	}

	public GymBoard selectOneGymBoard(int boardNo) {
		return sqlSession.selectOne("GymBoard-mapper.selectGymBoard", boardNo);
	}

	public List<GymAttachment> selectGymAttachment(int boardNo) {
		return sqlSession.selectList("GymBoard-mapper.selectGymAttachment", boardNo);
	}

	public int updateGymBoard(GymBoard originBoard) {
		
		return sqlSession.update("GymBoard-mapper.updateGymBoard", originBoard);
	}
	
	public int updateGymAttachment(GymAttachment a) {
		return sqlSession.insert("GymBoard-mapper.updateGymAttachment", a);
	}

	public int deleteGymBoard(int boardNo) {
		return sqlSession.delete("GymBoard-mapper.deleteGymBoard", boardNo);
	}

	public int deleteGymAttachment(int boardNo) {
		return sqlSession.delete("GymBoard-mapper.deleteGymAttachment", boardNo);
	}


	
	
}
















