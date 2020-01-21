package com.kh.mohagee.chat.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mohagee.chat.model.service.ChatService;
import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatMember;
import com.kh.mohagee.member.model.vo.Member;

@Controller
public class ChatController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService chatService;
	
	//전체채팅룸으로 이동
	@RequestMapping(value="chat.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String chat(Model model, HttpServletRequest req) throws Exception {
		
		logger.info("hat.do Run! / Run Time : " + new Date());
		
		Member login = (Member)req.getSession().getAttribute("member");
		
		if(login == null) {
			return "redirect:/loginNull.do";
		}
		
		System.out.println(login);
		//DB에 현재 아이디로 어떤 방에 들어가있는지 조사 후, 세팅하기
		ChatMember chatM = chatService.getRoomMember(new ChatMember(0, login.getUserId(), "", ""));
		
		if(chatM == null) {
			chatService.addRoomMember(new ChatMember(0, login.getUserId(), "all", "all"));
			
			chatM = chatService.getRoomMember(new ChatMember(0, login.getUserId(), "", ""));
			logger.info("아이디 정보 추가 성공!" + new Date());
			
		} else {
			chatService.updateRoomMember(new ChatMember(0, login.getUserId(), "all", ""));
		}
		
		model.addAttribute("room", "all");
		
		return "chat/chatting";
		
	} 
	
	//방 만들기
	@RequestMapping(value="createChatRoom.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String createChatRoom(Model model, HttpServletRequest req, Chat chat) throws Exception{
		
		logger.info("createChatRoom.do Run! / Run Time : " + new Date());
		
		Member login = (Member)req.getSession().getAttribute("member");
		
		if(login == null) {
			return "redirect:/loginNull.do";
		}
		
		logger.info(chat.toString());
		
		Chat ch = chatService.checkRoom(chat.getName());
		
		if(ch == null) {
			chatService.createChatRoom(ch);
			
		}
		
		chatService.updateRoomMember(new ChatMember(0, login.getUserId(), chat.getName(), ""));
		
		model.addAttribute("room", chat.getName());
		
		return "chat/chatting";
		
	}
	
	// 중복 확인
	@ResponseBody
	@RequestMapping(value = "checkRoom.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int checkRoom(Model model, String name) throws Exception{
		
		System.out.println("name = " + name);
		
		Chat ch = chatService.checkRoom(name);
		
		if(ch == null) {
			
			return 1;
			
		} else {
			
			return 0;
			
		}
		
		
	}
	
	
	// 방 이동
	@RequestMapping(value="MoveChatRoom.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String MoveChatRoom(Model model, HttpServletRequest req, String roomName) throws Exception {
		
		logger.info("MoveChatRoom.do RUN! / Run Time : " + new Date());
		
		Member login = (Member)req.getSession().getAttribute("member");
		
		if(login == null) {
			return "redirect:/loginNull.do";
		}
		
		logger.info("이동할 방이름 : " + roomName);
		
		//이동할 방 이름으로 수정
		chatService.updateRoomMember(new ChatMember(0, login.getUserId(), roomName, ""));
		
		// 방이동
		model.addAttribute("room", roomName);
		
		return "chat/chatting";
		
	}
	
	

}
