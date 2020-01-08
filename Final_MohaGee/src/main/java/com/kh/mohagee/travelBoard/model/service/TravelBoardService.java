package com.kh.mohagee.travelBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.travelBoard.exception.TravelBoardException;
import com.kh.mohagee.travelBoard.model.dao.TravelBoardDAO;
import com.kh.mohagee.travelBoard.model.vo.TravelAttachment;
import com.kh.mohagee.travelBoard.model.vo.TravelBoard;

@Service
public class TravelBoardService {

	@Autowired
	TravelBoardDAO TravelBoardDAO;
	
	
	 public List<Map<String, String>> selectList(){
		 return TravelBoardDAO.selectList(); 
	 }
	 
	
	public int selectTotalContents() {
		return TravelBoardDAO.selectTotalContents();
	}
	
	public int insertTravelBoard(TravelBoard board, List<TravelAttachment> list) { 
		int result = 0;
		
		// 1. 게시글 추가
		result = TravelBoardDAO.insertTravelBoard(board);
		if(result < 1) throw new TravelBoardException("게시글 추가 중 에러 발생!");
		
		// 2. 추가된 게시글의 번호를 가져와
		//    첨부파일 추가하기
		if(list.size() > 0) {
			for(TravelAttachment a : list) {
				result = TravelBoardDAO.insertTravelAttachment(a);
				
				System.out.println("result 확인 : " + result);
				// 확인용 result 값 변경하기
				// result = 0;
				if(result < 1) throw new TravelBoardException("첨부파일 추가 중 에러 발생!");
			}
		}
		return result;
	}	
	public TravelBoard selectOneTravelBoard(int boardNo) {
		return TravelBoardDAO.selectOneTravelBoard(boardNo);
	}

	public List<TravelAttachment> selectAttachment(int boardNo) {
		return TravelBoardDAO.selectTravelAttachment(boardNo);
	}

	public int updateBoard(TravelBoard originBoard, List<TravelAttachment> list) {
		int result = 0;
		
		List<TravelAttachment> originList
		   = TravelBoardDAO.selectTravelAttachment(originBoard.getbNo());
		
		result = TravelBoardDAO.updateTravelBoard(originBoard);
		
		if(result > 0) {
			if(originList.size() > 0) {
				result = TravelBoardDAO.deleteTravelAttachment(originBoard.getbNo());
				
			}
			
			if(list.size() > 0) {
				for(TravelAttachment a : list) {
					result = TravelBoardDAO.updateTravelAttachment(a);
					
				}
			}
		}
		
		return result;
	}

	public int deleteTravelBoard(int boardNo) {
		
		return TravelBoardDAO.deleteTravelBoard(boardNo);
	}
	
}
