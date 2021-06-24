package com.callor.score.controller;

import java.util.List;

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
	
	protected final StudentService studentService;
	
	@RequestMapping(value={"/",""}, method = RequestMethod.GET)
	public String student(Model model) {
		List<StudentVO> stList = studentService.selectAll();
		model.addAttribute("STUDENTS",stList);
		
//		String BODY = "STUDENT_LIST";
		//view.rendering(BODY)
		
		model.addAttribute("BODY", "STUDENT_LIST");
		return "home";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert(Model model) {
		
		model.addAttribute("BODY","STUDENT_INPUT");
		return "home";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(StudentVO studentVO, Model model) {
		model.addAttribute("BODY","STUDENT_INPUT");
		return "home";
	}
}
