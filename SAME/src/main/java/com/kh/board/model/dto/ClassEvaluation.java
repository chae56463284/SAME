package com.kh.board.model.dto;

import lombok.AllArgsConstructor;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClassEvaluation {

	private String classCode; // VARCHAR2(8)
	private String memberNo; // VARCHAR2(5)
	private int value; // NUMBER (별점으로 사용)
	private int boardNo; // NUMBER
}