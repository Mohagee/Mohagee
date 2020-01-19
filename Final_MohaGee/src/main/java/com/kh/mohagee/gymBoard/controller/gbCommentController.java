package com.kh.mohagee.gymBoard.controller;

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
	
	// 댓글 리스트보기
	@RequestMapping("/gbComment/gbCommentSelectList.do")
	@ResponseBody
	public Map<String, Object> gbCommentSelectList (@RequestParam int bNo){
		Map<String, Object> data = new HashMap<>();
		
		data.put("gymBoard", GymBoardService.selectOneGymBoard(bNo));
		data.put("gbCommentList", gbCommentService.selectListgbComment(bNo));
		
		return data;
	}
	
	// 댓글 등록
	@RequestMapping("/gbComment/gbCommentInsert.do")
	@ResponseBody
	public List<GymBoard> gbCommentInsert (@RequestParam int userNo ,
																		   @RequestParam int bNo ,
																		   @RequestParam String bcContent){
		List<GymBoard> data = null;
		// insert
		gbComment gbComment = new gbComment();
		
		int result = gbCommentService.insertgbComment(gbComment);
		
		if(result>0) {
			// selectList
			data = gbCommentService.selectListgbComment(bNo);
		}
		return data;
	}	
	
	
	// 댓글 수정
	@RequestMapping("/gbComment/gbCommentUpdate.do")
	@ResponseBody
	public List<GymBoard> gbCommentUpdatet (@RequestParam int bcNo ,
																			  @RequestParam int bNo ,
																			  @RequestParam String bcContent){
		List<GymBoard> data = null;
		// insert
		gbComment gbComment = new gbComment();
		gbComment.setbcNo(bcNo);
		gbComment.setbNo(bNo);
		gbComment.setBcContent(bcContent);
		
		int result = gbCommentService.updategbComment(gbComment);
		
		if(result>0) {
			// selectList
			data = gbCommentService.selectListgbComment(bNo);
		}
		return data;
	}	
	
	// 댓글 삭제
	@RequestMapping("/gbComment/gbCommentDelete.do")
	@ResponseBody
	public List<GymBoard> gbCommentDeleteSelect (@RequestParam int bcNo,
												@RequestParam int bNo){
		List<GymBoard> data = null;
	
		int result = gbCommentService.deletegbComment(bcNo);
		
		if(result>0) {
			// selectList
			data = gbCommentService.selectListgbComment(bNo);
		}
		return data;
	}	
	
	
}
