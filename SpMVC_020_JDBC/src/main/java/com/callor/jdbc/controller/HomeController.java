package com.callor.jdbc.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.jdbc.service.HomeService;
import com.callor.jdbc.service.RentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// string.properties 파일에 설정된 속성값 가져와서 변수에 setting
	@Value("${user.name}")
	protected String user_name;
	@Value("${user.email}")
	protected String user_email;
	
	/*
	 * 보편적인 Spring에서 bean을 사용하는 코드
	 * @Autowired
	 * private BookDao bookDao
	 * 이 코드에서 메모리 leak(누수) 현상이 보고되어 다음의 코드를 권장한다.
	 * 위 코드보다 아래 코드로 쓰는 것이 메모리 누수에 더 유리하다
	 */
	// protected final BookDao bookDao; // final로 만들었기 때문에 반드시 생성자 필요
	protected final RentService rentService;

	protected final HomeService homeService;
	
	public HomeController(RentService rentService, HomeService homeService) {
		this.rentService = rentService;
		this.homeService = homeService;
	}
	
	/*
	 * 사용자에게 Response를 할 때
	 * forward 방법과 redirect 방법이 있다
	 * 
	 * forwarding은
	 * service 등등에서 생성한(조회한) 데이터를 .jsp 파일과 Rendering하여 사용자에게 HTML 코드로 전송한다
	 * 
	 * service 등등에서 생성한 데이터는
	 * Model 객체에 addAttribute() method를 사용하여 데이터를 만들고
	 * ...
	 * 
	 * class Spring___ {
	 * 		main() {
	 * 			HomeController hController = new HomeController();
	 * 			Locale locale = new Locale();
	 * 			Model model = new Model();
	 * 			String url = hController.home(locale, model);
	 * 			
	 * 			if((url.contains("redirect")) {
	 * 				rendering(url, model);			
	 * 			}
	 * 			
	 * 		}
	 * }
	 * 이런 코드가 있을것이다
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		homeService.dashBoard(model);
		
		/*
		 * 매개변수로 전달받은 Model class type변수인 model에 속성을 하나 추가한다.
		 * 속성의 이름은 user이며, 값은 user_name에 담긴 값이다
		 * 
		 * Model 객체에 담긴 속성(변수)들은 jsp파일과 Rendering이 완료되면 메모리에서 
		 */
		model.addAttribute("user", user_name);
		// user라는 이름으로 user_name에 담겨있는 변수를 세팅하고 홈이라는 친구한테 보낸다
		// model에 addAttribute라는 메서드 이용해서 변수 세팅. 그리고 하는 게 없음
		
		
		rentService.viewBookAndComp();
		return "home";
	}
	
}
