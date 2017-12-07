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
	public List<BoardModel> boardList() {
		return sqlSessionTemplate.selectList("board.boardList");
	}
	
	// 게시글 내용 보기
	@Override
	public BoardModel boardDetail(int board_num) {
		return sqlSessionTemplate.selectOne("board.selectBoardOne", board_num);
	}
	
	// 게시판 검색
	@Override
	public List<BoardModel> Search0(String search) {
		return sqlSessionTemplate.selectList("board.Search0", "%" + search + "%");
	}

	@Override
	public List<BoardModel> Search1(String search) {
		return sqlSessionTemplate.selectList("board.Search1", "%" + search + "%");
	}

	@Override
	public List<BoardModel> Search2(String search) {
		return sqlSessionTemplate.selectList("board.Search2", "%" + search + "%");
	}

	// 게시글 작성
	@Override
	public boolean boardWrite(BoardModel boardModel) {
		sqlSessionTemplate.insert("board.boardWrite", boardModel);
		return true;
	}

	// 게시글 답변 작성
	public int BoardReply(BoardModel boardModel) {
		return sqlSessionTemplate.insert("board.BoardReply", boardModel);
	}

	// 게시글 수정
	@Override
	public void boardModify(BoardModel boardModel) {
		sqlSessionTemplate.update("board.boardModify", boardModel);

	}

	// 게시글 삭제
	@Override
	public void BoardDelete(int board_num) {
		sqlSessionTemplate.delete("board.BoardDelete", board_num);
	}
	
	// 게시글 원문삭제
	@Override
	public void BoardAllDelete(int board_num) {
		sqlSessionTemplate.delete("board.BoardAllDelete", board_num);
	}

}