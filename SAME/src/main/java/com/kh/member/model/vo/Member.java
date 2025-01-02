package com.kh.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	private String memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private int phone;
	private String memberSSN; // 주민등록번호
	private String email;
	private String isQuit;
	private String socialCode;
	private String address;
	private String memberType; //멘티멘토 구분
	private Date enrollDate;      // DATE
	
}
