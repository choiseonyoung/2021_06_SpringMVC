package com.callor.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.pesistance.CompDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/comp") // comp라고 실행이 되면 이 컨트롤러가 호출되고 뒤에 따라오는 서브패스에 의해 insert, update가 실행됨
public class CompController {
	
	protected final CompDao compDao;
	public CompController(CompDao compDao) {
		this.compDao = compDao;
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
		compDao.insert(cmVO);
		
		return "redirect:/";
		// root path로 리다이렉트하라
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update() {
		
		return "comp/input";
	}
}
