package com.callor.jdbc.pesistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.callor.jdbc.model.AuthorVO;
import com.callor.jdbc.pesistance.AuthorDao;

public class AuthorDaoImplV1 implements AuthorDao{

	protected final JdbcTemplate jdbcTemplate;
	public AuthorDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<AuthorVO> SelectAll(String author) {
		
		String sql = " SELECT * FROM tbl_author ";
		List<AuthorVO> authors = jdbcTemplate.query(sql, new BeanPropertyRowMapper<AuthorVO>(AuthorVO.class));
		
		return null;
	}

	@Override
	public List<AuthorVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuthorVO findById(String pk) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(AuthorVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(AuthorVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String pk) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AuthorVO> findByAName(String aname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuthorVO> findByATel(String atel) {
		// TODO Auto-generated method stub
		return null;
	}

}
