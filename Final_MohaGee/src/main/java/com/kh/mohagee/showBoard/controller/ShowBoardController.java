package com.kh.mohagee.showBoard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mohagee.showBoard.model.service.ShowBoardService;
import com.kh.mohagee.showBoard.model.vo.ShowAttachment;
import com.kh.mohagee.showBoard.model.vo.ShowBoard;

@Controller
public class ShowBoardController {
	
	@Autowired
	ShowBoardService ShowBoardService;
	
	@RequestMapping("/showBoard/showBoardList.do")
	public String showBoardList() {
		return "showBoard/showBoardList";
	}
	
	// 글쓰기 버튼 함수가 이동할곳
	@RequestMapping("/showBoard/showBoardInsert.do")
	public String showBoardInsert() {
		return "showBoard/showBoardInsert";
	}	

	// 글쓰기 폼에서 등록버튼 눌렀을때 이동할 곳
	@RequestMapping("/showBoard/showBoardInsertEnd.do")
	public String InsertShowBoard(
			ShowBoard board, Model model,
			@RequestParam(value="upFile", required=false) MultipartFile[] upFiles,
			HttpServletRequest request) {
	
		// 1. 저장할 폴더 설정
		String savePath
			= request.getSession().getServletContext().getRealPath("resouces/showUpload");
		
		// 2. DB에 전달할 파일 정보를 담을 list 준비하기
		List<ShowAttachment> list = new ArrayList();
		
		// 3. 만약 저장할 폴더가 없다면 직접 만들기
		File dir = new File(savePath);
		if(dir.exists()==false) dir.mkdirs();
		
		/********** Multipart 파일 업로드 시작 **********/

		for(MultipartFile f : upFiles) {
			if(!f.isEmpty()) {
				ShowAttachment att = new ShowAttachment();
				
				list.add(att);
			}
		}
		/********** Multipart 파일 업로드 끝   **********/
		
		int result = 0;
		
		try {
			result = ShowBoardService.insertShowBoard(board, list);
		}catch(Exception e) {
			if(list.size() > 0) {
				for(ShowAttachment a : list) {
					File delFile = new File(savePath + "/" + a.getbFileName());
					
					boolean isDelete = delFile.delete();
					
					System.out.println("파일 삭제 여부 확인 : " + isDelete);
				}
			}
			
			throw e; // 스프링이 처리할 꺼라서 그냥 던져도 됩니다.
		}
		
		String msg = "";
		String loc = "showBoardList.do";// 게시판으로 가기
		
		if(result > 0) {
			msg = "게시글 추가 성공했다";
		}else {
			msg = "게시글 추가 실패했다";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
	return "common/msg";
	}
	
	//  게시판 상세보기
	@RequestMapping("showBoardDetail.do")
	public String selectOne(@RequestParam("userNo") int bNo, Model model) {
		
		ShowBoard sb = ShowBoardService.selectOneShowBoard(bNo);
		
		List<ShowAttachment> list = ShowBoardService.selectAttachment(bNo);
		
		model.addAttribute("ShowBoard", sb)
			.addAttribute("ShowAttachmentList", list);
		
		return "showBoardDetail.do";
	} 

/*
	// 건하 게시판 수정하기 (수정버튼에 넣기)
	@RequestMapping("/board/gymBoardUpdate.do")
 */
	
}

