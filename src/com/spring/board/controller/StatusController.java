package com.spring.board.controller;

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
import com.spring.board.vo.RegisterVo;
import com.spring.board.vo.ScheduleVo;

@Controller
public class StatusController {
	@Autowired
	ScheduleService scheduleService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/status/status_info.do", method = RequestMethod.GET)
	public String status(Locale locale, Model model) throws Exception{
	
		return "status/status_Info.page";
	}
	
	@RequestMapping(value = "/status/viewStatus.do", method = RequestMethod.POST)
	public String statusAction(Locale locale, Model model, ScheduleVo scheduleVo) throws Exception{

		List<ScheduleVo> scheduleList = null;
		scheduleList = scheduleService.optionScheduleList(scheduleVo);
		
		model.addAttribute("scheduleList",scheduleList );
		
		return "status/table_view.empty";
	}
	
	@RequestMapping(value = "/status/viewApplyStatus.do", method = RequestMethod.POST)
	public String statusApplyAction(Locale locale, Model model, ScheduleVo scheduleVo) throws Exception{

		List<RegisterVo> registerList = null;
		registerList = scheduleService.getApplyList(scheduleVo);
		
		model.addAttribute("registerList",registerList);
		
		return "status/table_view2.empty";
	}
	
	@RequestMapping(value = "/status/popup.do", method = RequestMethod.POST)
	public String statusApplyAction(Locale locale, Model model, int registerIdx) throws Exception{

		RegisterVo userInfo = new RegisterVo();
		userInfo = scheduleService.getUserInfo(registerIdx);
		
		model.addAttribute("userInfo",userInfo);
		
		return "status/popup.empty";
	}
	
	@RequestMapping(value = "/status/userCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int check(Locale locale, RegisterVo registerVo) throws Exception{
		
		int result =0;
		result = scheduleService.CheckUserCnt(registerVo);
		return result;
	}
	
}
