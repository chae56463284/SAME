package com.kh.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Board {
	private int boardNo;
	private String memberNo;
	private char boardType;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date editDate;
	private char isDelete;
	private char isHidden;
	private int count;
	private Category category; //vo에 생성된 카테고리 객체를 가져온다
	private int rNum; 
}
