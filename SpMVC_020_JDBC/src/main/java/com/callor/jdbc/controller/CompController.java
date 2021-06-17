package com.callor.jdbc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.pesistance.CompDao;
import com.callor.jdbc.service.CompService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/comp") // comp라고 실행이 되면 이 컨트롤러가 호출되고 뒤에 따라오는 서브패스에 의해 insert, update가 실행됨
public class CompController {
	
	protected final CompDao compDao;
	protected final CompService compService;
	public CompController(CompDao compDao, CompService compService) {
		this.compDao = compDao;
		this.compService = compService;
	}
	
	@RequestMapping(value= {"/",""}, method=RequestMethod.GET)
	public String list(HttpSession hSession, Model model) {
		
		if(hSession.getAttribute("USERVO") == null) {
			model.addAttribute("MSG", "LOGIN");
			return "redirect:/member/login";
		}
		return "comp/list";
	}
	
	// localhost:8080/jdbc/comp/insert로 호출되는 함수
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String insert() {
		// WEB-INF/views/comp/input.jsp 열어라
		return "comp/input";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(CompVO cmVO) { // VO 통해서 통째로 수신 // setter 등 이용해서 값 추가하던 코드가 사라짐
		
		log.debug("Company VO {}", cmVO.toString());
		compService.insert(cmVO);
		return "redirect:/";
		// root path로 리다이렉트하라
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update() {
		
		return "comp/input";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam("cp_code") String cpCode) { // 변수이름은 웹에서 보내는 이름과 같아야 함
		// 웹에서 cpcode를 받아와서 code에 담아라. 변수 이름 다르게 쓰고 싶을땐 이렇게
		compDao.delete(cpCode);
		return "redirect:/";
	}
}
