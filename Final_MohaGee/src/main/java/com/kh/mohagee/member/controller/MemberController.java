package com.kh.mohagee.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView memberLogin(Member member, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		try {
			
			Member m = null;
			
			m = memberService.selectOneMember(member);
			
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
			
		} catch (Exception e) {
			throw new Exception("로그인 시도 중 에러 발생!");
		}
		
		return mv;
	}
	
	@RequestMapping("/member/logOut.do")
	public String logOut(HttpSession session){
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/findId.do")
	public String findId(@RequestParam("name") String name, @RequestParam("phone") String phone, Model model) throws Exception {
		
		Member member = new Member();
		
		member.setUserName(name);
		member.setPhone(phone);
		
		String email = memberService.findEmail(member);
		
		String msg = "";
		String loc = "";
		
		if( email == null || email == "") {
			
			msg = "존재하지 않는 이름과 전화번호 입니다";
			loc = "/member/findIdPage.do";
			
		} else {
			
			int check = memberService.updateConfirm(email);
			
			if(check == 0) {
				System.out.println("멤버 updateConfirm함수 실행 실패");
			}
			
			emailService.createRandNum(email);
			
			msg = "회원님의 아이디인 \\n" + email +"로 인증메일을 발송했습니다. \\n" + "인증 후부터 로그인이 가능합니다.";
			loc = "/";
			
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/util";
	}
	
	@RequestMapping("/member/findPw.do")
	public String findPw(@RequestParam("userId") String userId, 
			@RequestParam("name") String name, @RequestParam("phone") String phone, Model model) throws Exception {
		
		Member member = new Member();
		
		member.setUserId(userId);
		member.setUserName(name);
		member.setPhone(phone);
		
		int result = memberService.findPassword(member);
		
		String msg = "";
		String loc = "";
		
		
		if(result == 0) {
			
			msg = "존재하지 않는 회원입니다";
			loc = "/member/findPwPage.do";
			
		} else {
			
			String TemPass = emailService.TemPass(userId);
			
			String encTemPass = bcryptPasswordEncoder.encode(TemPass);
			
			emailService.findPassword(userId, TemPass, encTemPass);
			
			msg = "회원님의 이메일로 비밀번호를 전달 해드렸습니다.";
			loc = "/";
		}
		
		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "common/util";
		
	}
	
	@RequestMapping("/member/myPage.do")
    public String myPage(@RequestParam("userNo") int userNo, Model model, HttpSession session) {
    	
    	Member m = memberService.selectMyPage(userNo);
    	
    	String msg = "";
    	String loc = "";
    	
    	if(m == null) {
    		msg = "존재하지 않는 사용자 입니다.";
    		loc = "/";
    		
    		model.addAttribute("msg", msg).addAttribute("loc", loc);
    		
    		return "common/util";
    		
    	}
    	
    	session.setAttribute("myPageMember", m);
    	
    	return "member/myPage";
    }

}











