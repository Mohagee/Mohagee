package com.kh.mohagee.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.kh.mohagee.chat.model.service.ChatService;
import com.kh.mohagee.chat.model.vo.Chat;
import com.kh.mohagee.chat.model.vo.ChatRoom;
import com.kh.mohagee.member.model.service.MemberService;
import com.kh.mohagee.member.model.vo.Member;

@Controller
public class ChatController {

	@Autowired
	private Member member;

	@Autowired
	private ChatService chatService;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/chat/croom/{croomNo}")
	public String chatView(@PathVariable int croomNo, Model model, HttpServletRequest request) {
		Member loginMember = (Member) request.getSession().getAttribute("member");

		List<Chat> cList = chatService.selectRecentChat(loginMember.getUserNo());

		model.addAttribute("croomList", cList);
		if (cList.size() != 0 && croomNo == 0)
			croomNo = cList.get(0).getCroomNo();

		model.addAttribute("chatList", new Gson().toJson(chatService.selectChatList(croomNo)));
		ChatRoom cr = new ChatRoom();
		cr.setUserNo(loginMember.getUserNo());
		cr.setCroomNo(croomNo);
		model.addAttribute("croom", chatService.selectCroom(cr));
		model.addAttribute("memList", MemberService.selectMemberList(member));
		model.addAttribute("chatUser", new Gson().toJson(chatService.selectChatUser(croomNo)));

		return "chat/chatting";
	}

	@RequestMapping("/chat/chatview2.do")
	public String chatView2() {
		return "chat/chatting2";
	}

	@RequestMapping("/chat/insertChatRoom")
	public String insertChatRoom(@RequestParam String croomTitle, @RequestParam int[] userNo,
			HttpServletRequest request) {
		Member mem = (Member) request.getSession().getAttribute("member");
		List<ChatRoom> crList = new ArrayList<ChatRoom>();

		for (int uno : userNo) {
			ChatRoom cr = new ChatRoom();
			cr.setCroomTitle(croomTitle);
			cr.setUserNo(uno);
			crList.add(cr);
		}
		ChatRoom cr = new ChatRoom();
		cr.setCroomTitle(croomTitle);
		cr.setUserNo(mem.getUserNo());
		crList.add(cr);

		int croom_no = chatService.insertChatRoom(crList);

		return "redirect:/chat/croom/" + croom_no;
	}

	@RequestMapping("/chat/inviteUser")
	public String inviteUser(@RequestParam int croomNo, @RequestParam int[] userNo, @RequestParam String croomTitle) {
		List<ChatRoom> crList = new ArrayList<ChatRoom>();
		
		for (int uno : userNo) {
			ChatRoom cr = new ChatRoom();
			cr.setCroomNo(croomNo);
			cr.setUserNo(uno);
			cr.setCroomTitle(croomTitle);
			crList.add(cr);
		}

		int result = chatService.inviteChatRoom(crList);

		return "redirect:/chat/croom/" + croomNo;
	}

	@RequestMapping("/chat/exitCroom/{croomIndex}")
	public String exitCroom(@PathVariable int croomIndex) {
		chatService.deleteChatRoom(croomIndex);

		return "redirect:/chat/croom/0";
	}

	@RequestMapping("/chat/renameCroom")
	public String renameCroom(@RequestParam int croomIndex, @RequestParam String croomTitle,
			@RequestParam int croomNo) {
		ChatRoom cr = new ChatRoom();
		cr.setCroomIndex(croomIndex);
		cr.setCroomTitle(croomTitle);

		chatService.updateCroom(cr);

		return "redirect:/chat/croom/" + croomNo;
	}

}
