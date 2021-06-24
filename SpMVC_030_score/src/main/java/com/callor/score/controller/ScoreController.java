package com.callor.score.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ScoreDTO;
import com.callor.score.service.ScoreService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value="/score")
@Controller
public class ScoreController {

	protected final ScoreService sService;
	
	@RequestMapping(value={"/",""}, method = RequestMethod.GET)
	public String list(Model model) {
		List<ScoreDTO> list = sService.selectViewAll();
		model.addAttribute("SCLIST", list);
		
		model.addAttribute("BODY","SCORE_VIEW");
		return "home";
	}
	
}
