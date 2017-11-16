package com.spring.board;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class BoardService implements BoardDao {
	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 게시판 목록
	@Override
	public List<BoardModel> boardList(){
		return sqlSessionTemplate.selectList("board.boardList");
	}

	// 게시글 내용 보기
	@Override
	public BoardModel boardDetail(int board_num){
		return sqlSessionTemplate.selectOne("board.selectBoardOne", board_num);
	}
	
	// 게시글 작성
	@Override
	public boolean boardWrite(BoardModel boardModel) {
		sqlSessionTemplate.insert("board.boardWrite", boardModel);
		return true;
	}

	// 게시글 수정
	@Override
	public void BoardModify(int board_num) {
		sqlSessionTemplate.update("board.boardUpdate", board_num);
	}
	
	// 게시글 삭제
	@Override
	public void BoardDelete(int board_num) {
		sqlSessionTemplate.delete("board.boardDelete", board_num);
	}

}