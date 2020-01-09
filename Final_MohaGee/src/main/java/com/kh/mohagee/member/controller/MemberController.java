package com.kh.mohagee.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mohagee.email.model.service.EmailService;
import com.kh.mohagee.member.model.service.MemberService;
import com.kh.mohagee.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/signUp.do")
	public String memberSignUp(Member member, Model model) throws Exception {
		
		String password = member.getPassword();
		
		String encPassword = bcryptPasswordEncoder.encode(password);
		
		member.setPassword(encPassword);
		
		int result = memberService.insertMember(member);
		
		emailService.createRandNum(member.getUserId());
		
		String msg = "";
		String loc = "";

		if(result > 0) {
			msg = "회원가입이 완료되었습니다. \\n이메일인증후부터 로그인이 가능합니다.";
			loc = "/";
		} else {
			msg = "회원가입이 실패 했습니다.";
			loc = "/";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		
		return "common/util";
	}
	
	@RequestMapping("/member/memberLogin.do")
	public ModelAndView memberLogin(Member member, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		Member m = memberService.selectOneMember(member);
		
		String msg = "";
		String loc = "/";
		
		if( m!= null && bcryptPasswordEncoder.matches(member.getPassword(), m.getPassword()) 
				&& m.getEmailCheck() == 0) {
			msg = "이메일 인증을 진행하고 로그인을 해주시기 바랍니다";
		} else if(m!= null && bcryptPasswordEncoder.matches(member.getPassword(), m.getPassword()) 
				&& m.getEmailCheck() == 1) {
			msg = m.getNickName() + "님, 환영합니다.";
			
			session.setAttribute("member", m);
			mv.addObject("member", m);
			
		} else if( m != null) {
			msg = "비밀번호가 틀렸습니다.";
		} else {
			msg = "로그인에 실패하였습니다.";
		}
		
		mv.addObject("msg", msg).addObject("loc", loc);
		mv.setViewName("common/util");
		
		return mv;
	}

}











