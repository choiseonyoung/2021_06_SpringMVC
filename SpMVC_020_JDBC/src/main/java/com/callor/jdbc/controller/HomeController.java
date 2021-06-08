package com.callor.jdbc.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.jdbc.service.RentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/*
	 * 보편적인 Spring에서 bean을 사용하는 코드
	 * @Autowired
	 * private BookDao bookDao
	 * 이 코드에서 메모리 leak(누수) 현상이 보고되어 다음의 코드를 권장한다.
	 * 위 코드보다 아래 코드로 쓰는 것이 메모리 누수에 더 유리하다
	 */
	// protected final BookDao bookDao; // final로 만들었기 때문에 반드시 생성자 필요
	protected final RentService rentService;
	public HomeController(RentService rentService) {
		this.rentService = rentService;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		
		rentService.viewBookAndComp();
		return "home";
	}
	
}
