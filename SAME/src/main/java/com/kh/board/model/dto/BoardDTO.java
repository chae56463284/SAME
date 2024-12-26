package com.kh.board.model.dto;

import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	private Board b;
//	private BoardA ba;
//	private BoardB bb;
//	private BoardC bc;
	
	private Attachment at;
	
	

}
