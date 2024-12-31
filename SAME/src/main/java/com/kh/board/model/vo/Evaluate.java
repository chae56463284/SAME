package com.kh.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Evaluate {

	private String classCode;
	private String memberNo;
	private int boardNo;
	private int value;
	
}
