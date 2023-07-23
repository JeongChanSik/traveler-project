package com.korea.last;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.LikeitDAO;
import dao.ReviewDAO;
import util.Common;
import util.ReviewPaging;
import vo.AreaVO;
import vo.LikeitVO;
import vo.MemberVO;
import vo.MustEatVO;
import vo.RegionTourismHomeVO;
import vo.ReviewCommentVO;
import vo.ReviewVO;

@Controller
public class ReviewController {
	
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	@Autowired
	ServletContext application;

	@Autowired
	LikeitDAO likeit_dao;
	ReviewDAO review_dao;
	
	public ReviewController(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	
	/**
	 *  리뷰 전체 리스트
	 */
	@RequestMapping(value = {"review_all_list.do"})
	public String review_list(Model model, String page) {
		
		ReviewVO vo = new ReviewVO();
		
		int nowPage = 1;
		
		if(page != null && !page.isEmpty()) { // 넘어온 page 값이 null 이 아니고 비어있지 않으면,
			nowPage = Integer.parseInt(page);
		}// if end
		
		// 한 페이지에 표시될 게시물의 시작과 끝번호를 계산.
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		vo.setPage_start(start);
		vo.setPage_end(end);
		
		List<ReviewVO> all_list = review_dao.review_all_list(vo);
		
		// 전체 게시물 수 조회
		int rowTotal = review_dao.getRowTotal();
		
		// 페이지 메뉴 생성하기
		String pageMenu = ReviewPaging.getPaging
		("review_all_list.do", nowPage, rowTotal, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		
		model.addAttribute("region", "전체");
		model.addAttribute("review_count", rowTotal);
		model.addAttribute("ReviewpageMenu", pageMenu);
		model.addAttribute("review_list", all_list);
		
		
		return Common.REVIEW_PATH + "review_list.jsp?page=" + nowPage;
	}
	
	/**
	 * 	리뷰 특정 지역 확인
	 * 	AJax
	 */
	@RequestMapping("review_list_check.do")
	@ResponseBody
	public List<ReviewVO> review_list_check(String region, Model model, String page) {
		List<ReviewVO> list = review_dao.review_list_check(region);
		return list;
	}
	
	/**
	 * 	리뷰 특정 지역 리스트
	 * 	AJax resultFn
	 */
	@RequestMapping("review_list.do")
	public String review_list(Model model, String region, String page) {
		ReviewVO vo = new ReviewVO();
		
		int nowPage = 1;
		
		if(page != null && !page.isEmpty()) { // 넘어온 page 값이 null 이 아니고 비어있지 않으면,
			nowPage = Integer.parseInt(page);
		}// if end
		
		// 한 페이지에 표시될 게시물의 시작과 끝번호를 계산.
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		vo.setPage_start(start);
		vo.setPage_end(end);
		vo.setRegion(region);
		
		// 전체 게시물 수 조회
		int rowTotal = review_dao.getRegionRowTotal(region);
		
		// 페이지 메뉴 생성하기
		String pageMenu = ReviewPaging.getPaging
		("review_list.do", nowPage, rowTotal, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		List<ReviewVO> list = review_dao.review_list(vo);
		
		model.addAttribute("region", region);
		model.addAttribute("review_count", rowTotal);
		model.addAttribute("ReviewpageMenu", pageMenu);
		model.addAttribute("review_list", list);
		return Common.REVIEW_PATH + "review_list.jsp?" + page;
	}
	
	/**
	 * 	리뷰 작성 페이지로 이동
	 */
	@RequestMapping("review_insert_form.do")
	public String review_insert_form() {
		return Common.REVIEW_PATH + "review_insert_form.jsp";
	}
	
	/**
	 * 	리뷰 작성하기
	 */
	@RequestMapping("review_insert.do")
	public String review_insert(ReviewVO vo, Model model) {
		
		// 업로드 된 파일의 정보
		MultipartFile image1 = vo.getImage1();
		MultipartFile image2 = vo.getImage2();
		MultipartFile image3 = vo.getImage3();
		MultipartFile image4 = vo.getImage4();
		MultipartFile image5 = vo.getImage5();
		
		// DB에 저장할 파일 이름
		String filename1 = null, filename2 = null, filename3 = null, filename4 = null, filename5 = null; 
		
		// 경로
		String webPath = "resources/review_img/";
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
		if(!image1.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename1 = String.format("%s_%d_%s", vo.getRegion(), time, image1.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename1);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image1.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename1(filename1);
		} else { vo.setFilename1("nofile"); }
		
		if(!image2.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename2 = String.format("%s_%d_%s", vo.getRegion(), time, image2.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename2);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image2.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename2(filename2);
		} else { vo.setFilename2("nofile"); }
		
		if(!image3.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename3 = String.format("%s_%d_%s", vo.getRegion(), time, image3.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename3);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image3.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename3(filename3);
		} else { vo.setFilename3("nofile"); }
		
		if(!image4.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename4 = String.format("%s_%d_%s", vo.getRegion(), time, image4.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename4);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image4.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename4(filename4);
		} else { vo.setFilename4("nofile"); }
		
		if(!image5.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename5 = String.format("%s_%d_%s", vo.getRegion(), time, image5.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename5);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image5.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename5(filename5);
		} else { vo.setFilename5("nofile"); }
		
		int res = review_dao.review_insert(vo);
		
		String insert_result_msg = "yes";
		model.addAttribute("insert_result_msg", insert_result_msg);
		
		return "redirect:review_all_list.do";
	}
	
	/**
	 * 	리뷰 상세보기
	 */
	@RequestMapping("review_view.do")
	public String review_view(int review_idx, String page, String region, Model model) {
		ReviewVO vo = review_dao.review_view(review_idx);
		List<ReviewCommentVO> list = review_dao.review_comment_list(review_idx);
		
		if(session.getAttribute("vo") != null) {
			MemberVO member_vo = (MemberVO)session.getAttribute("vo");
			String member_id = member_vo.getId();
			model.addAttribute("member_id", member_id);
			
			//좋아요 게시물 체크
			LikeitVO lvo = new LikeitVO();
			lvo.setMember_idx(member_vo.getMember_idx());
			lvo.setReview_idx(vo.getReview_idx());
			
			//좋아요 테이블에서 row 가져오기
			LikeitVO lvoRes = likeit_dao.selectOne(lvo);
			model.addAttribute("lvoRes", lvoRes);
		}
		
		model.addAttribute("review_comments_list", list);
		model.addAttribute("review_vo", vo);
		
		return Common.REVIEW_PATH + "review_view.jsp";
	}
	
	/**
	 * 	리뷰 수정 페이지로 이동
	 */
	@RequestMapping("review_modify_form.do")
	public String review_modify_form(int review_idx, String page, Model model) {
		// 리뷰 한건에 대한 정보 가져오기.
		ReviewVO vo = review_dao.review_view(review_idx);
		model.addAttribute("review_vo", vo);
		
		return Common.REVIEW_PATH + "review_modify_form.jsp";
	}
	
	/**
	 * 	리뷰 수정하기
	 */
	@RequestMapping("review_modify.do")
	public String review_modify(ReviewVO vo, String page, Model model) {
		
		// 업로드 된 파일의 정보
		MultipartFile image1 = vo.getImage1();
		MultipartFile image2 = vo.getImage2();
		MultipartFile image3 = vo.getImage3();
		MultipartFile image4 = vo.getImage4();
		MultipartFile image5 = vo.getImage5();
		
		// DB에 저장할 파일 이름
		String filename1 = null, filename2 = null, filename3 = null, filename4 = null, filename5 = null; 
		
		// 경로
		String webPath = "resources/review_img/";
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
		if(!image1.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename1 = String.format("%s_%d_%s", vo.getRegion(), time, image1.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename1);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image1.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename1(filename1);
		} else { vo.setFilename1("nofile"); }
		
		if(!image2.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename2 = String.format("%s_%d_%s", vo.getRegion(), time, image2.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename2);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image2.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename2(filename2);
		} else { vo.setFilename2("nofile"); }
		
		if(!image3.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename3 = String.format("%s_%d_%s", vo.getRegion(), time, image3.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename3);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image3.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename3(filename3);
		} else { vo.setFilename3("nofile"); }
		
		if(!image4.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename4 = String.format("%s_%d_%s", vo.getRegion(), time, image4.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename4);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image4.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			vo.setFilename4(filename4);
		} else { vo.setFilename4("nofile"); }
		
		if(!image5.isEmpty()) {
			// 업로드 된 파일의 실제 이름과 
			long time = System.currentTimeMillis();
			
			// 파일 이름을 [ 지역_파일이름_시간 ] 으로 변경
			filename5 = String.format("%s_%d_%s", vo.getRegion(), time, image5.getOriginalFilename());
			
			// 파일이 저장될 경로
			File saveFile = new File(savePath, filename5);
			
			if(!saveFile.exists()) { saveFile.mkdirs(); } // 만약 경로가 없다면 새로 만든다.
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image5.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {	
				e.printStackTrace();
			}
			vo.setFilename5(filename5);
		} else { vo.setFilename5("nofile"); }
		
		int res = review_dao.review_modify(vo);
		
		String msg = "수정이 완료되었습니다.";
		model.addAttribute("msg", msg);
		
		return "redirect:review_view.do?review_idx=" + vo.getReview_idx() + "&page=" + page;
		
	}
	
	/**
	 * 	리뷰 삭제하기
	 */
	@RequestMapping("review_delet.do")
	public String review_delet(int review_idx, Model model) {
		int res = review_dao.review_delete(review_idx);
		
		String delete_msg = "삭제가 완료되었습니다.";
		model.addAttribute("delete_msg", delete_msg);
		
		return "redirect:review_all_list.do";
	}
	
	/**
	 * 	리뷰에 댓글 달기
	 */
	@RequestMapping("review_comment_insert.do")
	public String review_comment_insert(ReviewCommentVO vo) {
		int res = review_dao.review_comment_insert(vo);
		return "redirect:review_view.do?review_idx=" + vo.getReview_idx();
	}
	
	/**
	 * 	리뷰 댓글 삭제하기
	 */
	@RequestMapping("comment_del.do")
	public String review_del(int review_comment_idx, int review_idx) {
		int res = review_dao.comment_del(review_comment_idx);
		return "redirect:review_view.do?review_idx=" + review_idx;
	}

	/**
	 * 	지도 페이지
	 */
	@RequestMapping("traveler_map.do")
	public String traveler_map() {
		return Common.REVIEW_PATH + "traveler_map.jsp";
	}
	
	/**
	 * 	지역 페이지로 이동
	 */
	@RequestMapping("region_page.do")
	public String region_page(Model model) {
		String area_region = "서울";
		List<AreaVO> region_info_list = review_dao.select_area_info(area_region);
		List<MustEatVO> must_eat_list = review_dao.select_must_eat_info(area_region);
		List<RegionTourismHomeVO> region_tourism_list = review_dao.select_region_tourism_info(area_region);
		
		model.addAttribute("region_info_list", region_info_list);
		model.addAttribute("area_region", area_region);
		model.addAttribute("must_eat_list", must_eat_list);
		model.addAttribute("region_tourism_list", region_tourism_list);
		return Common.REVIEW_PATH + "region_page.jsp";
	}
	
	/**
	 * 	지역별 정보 가져오기
	 */
	@RequestMapping("area_info_che.do")
	@ResponseBody
	public List<AreaVO> area_info_che(String a_region) {
		List<AreaVO> list = review_dao.select_area_info(a_region);
		return list;
	}
	
	@RequestMapping("area_info_result.do")
	public String area_info_result(String a_region, Model model) {
		List<AreaVO> region_info_list = review_dao.select_area_info(a_region);
		List<MustEatVO> must_eat_list = review_dao.select_must_eat_info(a_region);
		List<RegionTourismHomeVO> region_tourism_list = review_dao.select_region_tourism_info(a_region);
		
		String area_region = region_info_list.get(0).getA_region();
		
		model.addAttribute("area_region", area_region);
		model.addAttribute("region_info_list", region_info_list);
		model.addAttribute("must_eat_list", must_eat_list);
		model.addAttribute("region_tourism_list", region_tourism_list);
		
		return Common.REVIEW_PATH + "region_page.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}











































