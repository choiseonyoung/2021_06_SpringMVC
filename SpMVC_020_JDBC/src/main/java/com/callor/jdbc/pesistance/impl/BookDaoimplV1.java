package com.callor.jdbc.pesistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.jdbc.model.BookVO;
import com.callor.jdbc.pesistance.BookDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("bookDaoV1") // 이 이름으로 쓰겠다 (id 이름이라 보면 됨)
public class BookDaoimplV1 implements BookDao {

	// Console에 log를 찍기 위하여 log 객체를 생성하는 코드
	// 하지만, 사용하지 않고 lombok @Slf4j 를 사용하여 아래 코드를 대신한다
//	private static Logger log = LoggerFactory.getLogger("SERVICE");
	
	// jdbc-context.xml에 선언된 jdbcTemplate bean 사용하기
	protected final JdbcTemplate jdbcTemplate;
	public BookDaoimplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
		// xml에 선언된 jdbc 가져와 사용할 준비됨
	}
	
	@Override
	public List<BookVO> selectAll() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM tbl_books ";
		/*
		 * jdbcTemplate.query(sql, return type)
		 * sql문을 실행한 후 return type 형태로 데이터를 변환하여 return 해달라
		 * 
		 * 리스트로 만들어달라고 jdbcTemplate에 요청할 땐 BeanPropertyRowMapper의 도움을 받음
		 */
		List<BookVO> books = jdbcTemplate.query(sql, new BeanPropertyRowMapper<BookVO>(BookVO.class));
		log.debug("SELECT {}", books.toString());
		return null;
	}

	@Override
	public BookVO findById(String pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(BookVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BookVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BookVO> findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookVO> findByDate(String date) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookVO> findByComp(String comp) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookVO> findByAuthor(String author) {
		// TODO Auto-generated method stub
		return null;
	}

}
