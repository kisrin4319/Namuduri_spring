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
		public ModelAndView efeelog(HttpServletRequest request, HttpSession session) throws Exception {
			
			mv = new ModelAndView();
			List<EFeelogModel> eFeelogList = new ArrayList<EFeelogModel>();
			
			String searchKeyword = request.getParameter("searchKeyword");
			
			int searchNum = 0;
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(request.getParameter("searchNum") != null) {
				searchNum = Integer.parseInt(request.getParameter("searchNum"));
			} else {
				if(searchKeyword == null) {
					eFeelogList = eFeelogService.efeelogSearchList(map);
				}
				map.put("searchNum", searchNum);
				map.put("searchKeyword", searchKeyword);
			}
			
			mv.setViewName("efeelog");
			return mv;
		}
}
			
			/*mv = new ModelAndView();
			
			String session_id = (String) session.getAttribute("member_id");
			MemberModel memberInfo = mypageService.getMemberInfo(session_id);
					
			String searchKeyword = request.getParameter("searchKeyword");
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<BooksModel> booksList = new ArrayList<BooksModel>();
			
			//List<EFeelogModel> efeelogSearch = new ArrayList<EFeelogModel>();
			
			if((searchKeyword == null || searchKeyword.trim().isEmpty() || searchKeyword.equals("0"))) {
				booksList = booksService.booksSearchList(map);
			}
			
			if((searchKeyword == null || searchKeyword.trim().isEmpty() || searchKeyword.equals("0"))) {
				booksList = booksService.booksList(book_category);
			} else {
				map.put("searchKeyword", searchKeyword);
				
				booksList = booksService.booksSearchList(map);
			}*/
			
