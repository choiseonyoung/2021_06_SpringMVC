package com.callor.jdbc.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.callor.jdbc.model.BookVO;
import com.callor.jdbc.pesistance.BookDao;
import com.callor.jdbc.service.BookService;

import lombok.RequiredArgsConstructor;

/*
 * 필드변수를 private final, protected final으로 선언하면
 * 반드시 생성자에서 해당 변수를 초기화 해줘야 한다
 * 이때 매개변수로 전달받거나 직접 new 키워드로 생성을 하는데
 * 
 * Spring에서는 new키워드를 사용하지 않고 Spring Container로부터 주입을 받기 때문에
 * 해당 변수들을 매개변수로 갖는 생성자가 필요하다
 * 
 * 매번 생성자를 만드는 것이 귀찮을 일이고
 * 변수를 추가, 제거, 변경할 때마다 생성자를 다시 코딩 해야하는 불편함이 있다
 * 
 * 그러한 일들을 대신 수행해주는 Lombok의 Annotation
 */
@RequiredArgsConstructor
@Service("BookServiceV1")
public class BookServiceImplV1 implements BookService {

	protected final BookDao bookDao;
	
	@Override
	public List<BookVO> selectAll() {
		return bookDao.selectAll();
	}

	@Override
	public Integer insert(BookVO bookVO) {
		
		return bookDao.insert(bookVO);
	}

}
