package com.spring.board;

import java.util.List;

public interface BoardDao {

		// 게시판 목록
		public List<BoardModel> boardList();
		
		// 게시글 내용 보기
		public BoardModel boardDetail(int board_num);
		
		// 게시글 작성
		public boolean boardWrite(BoardModel boardModel);

		// 게시글 수정
		public void BoardModify(int board_num);
		
		// 게시글 삭제
		public void BoardDelete(int board_num);
}