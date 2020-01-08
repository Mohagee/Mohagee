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

	@RequestMapping("/gotoTravelBoardList.do")
	public String gotoTravelBoardList() {
		return "travelBoard/travelBoardList";
	}
	
	@RequestMapping("/gotoGymBoardInsertForm.do")
    public String gotoGymBoardInsertForm() {
       return "gymBoard/gymBoardInsertForm";
    }
   
    @RequestMapping("/gotoGymBoardList.do")
    public String gotoGymBoardList() {
       return "gymBoard/gymBoardList";
    }
   
    @RequestMapping("/gotoGymBoardDetail.do")
    public String gotoGymBoardDetail() {
       return "gymBoard/gymBoardDetail";
    }
    
    @RequestMapping("/TalkBoardList.do")
    public String TalkBoardList() {
       return "talkBoard/talkBoardList";
    }
    
    @RequestMapping("/TalkBoardDetail.do")
    public String TalkBoardDetail() {
       return "travelBoard/travelBoardList";
    }
    
}
