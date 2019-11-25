package com.spring.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.ScheduleService;
import com.spring.board.vo.ScheduleVo;
import com.spring.common.CommonUtil;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleService scheduleService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/calendar/edu_calendar.do", method = RequestMethod.GET)
	public String calendar(Locale locale, Model model) throws Exception{
		
		List<ScheduleVo> scheduleList = null;
		scheduleList = scheduleService.selectScheduleList();
		
		model.addAttribute("scheduleList", scheduleList);
		
		return "calendar/education_calendar";
	}
	
	
	@RequestMapping(value = "/calendar/add.do", method = RequestMethod.GET)
	public String add(Locale locale) throws Exception{
		
		return "calendar/add_Schedule";
	}
	@RequestMapping(value = "/calendar/addAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String addAction(Locale locale, ScheduleVo scheduleVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = scheduleService.scheduleInsert(scheduleVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
}
