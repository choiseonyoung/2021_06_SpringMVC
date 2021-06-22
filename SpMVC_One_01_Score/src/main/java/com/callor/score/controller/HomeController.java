package com.callor.score.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.ListDTO;
import com.callor.score.model.StudentVO;
import com.callor.score.service.ListService;


@Controller
public class HomeController {
	
	protected final ListService listService;
	public HomeController(ListService listService) {
		this.listService = listService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<ListDTO> list = listService.selectAll();
		model.addAttribute("STLIST", list);
		return "home";
	}
	
}
