package com.callor.score.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class StudentDTO {
	private String st_num;
	private String st_dept;
	private String st_name;
	private Integer st_grade;
	private Integer sc_seq;
	private String sc_subject;
	private Integer sc_score;
}
