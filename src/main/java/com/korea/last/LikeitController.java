package com.korea.last;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.LikeitDAO;
import util.Common;
import util.Paging;
import util.ReviewPaging;
import vo.LikeitVO;
import vo.MemberVO;
import vo.ReviewVO;

@Controller
public class LikeitController {

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;

	LikeitDAO likeit_dao;
	
	public LikeitController(LikeitDAO likeit_dao) {
		this.likeit_dao = likeit_dao;
	}
	
	
	//좋아요 플러스
	@RequestMapping("like_insert.do")
	@ResponseBody
	public ReviewVO like_Insert(int idx) {
		
		//현재 로그인 멤버 객체 담기
		MemberVO mvo = (MemberVO)session.getAttribute("vo");
		
		LikeitVO lvo = new LikeitVO();
		//게시글idx 세팅
		lvo.setReview_idx(idx);
		//좋아요 누른 멤버idx 세팅
		lvo.setMember_idx(mvo.getMember_idx());
		
		
		//likecheck+1
		ReviewVO rvo = likeit_dao.saveHeart(lvo);
		
		return rvo;
	}	
	
	//좋아요 리스트
	@RequestMapping("likeit_list.do")
	public String likeit_list(Model model, String page) {
		
		MemberVO mvo = (MemberVO)session.getAttribute("vo");
		
		int nowPage = 1;
		
		if(page != null && !page.isEmpty()) { 
			nowPage = Integer.parseInt(page);
		}
		
		// 한 페이지에 표시될 게시물의 시작과 끝번호를 계산.
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end",end);
		map.put("member_idx", mvo.getMember_idx());
		
		List<ReviewVO> likeList = likeit_dao.select_likeList(map);
		
		//좋아요 게시물 수 조회
		int like_total = likeit_dao.getRowTotal(mvo.getMember_idx());
		
		//페이지 메뉴 생성하기
		String pageMenu = ReviewPaging.getPaging(
				"likeit_list.do",
				nowPage,
				like_total,
				Common.Board.BLOCKLIST,
				Common.Board.BLOCKPAGE
		);
		
		model.addAttribute("likeList",likeList);
		model.addAttribute("like_total", like_total);
		model.addAttribute("pageMenu", pageMenu);
		
		return Common.MEMBER_PATH+"likeit_list.jsp?page="+ nowPage;
	}
	
	//좋아요 마이너스
	@RequestMapping("like_delete")
	@ResponseBody
	public ReviewVO like_delete(int idx) {
		//현재 로그인 멤버 객체 담기
		MemberVO mvo = (MemberVO)session.getAttribute("vo");
				
		LikeitVO lvo = new LikeitVO();
		//게시글idx 세팅
		lvo.setReview_idx(idx);
		//좋아요 누른 멤버idx 세팅
		lvo.setMember_idx(mvo.getMember_idx());
		
		//likecheck-1
		ReviewVO rvo = likeit_dao.removeHeart(lvo);
		
		return rvo;
	}
	
	
	
	
	
	
	
	
	
	
}
