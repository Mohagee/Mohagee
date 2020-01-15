package com.kh.mohagee.showBoard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.showBoard.exception.ShowBoardException;
import com.kh.mohagee.showBoard.model.dao.ShowBoardDAO;
import com.kh.mohagee.showBoard.model.vo.ShowAttachment;
import com.kh.mohagee.showBoard.model.vo.ShowBoard;

@Service
public class ShowBoardService {

	@Autowired
	ShowBoardDAO showBoardDAO;

	public List<ShowBoard> selectList() {
		return showBoardDAO.selectList();
	}

	public int selectTotalContents() {
		return showBoardDAO.selectTotalContents();
	}

	// 게시글 작성
	public int insertShowBoard(ShowBoard showBoard, List<ShowAttachment> list) {
		
		  int result = 0;
		  
		  // 1. 게시글 추가 
		  result = showBoardDAO.insertShowBoard(showBoard); 
		  
		  if(result < 1) {
			  
			  throw new ShowBoardException("게시글 추가 중 에러 발생!");
		  }
		  
		  
		  // 2. 추가된 게시글의 번호를 가져와 // 첨부파일 추가하기 
		  
		  if(list.size() > 0) { 
			  for(int i = 0; i < list.size(); i++) {
				  ShowAttachment a = list.get(i);
				  
				  if(i== 0) a.setbFileLevel(0);
				  else  a.setbFileLevel(1);
				  
				  System.out.println("check : "+a);
				 result = showBoardDAO.insertShowAttachment(a);
		  
				  System.out.println("result 확인 : " + result); // 확인용 result 값 변경하기 // 
				  
		  		// result = 0; 
		  
		  if(result < 1) 
			  throw new ShowBoardException("첨부파일 추가 중 에러 발생!"); 
		  } 
	 }
		 
		return result;
	}

	// 게시글 선택
	public ShowBoard selectOneShowBoard(int bNo) {
		return showBoardDAO.selectOneShowBoard(bNo);
	}

	public List<ShowAttachment> selectAttachment(int bNo) {
		return showBoardDAO.selectShowAttachment(bNo);
	}

	// 게시글 수정하기
	public int updateShowBoard(ShowBoard showBoard, List<ShowAttachment> list) {
		
		int result = 0;

		List<ShowAttachment> originList = showBoardDAO.selectShowAttachment(showBoard.getbNo());
		
		result = showBoardDAO.updateShowBoard(showBoard);

		if (result > 0) {
			if (originList.size() > 0) {
				result = showBoardDAO.deleteShowAttachment(showBoard.getbNo());
			}

			 if(list.size() > 0) { 
				  for(int i = 0; i < list.size(); i++) {
					  ShowAttachment a = list.get(i);
					  
					  if(i== 0) a.setbFileLevel(0);
					  else  a.setbFileLevel(1);
					  
					  System.out.println("check : "+a);
					 result = showBoardDAO.updateShowAttachment(a);
			  
					  System.out.println("result 확인 : " + result); // 확인용 result 값 변경하기 // 
					  
			  		// result = 0; 
			  
			  if(result < 1) 
				  throw new ShowBoardException("첨부파일 추가 중 에러 발생!"); 
			  } 
		 }
			 
			return result;
		}
		 
		return result;
	}

	// 게시글 삭제하기
	public int deleteShowBoard(int bNo) {

		return showBoardDAO.deleteShowBoard(bNo);
	}



}
