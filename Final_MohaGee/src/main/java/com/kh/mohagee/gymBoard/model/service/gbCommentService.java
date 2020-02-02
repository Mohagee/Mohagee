package com.kh.mohagee.gymBoard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mohagee.gymBoard.model.vo.GymBoard;
import com.kh.mohagee.gymBoard.model.vo.gbComment;
import com.kh.mohagee.gymBoard.exception.GymBoardException;
import com.kh.mohagee.gymBoard.model.dao.gbCommentDAO;


@Service
public class gbCommentService {
	
	@Autowired
	gbCommentDAO gbCommentDAO;
	
	// throw new GymBoardException은 게시글 추가 중 에러 발생!이라는 에러메시지를 지정해주는데
	// 이건 try catch를 사용해야 하지만 미리 throw로 던져두면 try catch할 필요가없다	
	public int insertgbComment(gbComment gbComment) throws GymBoardException{
		int result = 0;
		
		System.out.println("서비스에gbComment 는 : " + gbComment);
		// dao에 insertgbComment에 gbComment라고 선언한 gbComment에서 값을 가져와서 result에 담는다
		result = gbCommentDAO.insertgbComment(gbComment);
		
		// result값이 1보다 낮다는건 값이 들어가지않았단 뜻이기때문에 게시글 추가 중 에러 발생이란 메시지 띄우고
		if(result < 1) throw new GymBoardException("게시글 추가 중 에러 발생!");
		
		// result 값이 1보다 작지않으면 result값을 return 해준다
		return result;
	}

	public List<gbComment> selectListgbComment(int bNo) {
		
		return gbCommentDAO.selectListgbComment(bNo);
	}

	public int updategbComment(gbComment gbComment) {
		int result = 0;
		
		result = gbCommentDAO.updategbComment(gbComment);
		if(result < 1) throw new GymBoardException("댓글 수정 실패");
		
		return result;
	}

	public int deletegbComment(int bcNo) {
		int result = 0;
		
		result = gbCommentDAO.deletegbComment(bcNo);
		if(result < 1) throw new GymBoardException("댓글 삭제 실패");
		
		return result;
	}

	public int selectLastgbComment(int bNo) {
		
		return gbCommentDAO.selectLastgbComment(bNo);
	}
}
