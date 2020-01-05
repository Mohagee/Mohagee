package com.kh.mohagee.common.movePage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovePageController {
	@RequestMapping("/gotoIndex.do")
	public String gotoIndex() {
		
		return "redirect:/";
	}
	
	@RequestMapping("/goto404.do")
	public String goto404() {
		return "common/404";
	}
	
	@RequestMapping("/gotoBlogdetails.do")
	public String gotoBlogdetails() {
		
		return "blogdetails";
	}
	
	@RequestMapping("/gotoComingSoon.do")
	public String gotoComingSoon() {
		return "comingsoon";
	}
	
	@RequestMapping("/gotoPortfolioDetails.do")
	public String gotoPortfolioDetails() {
		return "portfolioDetails";
	}
	
	@RequestMapping("/gotoPortfolio.do")
	public String gotoPortfolio() {
		return "portfolio";
	}
}

















