package com.callor.score.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value="/student")
@Controller
public class StudentController {
	
	protected final StudentService stService;
	
	@RequestMapping(value={"","/"}, method=RequestMethod.GET)
	public String student(Model model) {
		StudentVO vo = stService.findById();
		model.addAttribute(vo);
		return "home";
	}
	
	@RequestMapping(value={"/insert"}, method=RequestMethod.GET)
	public String student(Model model) {
		int ret = stService.insert();
		return "home";
	}
	
	@RequestMapping(value={"/insert"}, method=RequestMethod.POST)
	public String student(Model model) {
		int ret = stService.insert();
		return "home";
	}
	
	@RequestMapping(value={"/update"}, method=RequestMethod.GET)
	public String student(Model model) {
		int ret = stService.insert();
		return "home";
	}
	
	@RequestMapping(value={"/update"}, method=RequestMethod.POST)
	public String student(Model model) {
		int ret = stService.update();
		return "home";
	}
}
