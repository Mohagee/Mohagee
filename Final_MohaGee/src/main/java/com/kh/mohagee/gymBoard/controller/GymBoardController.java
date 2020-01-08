package com.kh.mohagee.gymBoard.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mohagee.gymBoard.model.service.GymBoardService;
import com.kh.mohagee.gymBoard.model.vo.GymAttachment;
import com.kh.mohagee.gymBoard.model.vo.GymBoard;

@Controller
public class GymBoardController {
	
	@Autowired
	GymBoardService GymBoardService;
	
	// 글쓰기 버튼 함수가 이동할곳
	@RequestMapping("/board/gymBoardForm.do")
	public String gymBoardForm() {
		return "gymBoard/gymBoardForm";
	}	

	// 글쓰기 폼에서 등록버튼 눌렀을때 이동할 곳
	@RequestMapping("/gymBoard/gymBoardFormEnd.do")
	public String InsertGymBoard(
			GymBoard board, Model model,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
			HttpServletRequest request) {
	
		// 1. 저장할 폴더 설정
		String savePath
			= request.getSession().getServletContext()
			.getRealPath("resouces/upload");
		
		// 2. DB에 전달할 파일 정보를 담을 list 준비하기
		List<GymAttachment> list = new ArrayList();
		
		// 3. 만약 저장할 폴더가 없다면 직접 만들기
		File dir = new File(savePath);
		if(dir.exists()==false) dir.mkdirs();
		
		/********** Multipart 파일 업로드 시작 **********/

		for(MultipartFile f : upFiles) {
			if(!f.isEmpty()) {
				GymAttachment att = new GymAttachment();
				
				list.add(att);
			}
		}
		/********** Multipart 파일 업로드 끝   **********/
		
		int result = 0;
		
		try {
			result = GymBoardService.insertGymBoard(board, list);
		}catch(Exception e) {
			if(list.size() > 0) {
				for(GymAttachment a : list) {
					File delFile = new File(savePath + "/" + a.getbFileName());
					
					boolean isDelete = delFile.delete();
					
					System.out.println("파일 삭제 여부 확인 : " + isDelete);
				}
			}
			
			throw e; // 스프링이 처리할 꺼라서 그냥 던져도 됩니다.
		}
		
		String msg = "";
		String loc = "gotoGymBoardList.do";//운동 게시판으로 가기
		
		if(result > 0) {
			msg = "게시글 추가 성공해버렸네?ㅋㅋ";
		}else {
			msg = "게시글 추가 실패해버렸네?ㅗㅗ";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
	return "common/msg";
	}
	
	// 건하 운동 게시판 상세보기
	@RequestMapping("gymBoardDetail.do")
	public String selectOne(@RequestParam("no") int boardNo, Model model) {
		
		GymBoard b = GymBoardService.selectOneGymBoard(boardNo);
		
		List<GymAttachment> list = GymBoardService.selectAttachment(boardNo);
		
		model.addAttribute("board", b)
			.addAttribute("attachmentList", list);
		
		return "gymBoardDetail.do";
	}

/*
	// 건하 게시판 수정하기 (수정버튼에 넣기)
	@RequestMapping("/board/gymBoardUpdate.do")
 */
	
}
























