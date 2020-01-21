package com.kh.mohagee.top5.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.mohagee.top5.model.service.Top5Service;

@Controller
public class Top5Controller {
	
	 private String[] imgExt = {"jpg", "png","PNG", "gif", "bmp", "svg", "jpeg", "webp"};
	 private String[] videoExt = {"mp4", "avi", "mkv", "wmv", "flv", "asf", "ts", "mpg"};
	 private String[] audioExt = {"mp3", "ogg", "wav", "flac"};

	 public List<String> imgExtList = Arrays.asList(imgExt);
	 public List<String> videoExtList = Arrays.asList(videoExt);
	 public List<String> audioExtList = Arrays.asList(audioExt);
	 
	/*
	 * @Autowired Top5Service top5Service;
	 */
	 
	
	
	
	

}
