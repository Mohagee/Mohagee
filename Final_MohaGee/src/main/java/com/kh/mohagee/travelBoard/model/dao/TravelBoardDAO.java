package com.kh.mohagee.travelBoard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mohagee.travelBoard.model.vo.TravelAttachment;
import com.kh.mohagee.travelBoard.model.vo.TravelBoard;

@Repository
public class TravelBoardDAO {
   
   @Autowired
   SqlSessionTemplate sqlSession;
   
   
   public List<TravelBoard> selectList() {
   // "매퍼의 실행할 SQL 명", 파라미터로 받을 값, RowBounds 전용 공간 
      return sqlSession.selectList("TravelBoard-mapper.selectList");
   }

   public int selectTotalContents() {
      return sqlSession.selectOne("TravelBoard-mapper.selectTotalContents");
   }
   
   public int insertTravelBoard(TravelBoard travelBoard) {
      
      return sqlSession.insert("TravelBoard-mapper.insertTravelBoard", travelBoard);
   }
   
   public int insertTravelAttachment(TravelAttachment a) {
      return sqlSession.insert("TravelBoard-mapper.insertTravelAttachment", a);
   }

   public TravelBoard selectOneTravelBoard(int bNo) {
      return sqlSession.selectOne("TravelBoard-mapper.selectTravelBoard", bNo);
   }

   public List<TravelAttachment> selectTravelAttachment(int bNo) {
      return sqlSession.selectList("TravelBoard-mapper.selectTravelAttachment", bNo);
   }

   public int updateTravelBoard(TravelBoard originBoard) {
      
      return sqlSession.update("TravelBoard-mapper.updateTravelBoard", originBoard);
   }
   
   public int updateTravelAttachment(TravelAttachment a) {
      return sqlSession.insert("TravelBoard-mapper.updateTravelAttachment", a);
   }

   public int deleteTravelBoard(int bNo) {
      return sqlSession.delete("TravelBoard-mapper.deleteTravelBoard", bNo);
   }

   public int deleteTravelAttachment(int bNo) {
      return sqlSession.delete("TravelBoard-mapper.deleteTravelAttachment", bNo);
   }
}