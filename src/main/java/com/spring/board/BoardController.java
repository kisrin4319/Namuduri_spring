package com.spring.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.tiles.request.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.BoardService;
import com.spring.book.BooksModel;
import com.spring.board.BoardModel;
import com.spring.common.Paging;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private BoardService boardService;
	
	ModelAndView mv = new ModelAndView();
	String session_id;
	
	private int searchNum;
	private String isSearch;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 6;
	private int blockPage = 4;
	private String pagingHtml;
	private Paging paging;

	
	// 1. 게시판 목록
	@RequestMapping(value="/board/boardList.do")
    public ModelAndView BoardList(HttpServletRequest request) throws Exception{
		mv = new ModelAndView();
		
		List<BoardModel> boardList = new ArrayList<BoardModel>();
				
		boardList = boardService.boardList();
			System.out.println(boardList.size());
			
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		totalCount = boardList.size();

		isSearch = request.getParameter("isSearch");
		
		if (isSearch != null) 
		{
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 0)
				boardList = boardService.Search0(isSearch);
			else if (searchNum == 1)
				boardList = boardService.Search1(isSearch);
			else if (searchNum == 2)
				boardList = boardService.Search2(isSearch);
				
			totalCount = boardList.size();
		
			paging = new Paging(currentPage, totalCount, blockCount, blockPage, "boardList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString();
	
			int lastCount = totalCount;
	
			if(paging.getEndCount() < totalCount)
				lastCount = paging.getEndCount() + 1;
		
			boardList = boardList.subList(paging.getStartCount(), lastCount);
		
			mv.addObject("isSearch",isSearch);
			mv.addObject("searchNum",searchNum);
			mv.addObject("boardList",boardList);
			mv.addObject("listCount",boardList.size());
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.setViewName("boardList");
				
			return mv;
			}
		
		mv = new ModelAndView();
					
		boardList = boardService.boardList();
			System.out.println(boardList.size());
		totalCount = boardList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "boardList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount)
		lastCount = paging.getEndCount() + 1;
		boardList = boardList.subList(paging.getStartCount(), lastCount);
		
		
		mv.addObject("boardList",boardList);
		mv.addObject("listCount",boardList.size());
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.setViewName("boardList");
		
		return mv;
		
	}
	
	// 2. 게시판 내용 보기
	@RequestMapping(value="/board/boardDetail.do")
	public ModelAndView BoardDetail(HttpServletRequest request, HttpSession session) throws Exception{
		
		mv = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("board_num"));
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		BoardModel view = boardService.boardDetail(num);
		
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "boardDetail", num);
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}

		mv.addObject("currentPage", currentPage);
		mv.addObject("view", view);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("boardDetail");
					
		return mv;
	}
	
	
	
	// 3.게시판 작성
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.GET)
	/*public String form(Model model) {
		return "boardWrite";*/
	public String writeForm(HttpServletRequest request, HttpSession session) {
		
		session_id = "test3";
		
		mv.addObject("member_id", session_id);
		mv.setViewName("boardWrite");
		
		return "boardWrite";
	}
	
	@RequestMapping(value="/board/boardWrite.do", method = RequestMethod.POST)
	public String boardWrite(@RequestParam String board_title, @RequestParam String board_pw, @RequestParam String board_content, 
			HttpSession session) throws Exception {
		
		mv = new ModelAndView();
		session_id = (String) session.getAttribute("member_id");
		BoardModel boardModel = new BoardModel();
		
		boardModel.setBoard_title(board_title);
		boardModel.setBoard_pw(board_pw);
		boardModel.setBoard_content(board_content);
		boardModel.setMember_id(session_id);
		/*boardModel.setBoard_type(board_type);*/
				
		boardService.boardWrite(boardModel);
		
		mv.addObject("boardModel", boardModel);
		mv.setViewName("boardWrite");
		
		return "redirect:boardList.do";
	}
}

	