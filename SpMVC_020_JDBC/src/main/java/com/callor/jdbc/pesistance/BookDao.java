package com.callor.jdbc.pesistance;

import java.util.List;

import com.callor.jdbc.model.BookVO;

/*
 * Dao(Data Access Object)
 * Service -> Dao -> DBMS 과정에서
 * 실질적인 1개 테이블에 대한 CRUD를 담당할 interface 또는 class
 * 
 * Servlet project에서 Service가 실행했던 역할을 Dao가 실행하게 된다.
 */
public interface BookDao extends GenericDao<BookVO, String> {
	
	// Generic에 선언된 mehtod에 추가하여 도서정보 테이블에서 조회한 method를 작성
	// 도서명 검색하기
	public List<BookVO> findByName(String name);
	
	// 출판일로 검색하기
	public List<BookVO> findByDate(String date);
	
	public List<BookVO> findByComp(String comp);
	public List<BookVO> findByAuthor(String author);
	
}
