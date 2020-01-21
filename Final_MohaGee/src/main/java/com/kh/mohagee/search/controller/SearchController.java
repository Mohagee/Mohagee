package com.kh.mohagee.search.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mohagee.member.model.vo.FavoriteBoard;
import com.kh.mohagee.search.model.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping("/search/gotoSearchForm.do")
	public String gotoSearchForm() {
		return "search/searchForm";
	}
	
	@RequestMapping("/search/indexSearch.do")
	public String indexSearch(@RequestParam String indexSearch, Model model) {
		
		List<FavoriteBoard> indexSearchList = searchService.indexSearch(indexSearch);
		
		model.addAttribute("indexSearchList", indexSearchList);
		
		return "search/searchForm";
	}
	
	@RequestMapping("/search/formSearch.do")
	@ResponseBody
	public List<FavoriteBoard> formSearch(){
		List<FavoriteBoard> list = new ArrayList<>();
		
		
		
		return list;
	}
	
}













