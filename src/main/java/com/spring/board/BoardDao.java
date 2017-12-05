package com.spring.board;

import java.util.List;

public interface BoardDao {

	// 게시판 목록
	public List<BoardModel> boardList();
	
	// 게시글 내용 보기
	public BoardModel boardDetail(int board_num);

	// 게시글 작성
	public boolean boardWrite(BoardModel boardModel);

	// 게시글 답변 작성
	public int BoardReply(BoardModel boardModel);

	// 게시글 수정
	public void boardModify(BoardModel boardModel);

	// 게시글 삭제
	public void BoardDelete(int board_num);
	
	// 게시글 원문삭제
	public void BoardAllDelete(int ref);

	// 게시판 검색
	List<BoardModel> Search0(String search);

	List<BoardModel> Search1(String search);

	List<BoardModel> Search2(String search);
}