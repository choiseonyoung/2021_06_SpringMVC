package com.callor.score.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ViewListDTO {
	private Long st_num;
	private String st_name;
	private String st_dept;
	private int st_grade;
	private int sb_count;
	private int sb_sum;
	private float sb_avg;
}
