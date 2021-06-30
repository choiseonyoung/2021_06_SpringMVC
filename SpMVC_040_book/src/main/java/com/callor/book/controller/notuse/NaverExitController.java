package com.callor.book.controller.notuse;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.callor.book.model.BookDTO;
import com.callor.book.service.NaverBookService;


//@RequestMapping(value="/naver")
//@Controller
public class NaverExitController {
	
	@Qualifier("naverServiceV1")
	protected final NaverBookService nBookService;
	public NaverExitController(@Qualifier("naverServiceV1") NaverBookService nBookService) {
		this.nBookService = nBookService;
	}
	
	@ResponseBody
	@RequestMapping(value="/book",method=RequestMethod.GET, produces = "application/json;char=UTF8")
	// 내가 보낸 데이터는 그냥 문자열이 아니다. json 파일의 값이니 알아서 표현해라 라는 의미
	public List<BookDTO> book(String search) throws MalformedURLException, IOException, ParseException {
		String queryURL = nBookService.queryURL(search);
		String jsonString = nBookService.getJsonString(queryURL);
		List<BookDTO> bookList = nBookService.getNaverList(jsonString);
		
		return bookList;
	}
}
