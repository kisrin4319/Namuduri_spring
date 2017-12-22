package com.spring.faq;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.faq.FaqService;
import com.spring.faq.FaqModel;
import com.spring.common.Paging;

@Controller
public class FaqController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource
	private FaqService faqService;

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

	// 1. faq 목록
	@RequestMapping(value = "/faq/faqList.do")
	public ModelAndView FaqList(HttpServletRequest request) throws Exception {
		mv = new ModelAndView();
		
		List<FaqModel> faqList = new ArrayList<FaqModel>();
		List<FaqModel> AfaqList = new ArrayList<FaqModel>();
		List<FaqModel> BfaqList = new ArrayList<FaqModel>();
		List<FaqModel> CfaqList = new ArrayList<FaqModel>();
		List<FaqModel> DfaqList = new ArrayList<FaqModel>();

		AfaqList = faqService.AfaqList();
		BfaqList = faqService.BfaqList();
		CfaqList = faqService.CfaqList();
		DfaqList = faqService.DfaqList();
		
		faqList.addAll(faqService.faqList());
				
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		isSearch = request.getParameter("isSearch");
		
		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));

			if (searchNum == 1)
				faqList = faqService.Search1(isSearch);
			else if (searchNum == 2)
				faqList = faqService.Search2(isSearch);
					
			paging = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString();
		} else {
			paging = new Paging(currentPage, totalCount, blockCount, blockPage, "faqList");
			pagingHtml = paging.getPagingHtml().toString();
		}
		
		totalCount = faqList.size();
	
		int lastCount = totalCount;
			
		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
		
		faqList = faqList.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("isSearch", isSearch);
		mv.addObject("searchNum", searchNum);
		mv.addObject("faqList", faqList);
		mv.addObject("AfaqList", AfaqList);
		mv.addObject("BfaqList", BfaqList);
		mv.addObject("CfaqList", CfaqList);
		mv.addObject("DfaqList", DfaqList);
		mv.addObject("listCount", faqList.size());
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.setViewName("faqList");

		return mv;
	}
	
	//2. faq 내용 보기
	@RequestMapping(value = "/faq/faqDetail.do", method = RequestMethod.GET)
	public ModelAndView faqDetail(HttpServletRequest request, HttpSession session) {

		mv = new ModelAndView();
		System.out.println(request.getParameter("faq_num"));
		Map<String, Object> map = new HashMap<String, Object>();
		int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		
		
		FaqModel faqModel = faqService.faqDetail(faq_num);

		map.put("readcount", faqModel.getReadcount());
		map.put("faq_num", faq_num);
		
		
		faqService.updateReadcount(map);
		session_id = (String) session.getAttribute("member_id");

		mv.addObject("faq_num", faq_num);
		mv.addObject("currentPage", currentPage);
		mv.addObject("faqModel", faqModel);
		mv.setViewName("faqDetail");

		return mv;
	}
	
	
	//3. faq 작성
	@RequestMapping(value = "/faq/faqWrite.do", method = RequestMethod.GET)
	public ModelAndView faqWrite(HttpServletRequest request) {
		mv = new ModelAndView();
		mv.setViewName("faqWrite");
		return mv;
	}
	
	@RequestMapping(value = "/faq/faqWrite.do", method = RequestMethod.POST)
	public String faqWriteSql(@ModelAttribute("faqModel") FaqModel faqModel, HttpServletRequest request) {

		faqService.faqWrite(faqModel);

		return "redirect:/faq/faqList.do";
	}
	
	// 4.faq 수정
	@RequestMapping(value = "/faq/faqModify.do", method = RequestMethod.GET)
	public ModelAndView modifyForm(@ModelAttribute("faqModel") FaqModel faqModel, BindingResult result,
			HttpServletRequest request) {

		mv = new ModelAndView();

		int faq_num = Integer.parseInt(request.getParameter("faq_num"));

		faqModel = faqService.faqDetail(faq_num);
		faqModel.setFaq_num(faq_num);

		mv.addObject("faqModel", faqModel);
		mv.setViewName("faqModify");

		return mv;
	}
	
	@RequestMapping(value = "/faq/faqModify.do", method = RequestMethod.POST)
	public ModelAndView faqModify(@ModelAttribute("faqModel") FaqModel faqModel, BindingResult result,
			HttpServletRequest request) {

		mv = new ModelAndView();

		faqService.faqModify(faqModel);

		mv.addObject("faqModel", faqModel);
		mv.setViewName("redirect:/faq/faqList.do");

		return mv;
	}
	
	// 5.faq 삭제
	@RequestMapping(value = "/faq/faqDelete.do")
	public ModelAndView faqDelete(@RequestParam int faq_num, @RequestParam int currentPage)
			throws Exception {

		mv = new ModelAndView();

		faqService.faqDelete(faq_num);

		mv.addObject("currentPage", currentPage);
		mv.setViewName("redirect:/faq/faqList.do");

		return mv;
	}
	
}
