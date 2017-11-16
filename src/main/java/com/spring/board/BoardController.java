package com.spring.board;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.tiles.request.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.BoardService;
import com.spring.board.BoardModel;
import com.spring.common.Paging;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	ModelAndView mv;
	String session_id;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging paging;
	
	// 1. 게시판 목록
	@RequestMapping(value="/board/boardList.do")
    public ModelAndView BoardList(HttpServletRequest request, HttpSession session) throws Exception{
    	mv = new ModelAndView();
    	BoardModel boardModel = new BoardModel();
    	
    	List<BoardModel> boardList = boardService.boardList();
    	mv.addObject("boardList", boardList);
    	
    	return mv;
    }
	
	/*// 2. 게시판 내용 보기
	@RequestMapping("/board/boardDetail.do"){
		
	}
	*/
	// 3.게시판 작성
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.POST)
	public ModelAndView BoardWrite(@RequestParam int board_num, @RequestParam String board_title,
			@RequestParam String member_id, @RequestParam String board_pw, @RequestParam String board_content, 
			@RequestParam int board_type, HttpSession session) throws Exception {
		mv = new ModelAndView();
		
		return mv;
	}
}

	