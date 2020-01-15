package com.kh.mohagee.travelBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.travelBoard.exception.TravelBoardException;
import com.kh.mohagee.travelBoard.model.dao.TravelBoardDAO;
import com.kh.mohagee.travelBoard.model.vo.TravelAttachment;
import com.kh.mohagee.travelBoard.model.vo.TravelBoard;

@Service
public class TravelBoardService {

   @Autowired
   TravelBoardDAO travelBoardDAO;

   public List<TravelBoard> selectList() {
      return travelBoardDAO.selectList();
   }

   public int selectTotalContents() {
      return travelBoardDAO.selectTotalContents();
   }

   public int insertTravelBoard(TravelBoard travelBoard, List<TravelAttachment> list) {
      
        int result = 0;
        
        // 1. 게시글 추가 
        
        result = travelBoardDAO.insertTravelBoard(travelBoard); 
        
        if(result < 1) {
           
           throw new TravelBoardException("게시글 추가 중 에러 발생!");
        }
        
        
        // 2. 추가된 게시글의 번호를 가져와 // 첨부파일 추가하기 
        if(list.size() > 0) { 
           int idx = 0;
           for(TravelAttachment a : list) { 
              if(idx == 0) a.setbFileLevel(0);
              result = travelBoardDAO.insertTravelAttachment(a);
        
        System.out.println("result 확인 : " + result); // 확인용 result 값 변경하기 // 
              idx++;
        // result =0; 
        
        if(result < 1) 
           throw new TravelBoardException("첨부파일 추가 중 에러 발생!"); 
        } 
    }
       
      return result;
   }

   public TravelBoard selectOne(int bNo) {
      return travelBoardDAO.selectOne(bNo);
   }

   public List<TravelAttachment> selectAttachment(int bNo) {
      return travelBoardDAO.selectTravelAttachment(bNo);
   }

   public int updateBoard(TravelBoard travelBoard, List<TravelAttachment> list) {
		int result = 0;
		System.out.println("bNo : " + travelBoard.getbNo());
		List<TravelAttachment> originList
		   = travelBoardDAO.selectTravelAttachment(travelBoard.getbNo());
		
		result = travelBoardDAO.updateTravelBoard(travelBoard);
		
		if(result > 0) {
			if(originList.size() > 0 && list.size() > 0) {
				result = travelBoardDAO.deleteTravelAttachment(travelBoard.getbNo());
				
				for(TravelAttachment a : list) {
					result = travelBoardDAO.updateTravelAttachment(a);
					
				}
			} else if ( list.size() > 0) {
				for(TravelAttachment a : list) {
					result = travelBoardDAO.updateTravelAttachment(a);
					
				}
			}
		}
		
		return result;
	}

	public int deleteTravelBoard(int bNo) {
		
		return travelBoardDAO.deleteTravelBoard(bNo);
	}
	
}