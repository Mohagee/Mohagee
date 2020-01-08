package com.kh.mohagee.travelBoard.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.travelBoard.model.vo.TravelBoard;
import com.kh.mohagee.travelBoard.model.vo.TravelAttachment;

@Repository
public class TravelBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	public List<Map<String, String>> selectList() {
	// "매퍼의 실행할 SQL 명", 파라미터로 받을 값, RowBounds 전용 공간 
		return sqlSession.selectList("TravelBoard-mapper.selectList");
	}

	public int selectTotalContents() {
		return sqlSession.selectOne("TravelBoard-mapper.selectTotalContents");
	}
	
	public int insertTravelBoard(TravelBoard board) {
		
		return sqlSession.insert("TravelBoard-mapper.insertBoard", board);
	}
	
	public int insertTravelAttachment(TravelAttachment a) {
		return sqlSession.insert("TravelBoard-mapper.insertAttachment", a);
	}

	public TravelBoard selectOneTravelBoard(int boardNo) {
		return sqlSession.selectOne("TravelBoard-mapper.selectTravelBoard", boardNo);
	}

	public List<TravelAttachment> selectTravelAttachment(int boardNo) {
		return sqlSession.selectList("TravelBoard-mapper.selectTravelAttachment", boardNo);
	}

	public int updateTravelBoard(TravelBoard originBoard) {
		
		return sqlSession.update("TravelBoard-mapper.updateTravelBoard", originBoard);
	}
	
	public int updateTravelAttachment(TravelAttachment a) {
		return sqlSession.insert("TravelBoard-mapper.updateTravelAttachment", a);
	}

	public int deleteTravelBoard(int boardNo) {
		return sqlSession.delete("TravelBoard-mapper.deleteTravelBoard", boardNo);
	}

	public int deleteTravelAttachment(int boardNo) {
		return sqlSession.delete("TravelBoard-mapper.deleteTravelAttachment", boardNo);
	}
}
