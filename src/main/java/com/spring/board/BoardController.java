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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging paging;

	// 1. 게시판 목록
	@RequestMapping(value = "/board/boardList.do")
	public ModelAndView BoardList(HttpServletRequest request) throws Exception {
		mv = new ModelAndView();
		
		List<BoardModel> boardList = new ArrayList<BoardModel>();

		boardList = boardService.boardList();

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = boardList.size();

		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
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

			if (paging.getEndCount() < totalCount)
				lastCount = paging.getEndCount() + 1;

			boardList = boardList.subList(paging.getStartCount(), lastCount);

			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("boardList", boardList);
			mv.addObject("listCount", boardList.size());
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.setViewName("boardList");

			return mv;
		}

		mv = new ModelAndView();

		boardList = boardService.boardList();

		totalCount = boardList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockPage, "boardList");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;
		
		if (paging.getEndCount() < totalCount)
			lastCount = paging.getEndCount() + 1;
		boardList = boardList.subList(paging.getStartCount(), lastCount);

		mv.addObject("boardList", boardList);
		mv.addObject("listCount", boardList.size());
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.setViewName("boardList");

		return mv;

	}

	// 2. 게시판 내용 보기
	@RequestMapping(value = "/board/boardDetail.do", method = RequestMethod.GET)
	public ModelAndView BoardDetail(HttpServletRequest request, HttpSession session) {

		mv = new ModelAndView();
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		boardService.boardDetail(board_num);
		BoardModel boardModel = boardService.boardDetail(board_num);

		session_id = (String) session.getAttribute("member_id");

		if (boardModel.getRef() == boardModel.getBoard_num()) {
			mv.addObject("ref", 0);
		} else {
			mv.addObject("ref", 1);
			if (session_id == null) {
			}
		}

		mv.addObject("board_num", board_num);
		mv.addObject("currentPage", currentPage);
		mv.addObject("boardModel", boardModel);
		mv.setViewName("boardDetail");

		return mv;
	}

	// 3.게시판 작성
	/*
	 * @RequestMapping(value="/board/boardWrite.do", method = RequestMethod.GET)
	 * public String writeForm(HttpServletRequest request, HttpSession session) {
	 * 
	 * session_id = (String) session.getAttribute("member_id");
	 * 
	 * mv.addObject("member_id", session_id); mv.setViewName("boardWrite");
	 * 
	 * return "boardWrite"; }
	 */
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public ModelAndView boardWrite(HttpServletRequest request) {
		mv = new ModelAndView();
		mv.setViewName("boardWrite");
		return mv;
	}

	/*
	 * @RequestMapping(value="/board/boardWrite.do", method = RequestMethod.POST)
	 * public String boardWrite(@ModelAttribute("boardModel") BoardModel boardModel,
	 * HttpSession session ,HttpServletRequest request) throws Exception {
	 * 
	 * mv = new ModelAndView(); session_id = (String)
	 * session.getAttribute("member_id"); //BoardModel boardModel = new
	 * BoardModel();
	 * 
	 * // boardModel.setRe_step(0); //
	 * 
	 * mv.addObject("boardModel", boardModel); mv.setViewName("boardWrite");
	 * boardService.boardWrite(boardModel); return "redirect:boardList.do"; }
	 */
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.POST)
	public String boardWriteSql(@ModelAttribute("boardModel") BoardModel boardModel, HttpServletRequest request) {

		boardModel.setRe_step(0);
		boardService.boardWrite(boardModel);

		return "redirect:/board/boardList.do";

	}

	// 게시판 답변 작성
	/*
	 * @RequestMapping(value="/board/replyForm.do", method = RequestMethod.GET)
	 * public String replyForm(BoardModel boardModel, HttpServletRequest request,
	 * HttpSession session) {
	 * 
	 * mv = new ModelAndView(); session_id = (String)
	 * session.getAttribute("member_id"); String board_num =
	 * request.getParameter("board_num");
	 * 
	 * 
	 * BoardModel view = boardService.boardDetail(Integer.parseInt(board_num));
	 * 
	 * mv.addObject("boardModel", boardModel); mv.addObject("member_id",
	 * session_id); mv.addObject("view", view); mv.setViewName("BoardReply");
	 * 
	 * return "boardWrite"; }
	 */
	@RequestMapping(value = "/board/replyForm.do", method = RequestMethod.GET)
	public ModelAndView replyForm(BoardModel boardModel, HttpServletRequest request) {
		mv = new ModelAndView();
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		boardModel = boardService.boardDetail(board_num);
		String content = boardModel.getBoard_content().replaceAll("<br />", "\r\n");
		boardModel.setBoard_content(content);
		boardModel.setRe_step(1);
		mv.addObject("boardModel", boardModel);
		mv.setViewName("/adminboard/BoardReply");
		return mv;
	}

	/*
	 * @RequestMapping(value="/board/BoardReply.do", method = RequestMethod.POST)
	 * public String BoardReply(@RequestParam int board_num,@RequestParam String
	 * board_title, @RequestParam String board_pw, @RequestParam String
	 * board_content, int board_type, HttpSession session) throws Exception {
	 * 
	 * mv = new ModelAndView(); session_id = (String)
	 * session.getAttribute("member_id"); BoardModel boardModel = new BoardModel();
	 * 
	 * boardModel.setBoard_num(board_num); boardModel.setBoard_title("[re] "
	 * +board_title); boardModel.setBoard_pw(board_pw);
	 * boardModel.setBoard_content(board_content);
	 * boardModel.setMember_id(session_id); boardModel.setBoard_type(board_type);
	 * 
	 * boardService.BoardReply(boardModel);
	 * 
	 * mv.addObject("boardModel", boardModel); mv.setViewName("BoardReply");
	 * 
	 * return "redirect:boardList.do"; }
	 */
	@RequestMapping(value = "/board/BoardReply.do", method = RequestMethod.POST)
	public ModelAndView BoardReply(@ModelAttribute("BoardModel") BoardModel boardModel, HttpServletRequest request) {

		mv = new ModelAndView();
		// System.out.println(qnaModel.getPasswd());
		int board_num = Integer.parseInt(request.getParameter("board_num"));

		boardModel.setRef(board_num);
		boardModel.setRe_step(1);

		/* boardModel.setBoard_pw("admin"); */

		String content = boardModel.getBoard_content().replaceAll("\r\n", "<br />");
		boardModel.setBoard_content(content);
		boardService.BoardReply(boardModel);

		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/board/boardList.do");
		return mv;
	}

	// 비밀번호 확인 폼
	@RequestMapping(value = "/board/checkForm.do", method = RequestMethod.GET)
	public ModelAndView passwdCheck(@ModelAttribute("boardModel") BoardModel boardModel, BindingResult result,
			HttpServletRequest request) {
		mv = new ModelAndView();
		String board_num = request.getParameter("board_num");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		int ref = 0;
		
		if (!(request.getParameter("ref") == null || request.getParameter("ref").trim().isEmpty()|| request.getParameter("ref").equals("0"))) {
			ref = Integer.parseInt(request.getParameter("ref"));
		}

		mv.addObject("board_num", board_num);
		mv.addObject("currentPage", currentPage);
		mv.addObject("ref", ref);
		mv.setViewName("adminboard/passwordCheck");

		return mv;
	}

	// 비밀번호 확인 액션
	@RequestMapping(value = "/board/checkAction.do", method = RequestMethod.POST)
	public ModelAndView passwdCheck2(@ModelAttribute("boardModel") BoardModel boardModel, BindingResult result,
			HttpSession session, HttpServletRequest request) {

		mv = new ModelAndView();

		int modi;
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		String pass = request.getParameter("board_pw");

		BoardModel boardModel1 = new BoardModel();
		boardModel1 = boardService.boardDetail(board_num);

		if (boardModel1.getBoard_pw().equals(pass)) {
			modi = 1;
		} else {
			modi = 2;
		}

		mv.addObject("modi", modi);
		mv.addObject("boardModel", boardModel1);
		mv.addObject("board_num", board_num);
		mv.addObject("currentPage", currentPage);
		mv.addObject("ref", ref);
		mv.setViewName("adminboard/pwSuccess");

		return mv;
	}

	// 4.게시글 수정
	/*
	 * @RequestMapping(value="/board/boardModify.do", method = RequestMethod.GET)
	 * public String boardModify(HttpServletRequest request, HttpSession session,
	 * Model model) {
	 * 
	 * session_id = (String) session.getAttribute("member_id");
	 * 
	 * int num = Integer.parseInt(request.getParameter("board_num"));
	 * 
	 * BoardModel view = boardService.boardDetail(num);
	 * //System.out.println(view.getBoard_content()); model.addAttribute("view",
	 * view); model.addAttribute("member_id", session_id);
	 * mv.setViewName("boardModify");
	 * 
	 * return "boardWrite"; }
	 */
	@RequestMapping(value = "/board/boardModify.do", method = RequestMethod.GET)
	public ModelAndView modifyForm(@ModelAttribute("boardModel") BoardModel boardModel, BindingResult result,
			HttpServletRequest request) {

		mv = new ModelAndView();

		int board_num = Integer.parseInt(request.getParameter("board_num"));

		boardModel = boardService.boardDetail(board_num);
		boardModel.setBoard_num(board_num);

		mv.addObject("boardModel", boardModel);
		mv.setViewName("boardModify");

		return mv;
	}

	/*
	 * @RequestMapping(value="/board/boardModifyProc.do", method =
	 * RequestMethod.POST) public String boardModify(@RequestParam int
	 * board_num,@RequestParam String board_title, @RequestParam String
	 * board_pw, @RequestParam String board_content, int board_type, HttpSession
	 * session) throws Exception {
	 * 
	 * mv = new ModelAndView(); session_id = (String)
	 * session.getAttribute("member_id"); BoardModel boardModel = new BoardModel();
	 * 
	 * boardModel.setBoard_num(board_num); boardModel.setBoard_title(board_title);
	 * boardModel.setBoard_pw(board_pw); boardModel.setBoard_content(board_content);
	 * boardModel.setMember_id(session_id); boardModel.setBoard_type(board_type);
	 * boardService.BoardModify(boardModel);
	 * 
	 * mv.addObject("boardModel", boardModel); mv.setViewName("boardModify");
	 * 
	 * return "redirect:boardList.do"; }
	 */
	@RequestMapping(value = "/board/boardModify.do", method = RequestMethod.POST)
	public ModelAndView boardModify(@ModelAttribute("boardModel") BoardModel boardModel, BindingResult result,
			HttpServletRequest request) {

		mv = new ModelAndView();

		boardService.boardModify(boardModel);

		mv.addObject("boardModel", boardModel);
		mv.setViewName("redirect:/board/boardList.do");

		return mv;
	}

	// 5.게시글 삭제
	@RequestMapping(value = "/board/BoardDelete.do")
	public ModelAndView boardDelete(@RequestParam int board_num, @RequestParam int ref, @RequestParam int currentPage)
			throws Exception {

		mv = new ModelAndView();

		boardService.BoardDelete(board_num);

		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/board/boardList.do");

		return mv;
	}
	
	// 게시글 원문삭제
	@RequestMapping(value = "/board/BoardAllDelete.do")
	public ModelAndView boardAllDelete(@RequestParam int board_num, @RequestParam int ref, @RequestParam int currentPage)
			throws Exception {
		
		mv = new ModelAndView();
		
		boardService.BoardAllDelete(board_num);
		
		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/board/boardList.do");

		return mv;
	
	}

}
