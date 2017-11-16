package com.spring.board;

import java.util.Date;

import lombok.Data;

@Data
public class BoardModel {
	
	private int board_num; //게시글 번호
	private String board_title; //게시글 제목
	private String member_id; //작성자 아이디
	private String board_pw; //게시글 비밀번호
	private	String board_content; //게시글 내용
	private Date board_regdate; //게시글 작성 날짜
	private int board_type; //게시글 타입
	private int ref; //그룹 번호
	private int re_step; //답변글 순서
	private int re_level; //답변글 레벨

}
