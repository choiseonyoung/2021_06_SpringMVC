package com.callor.jdbc.pesistance.impl;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.callor.jdbc.model.CompVO;
import com.callor.jdbc.pesistance.CompDao;

import lombok.extern.slf4j.Slf4j;

/*
 * @Component
 * 모든 Component를 대표하는 Annotation
 * 컴파일 과정에서 다소 비용이 많이 소요된다
 * 
 * Component Annotation
 * @Controller, @Service, @Repository 이러한 Annotation을 사용한다
 * Spring Controller에게 이 표식이 부착된 클래스를 bean으로 생성하여 보관해달라 라는 지시어
 * 
 * CompVO c = new CompVO()
 * Object o = new CompVO()
 * 
 * CompServiceImplV1 cs = new CompServiceImplV1();
 * CompService cs1 = new CompServiceImplV1();
 */
@Slf4j
@Repository("compDaoV1") // bean으로 등록하기 위해 // 레파지토리에 이름 붙이는 이유 : 
public class CompDaoImplV1 implements CompDao {

	protected final JdbcTemplate jdbcTemplate;
	public CompDaoImplV1(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public List<CompVO> SelectAll(String comp) {

		String sql = " SELECT * FROM tbl_company ";
		
		List<CompVO> compList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<CompVO>(CompVO.class));
		log.debug("SELECT {}", compList.toString());
		
		return compList;
	}

	@Override
	public CompVO findById(String pk) {
		// TODO Auto-generated method stub
		String sql = "";
		Object[] params = new Object[] { pk };
		
		CompVO vo = (CompVO) jdbcTemplate.query(sql, params, new BeanPropertyRowMapper(CompVO.class));
		
		return null;
	}

	@Override
	public int insert(CompVO vo) { // 이건 vo 바로 대입이 안 돼서 Object로 세팅하는 것
		// TODO Auto-generated method stub
		String sql = " INSERT INTO tbl_company ";
		sql += " (cp_code, cp_title, cp_ceo, cp_tel, cp_addr ) ";
		sql += " VALUES( ?,?,?,?,? )" ;
		
		Object[] params = new Object[] {vo.getCp_code(), vo.getCp_title(), vo.getCp_ceo(), vo.getCp_addr(), vo.getCp_tel() };
		// 전달받은 vo를 오브젝터 배열로 만들어주고 update 메서드에 sql 명령문 문자열과 오브젝트로 만들어진 params 건네줌
		return jdbcTemplate.update(sql,params);
	}

	@Override
	public int update(CompVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * jdbcTemplate을 사용하여 QUERY를 실행할 때
	 * 각 method에서 매개변수를 받아 QUERY에 전달할텐데
	 * 이때 매개변수는 primitive로 받으면 값을 변환시키는 어려움이 있다
	 * 그래서 권장사항으로 매개변수는 wrapper class type으로 설정
	 * 즉 숫자형일 경우 int, long 대신 Integer, Long 형으로 선언
	 * 
	 * vo에 담겨서 전달된 값은 Object[] 배열로 변환한 후
	 * jdbcTemplate에 전달해줘야 한다
	 * 
	 * 하지만 1~2개 정도의 값을 전달할 때 Object[] 배열로 변환 후 전달을 하면
	 * Object 객체 저장소가 생성되고 메모리를 사용한다
	 * 이때 전달되는 변수가 wrapper class type이면 Object[] 배열로 만들지 않고 바로 주입할 수 있다
	 */
	@Override
	public int delete(String cpcode) {
		// TODO 출판사 정보 삭제
		String sql = " DELETE FROM tbl_company ";
		sql += " WHERE cp_code = ? ";
		
		// cpcode가 String wrapper class type 이므로 Object[] 배열로 변환하지 않고 바로 전달 가능
		// Object[] params = new Object[] { cpcode };
		jdbcTemplate.update(sql, cpcode); // 바로 주입 가능
//		jdbcTemplate.update(sql, cpcode, cpcode); // 여러개면 이런 식으로 쓰면 됨
		
		return 0;
	}

	@Override
	public List<CompVO> findByCName(String cname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> findByTel(String tel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> findByCeo(String ceo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CompVO> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	 * tbl_company table에서 cpcode(출판사코드) 중 가장 큰 값을 추출하기
	 */
	@Override
	public String findByMaxCode() {
		String sql = " SELECT MAX(cp_code) FROM tbl_company ";
		
		String cpCode = (String) jdbcTemplate.queryForObject(sql, String.class);
		
		return cpCode;
	}

}
