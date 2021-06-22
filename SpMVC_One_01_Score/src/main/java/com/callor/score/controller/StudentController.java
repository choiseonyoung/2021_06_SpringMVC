package com.callor.score.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.score.model.StudentVO;
import com.callor.score.service.StudentService;


@Controller
public class StudentController {
	
	protected final StudentService studentService;
	public StudentController(StudentService studentService) {
		this.studentService = studentService;
	}
	
	@RequestMapping(value = "/insert_stu", method = RequestMethod.GET)
	public String insert_stu() {
		return "include/insert_stu";
	}
	
	@RequestMapping(value = "/insert_stu", method = RequestMethod.POST)
	public String insert_stu(@ModelAttribute StudentVO vo) {
		
		Integer ret = studentService.insert(vo);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/stu_info", method = RequestMethod.GET)
	public String stu_info() {
		return "include/stu_info";
	}
	
}
