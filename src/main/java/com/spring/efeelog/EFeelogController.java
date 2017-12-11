package com.spring.efeelog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.book.BooksModel;
import com.spring.book.BooksService;
import com.spring.member.MemberModel;
import com.spring.mypage.MypageService;

@Controller
public class EFeelogController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private EFeelogService eFeelogService;
	@Resource
	private MypageService mypageService;
	@Resource
	private BooksService booksService;
	
	ModelAndView mv;
	String session_id;
	
		//7. eFeelog
		@RequestMapping(value = "/eFeelogView.do")
		public ModelAndView efeelog(HttpServletRequest request, HttpSession session) {
			
			mv = new ModelAndView();
			EFeelogModel eFeelogModel = new EFeelogModel();
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			session_id = (String) session.getAttribute("member_id");
			
			List<EFeelogModel> efList = eFeelogService.efeelogList(map);
			
			mv.addObject("efList", efList);
			mv.setViewName("efeelog");
			return mv;
		}
		
		//search form
		@RequestMapping(value = "/efeelogSearchView.do")
		public ModelAndView efeelogSearch() {
			mv = new ModelAndView();
			
			mv.setViewName("mypage/search");
			return mv;
		}
		
		
		//search
		@RequestMapping(value = "/efeelogSearch.do")
		public ModelAndView efeelogSearch(String search, HttpServletRequest request, HttpSession session) throws Exception {
			
			mv = new ModelAndView();
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search", search);
			
			List<BooksModel> eFeelogList = eFeelogService.efeelogSearchList(map);
			
			mv.setViewName("mypage/search");
			mv.addObject("eFeelogList",eFeelogList);
			return mv;
		}
		
		/*@RequestMapping(value = "/eFeelogList.do")
		public ModelAndView efeelogInsert(HttpServletRequest request, HttpSession session) throws Exception {
			
			
		}*/
			
			
			/*mv = new ModelAndView();
			List<BooksModel> booksModel = new ArrayList<BooksModel>();
			EFeelogModel eFeelogModel = new EFeelogModel();
			
			session_id = (String) session.getAttribute("member_id");
			
			List<BooksModel> booksList = eFeelogService.EFeelogDate(booksModel);
			for(int i=0; i<booksList.size(); i++) {
				BooksModel model = booksList.get(i);
				int bookNum = model.getBook_num();
				
				
			}
			eFeelogModel.setEfeelog_image(request.getParameter("book_image"));
			eFeelogModel.setEfeelog_memo(request.getParameter("eFeelog_memo"));
			eFeelogModel.setEfeelog_name(request.getParameter("book_name"));
			eFeelogModel.setMember_id(request.getParameter("member_id"));
			
			eFeelogService.EFeelogInsert(eFeelogModel);
			mv.setViewName("redirect:/eFeelogView.do");
			return mv;*/
			
			/*mv = new ModelAndView();
			BooksModel booksModel = new BooksModel();
			EFeelogModel eFeelogModel = new EFeelogModel();
			
			session_id = (String) session.getAttribute("member_id");
			
			booksModel.setBook_image(request.getParameter("book_image"));
			booksModel.setBook_name(request.getParameter("book_name"));
			
			eFeelogService.EFeelogDate(booksModel);
			
			eFeelogModel.setBook_memo(request.getParameter("book_memo"));
			eFeelogModel.setMember_id(request.getParameter("member_id"));
			
			eFeelogService.EFeelogInsert(eFeelogModel);
			mv.setViewName("redirect:/eFeelogView.do");
			return mv;*/
			
			/*mv = new ModelAndView();
			EFeelogModel eFeelogModel = new EFeelogModel();
			
			session_id = (String) session.getAttribute("member_id");
			
			eFeelogModel.setBook_memo(request.getParameter("book_memo"));
			
			//EFeelogModel EFeelogInsert = eFeelogService.EFeelogInsert(eFeelogModel);
			eFeelogService.EFeelogInsert(eFeelogModel);
			mv.setViewName("redirect:/eFeelogView.do");
			return mv;*/
}
			
			
			
