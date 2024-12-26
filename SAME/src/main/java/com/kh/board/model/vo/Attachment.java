package com.kh.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Attachment {

	private int fileNo;
	private int refNo;
	private String originName;
	private String changedName;
	private String filePath;
	private Date uploadDate;
	private String isDelete;
	private int atType; // 게시판첨부 or 프로필첨부
}
