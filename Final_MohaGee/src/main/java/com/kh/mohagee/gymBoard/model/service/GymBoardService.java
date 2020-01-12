package com.kh.mohagee.gymBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.gymBoard.exception.GymBoardException;
import com.kh.mohagee.gymBoard.model.dao.GymBoardDAO;

import com.kh.mohagee.gymBoard.model.vo.GymAttachment;
import com.kh.mohagee.gymBoard.model.vo.GymBoard;

@Service
public class GymBoardService {

	@Autowired
	GymBoardDAO GymBoardDAO;
	
	
	 public List<GymBoard> selectList(){
		 return GymBoardDAO.selectList(); 
	 }
	 
	
	public int insertGymBoard(GymBoard board, List<GymAttachment> list) { 
		int result = 0;
		
		// 1. 게시글 추가
		result = GymBoardDAO.insertGymBoard(board);
		if(result < 1)
			throw new GymBoardException("게시글 추가 중 에러 발생!");
		
		// 2. 추가된 게시글의 번호를 가져와
		//    첨부파일 추가하기
		if(list.size() > 0) {
			int idx = 0;
			for(GymAttachment a : list) {
				if(idx==0) a.setbFileLevel(0);
				result = GymBoardDAO.insertGymAttachment(a);
				
				System.out.println("result 확인 : " + result);
				idx++;
				// 확인용 result 값 변경하기
				// result = 0;
				if(result < 1)
					throw new GymBoardException("첨부파일 추가 중 에러 발생!");
			}
		}
		return result;
	}	
	public GymBoard selectOneGymBoard(int bNo) {
		return GymBoardDAO.selectOneGymBoard(bNo);
	}

	public List<GymAttachment> selectAttachment(int bNo) {
		return GymBoardDAO.selectGymAttachment(bNo);
	}

	public int updateBoard(GymBoard gymBoard, List<GymAttachment> list) {
		int result = 0;
		
		List<GymAttachment> originList
		   = GymBoardDAO.selectGymAttachment(gymBoard.getbNo());
		
		result = GymBoardDAO.updateGymBoard(gymBoard);
		
		if(result > 0) {
			if(originList.size() > 0) {
				result = GymBoardDAO.deleteGymAttachment(gymBoard.getbNo());
				
			}
			
			if(list.size() > 0) {
				for(GymAttachment a : list) {
					result = GymBoardDAO.updateGymAttachment(a);
					
				}
			}
		}
		
		return result;
	}

	public int deleteGymBoard(int bNo) {
		
		return GymBoardDAO.deleteGymBoard(bNo);
	}
	
}





















