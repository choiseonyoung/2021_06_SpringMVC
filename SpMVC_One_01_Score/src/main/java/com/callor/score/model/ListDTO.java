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
public class ListDTO {
	private String st_num;
	private String st_name;
	private String st_dept;
	private Integer st_grade;
	private int st_sub;
	private int st_sum;
	private float st_avg;
}
