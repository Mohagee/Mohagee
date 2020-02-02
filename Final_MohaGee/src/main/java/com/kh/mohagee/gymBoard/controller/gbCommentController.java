package com.kh.mohagee.gymBoard.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mohagee.gymBoard.model.service.gbCommentService;
import com.kh.mohagee.gymBoard.model.service.GymBoardService;
import com.kh.mohagee.gymBoard.model.vo.GymBoard;
import com.kh.mohagee.gymBoard.model.vo.gbComment;

@Controller
public class gbCommentController {	
	@Autowired
	gbCommentService gbCommentService;
	@Autowired
	GymBoardService GymBoardService;
	
	// 댓글 등록
	@RequestMapping("/gbComment/gbCommentInsert.do")
	@ResponseBody
	
	// 댓글 등록시 필요한 값들을 매개변수로 @RequestParam을 사용해 받아온다
	// 이때 vo에 이 값들로 using field 를 하나 더 만들어준다
	public int gbCommentInsert (
																			  @RequestParam int bNo ,
																			  @RequestParam int userNo,
																			  @RequestParam String bcContent,
																			  @RequestParam(value="bbcNo", defaultValue = "0" ) int bbcNo
																			  //@RequestParam Date bcDate,
																			  //@RequestParam int bcLevel,
																			  //@RequestParam String bcStatus,
																			  ){
		
		// 값을 잘 받아왔는지 확인하기위한 syso
		System.out.println("bNo : " + bNo);
		System.out.println("userNo :" + userNo);
		System.out.println("bcCentent : " + bcContent);
		System.out.println("bbcNo : " + bbcNo);
		
		// gbComment는 비워두고
		gbComment gbComment = null;
		// insert
		
		// bbcNo가 0이거나 0이아닐때 각각 받아오는 값이 다르다
		// bbcNo는 댓글과 대댓글 구분을 위한 참조하는 댓글에 대한 댓글번호
		if(bbcNo == 0) {
			gbComment = new gbComment(bNo, userNo, bcContent);
		} else {
			// bbcNo가 0이 아니면 대댓글이기에 bbcNo가 있어야하므로 받아온다
			gbComment = new gbComment(bNo, userNo, bcContent, bbcNo);
		}
		
		
		int result = gbCommentService.insertgbComment(gbComment);
		int data = 0;
		if(result>0) {
			// selectList
			data = gbCommentService.selectLastgbComment(bNo);
			System.out.println(data);
		}
		return data;
	}
	
	// 댓글 수정
	@RequestMapping("/gbComment/gbCommentUpdate.do")
	@ResponseBody
	public int gbCommentUpdate(@RequestParam int bcNo ,
													 @RequestParam int userNo,
													 @RequestParam String bcContent){

		gbComment gbc = new gbComment();
		
		gbc.setBcNo(bcNo);
		gbc.setUserNo(userNo);
		gbc.setBcContent(bcContent);
		
		int result = gbCommentService.updategbComment(gbc);
		
		return result;
	}	
	
	// 댓글 삭제
	@RequestMapping("/gbComment/gbCommentDelete.do")
	@ResponseBody
	public int gbCommentDeleteSelect (@RequestParam int bcNo){
	
		int result = gbCommentService.deletegbComment(bcNo);
		
		return result;
	}	
	
}
