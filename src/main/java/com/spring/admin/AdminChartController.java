package com.spring.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;


@RestController
public class AdminChartController {
	
	@Resource
	private AdminService adminService;

	@RequestMapping(value="/admin/chart/member/chartAllM.do", method=RequestMethod.POST)
	public String chartAllM() {
		
		List<ChartModel> list = adminService.chartAllM();
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		System.out.println(json);
		
		return json;
	}
}
