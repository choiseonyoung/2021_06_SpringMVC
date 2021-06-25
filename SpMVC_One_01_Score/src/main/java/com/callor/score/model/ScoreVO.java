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
public class ScoreVO {
	private Long sc_seq;
	private Long sc_stnum;
	private String sc_subject;
	private int sc_score;

}
