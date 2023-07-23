package com.korea.last;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MainDAO;
import util.Common;
import vo.MainVO;

@Controller
public class MainController {
	
	public static final String VIEW_PATH = "/WEB-INF/views/";

	MainDAO main_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	
	public MainController(MainDAO main_dao) {
		this.main_dao = main_dao;
	}
	
	@RequestMapping(value= {"/","mainpage.do"})
	public String list(Model model) {
		List<MainVO> list = main_dao.selectList();
		model.addAttribute("list", list);
		return Common.VIEW_PATH + "mainpage.jsp";
	}
	
	// 개인정보처리방침
	@RequestMapping("info.do")
	public String info() {
		return Common.VIEW_PATH + "info.jsp";
	}
		
	// 이용약관
	@RequestMapping("info2.do")
	public String info2() {
		return Common.VIEW_PATH + "info2.jsp";
	}
	
	// 지역검색
   @RequestMapping("search.do")
   public String search(String region) {
      System.out.println(region);
      return "";
   }
}
