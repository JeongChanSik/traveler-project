package com.korea.last;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.MemberDAO;
import util.Common;
import vo.MemberVO;
import vo.MyimgVO;

@Controller
public class loginController {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpSession session;
	@Autowired
	ServletContext application;
	
	 
	MemberDAO member_dao;
	
	
	public loginController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	


	//추후 마이페이지로 수정.
	@RequestMapping("mypage.do")
		public String mainpage(Model model) {
		request.getSession();

		
			//세션에서 vo값 받아올 방법 찾기.
		return "redirect:myimg_check.do";
		
		}
	
	@RequestMapping("myimg_check.do")
		public String myimg_check(Model model, MemberVO vo) {
			
			int member_idx = (Integer)session.getAttribute("memberIdx");
		
			MyimgVO res=member_dao.my_img(member_idx);
			
			model.addAttribute("m_ivo",res);

		
		return Common.MEMBER_PATH+"mypage.jsp";
		
	}
	
	
	
	//로그인 페이지.
	@RequestMapping(value = {"login.do"})
		public String login() {
			return Common.MEMBER_PATH+"login.jsp";
		}
	
	//통상 로그인 페이지
	@RequestMapping("nomal_login.do")
		public String nomal_login() {
			return Common.MEMBER_PATH+"nomal_login.jsp";
	}
	
	//어드민 로그인 페이지
	@RequestMapping("admin_login.do")
	public String admin_login() {
		return Common.MEMBER_PATH+"admin_login.jsp";
	}	
	
	
	//계정 로그인 페이지
	@RequestMapping("userlogin.do")
	@ResponseBody
	public String userlogin(Model model, String id, String pw) {
		
		
		MemberVO vo = member_dao.userlogin(id);
		
		
		
		//아이디 없을 때 반환할 값.
		if(vo == null) {
			return "[{'check':'id_null'}]";
		}
		
		//관리자가 일반로그인 시도시.
		if(vo.getId().contains("admin")) {
			return "[{'check':'admin'}]";
		  }
		
		//비밀번호가 일치하지 않을 시 반환할 값.
		if(!vo.getPw().equals(pw)) {
			return "[{'check':'pw_error'}]";
		}
		

		
		model.addAttribute("vo",vo);
		//로그인 성공시 저장할 세션. 
		session.setAttribute("vo", vo);
		//마이페이지에 올린 이미지가 있나 확인하기 위한 세션
		session.setAttribute("memberIdx", vo.getMember_idx());
		
			
		//결과값 반환.
		return "[{'check':'permission'}]";
	}
	
	
	//관리자 로그인 페이지
	@RequestMapping("adminlogin.do")
	@ResponseBody
	public String adminlogin(Model model, String id, String pw) {
		
		MemberVO vo = member_dao.userlogin(id);


		
		//아이디 없을 때 반환할 값.
		if(vo == null) {
			return "[{'check':'id_null'}]";
		}
		
		//관리자가 일반로그인 시도시.
		if(!vo.getId().contains("admin")) {
			return "[{'check':'notadmin'}]";
		  }
		
		//비밀번호가 일치하지 않을 시 반환할 값.
		if(!vo.getPw().equals(pw)) {
			return "[{'check':'pw_error'}]";
		}
		

		model.addAttribute("vo",vo);
		
		//로그인 성공시 저장할 세션.
		session.setAttribute("vo", vo);
		//마이페이지에 올린 이미지가 있나 확인하기 위한 세션
		session.setAttribute("memberIdx", vo.getMember_idx());
		
			
		//결과값 반환.
		
		
		return "[{'check':'permission'}]";
	}
	
	//로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		session.removeAttribute("vo");
		
		return "redirect:nomal_login.do";
	}
	
	
	
	//회원가입.
	@RequestMapping("Member_insert.do")
	public String Member_insert() {
		return Common.MEMBER_PATH+"Member_insert.jsp";
	}
	
	//회원추가
	@RequestMapping("insert.do")
	public String insert(MemberVO vo) {
		int res = member_dao.member_insert(vo);
		if(res>0) {
			return "redirect:nomal_login.do";
			
		}
		return null;
	}
	
	//정보 수정페이지로 이동
	@RequestMapping("m_update.do")
	public String m_update(MemberVO vo) {
		return Common.MEMBER_PATH+"member_update.jsp";
	}
	
	//회원정보 수정
	@RequestMapping("member_update.do")
	public String member_update(MemberVO vo) {
		int res= member_dao.member_update(vo);
		if(res>0) {
			return "redirect:mypage.do";
		}
		return null;
	}
	
	//삭제를 위한 데이터 패스
	@RequestMapping("m_delete_pass.do")
	public String m_delete_pass(String id) {
		request.getSession();
		return Common.MEMBER_PATH+"member_delete.jsp";
	}
	
	//회원 삭제
	@RequestMapping("m_delete.do")
	public String m_delete(String id) {
		MemberVO vo = member_dao.userlogin(id);
		System.out.println(id);
		int res = member_dao.member_delete(vo);
		if(res>0) {
			session.removeAttribute("vo");
			return Common.MEMBER_PATH+"member_delete2.jsp";
		}
		return null;
	}
	
	//ID중복체크
	@RequestMapping("id_check.do")
	@ResponseBody
	public String id_check(String id) {
		System.out.println(id);
		int res = member_dao.id_check(id);
		System.out.println(res);
		
		if(res>0) {
			return "[{'res':'no'}]";
		}
		
		return "[{'res':'yes'}]";
	}
	
	
	//아이디 찾기
	@RequestMapping("Mid_find.do")
	public String Mid_find() {
		return Common.MEMBER_PATH+"Mid_find.jsp";
	}
	
	//아이디 찾기 정보 전달
	@RequestMapping("f_id.do")
	public String f_id(Model model, String name, String tel) {
		//넘겨 받는 값은 name랑 tel
		HashMap<String, String> map =new HashMap<String, String>();
		
		map.put("name", name);
		map.put("tel", tel);
		//넘겨줘야 하는 파라미터는 두 개.
		String id = member_dao.f_id(map);
		
		model.addAttribute("id",id);
				
		System.out.println(id);
		
		return Common.MEMBER_PATH+"Mid_find2.jsp";
	}

	
	//비밀번호 찾기
	@RequestMapping("Mpw_find.do")
	public String Mpw_find() {
		return Common.MEMBER_PATH+"Mpw_find.jsp";
	}
	
	
	//비밀번호 수정을 위해 idx 받아오기.
	@RequestMapping("f_pw.do")
	public String f_pw(Model model, String id, String tel) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("tel", tel);
		int idx = member_dao.f_pw(map);
		
		model.addAttribute("idx",idx);

		
		return Common.MEMBER_PATH+"Mpw_find2.jsp";
	}

	//비밀번호 변경
	@RequestMapping("change_pw.do")
	public String change_pw(String pw, int member_idx) {
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		
		System.out.println(pw);
		System.out.println(member_idx);
		map.put("pw", pw);
		map.put("member_idx", member_idx);
		
		int res = member_dao.change_pw(map);
		
		if(res>0) {
			return Common.MEMBER_PATH+"Mpw_find3.jsp";
		}
			return null;
		}
	
	//마이페이지, 프로필 이미지 변경창 이동
	@RequestMapping("my_img.do")
	public String my_img() {
		return Common.MEMBER_PATH+"my_img.jsp";
	}

	//이미지변경
	@RequestMapping("img_change.do")
	public String myimg_insert(Model model, MyimgVO vo) {
		// 경로잡기
		String webPath = "/resources/my_img";
		String savePath = application.getRealPath(webPath);
		System.out.println(savePath);
		
		// 업로드 된 파일의 정보
		MultipartFile image = vo.getImage();
		String filename = "no_file";
		
		System.out.println(image);

		
		if(!image.isEmpty()) {
			filename = image.getOriginalFilename();
			
			File saveFile = new File(savePath, filename);
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}else {
				//동일 파일 명 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time,filename);
				saveFile = new File(savePath,filename);
			}
			
			// 물리적으로 파일을 업로드하는 코드
			try {
				image.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}

		vo.setFilename(filename);

		int res = member_dao.img_change(vo);
		


		return Common.MEMBER_PATH+"img_change_end.jsp"; //리다이렉트로 바꾸거나, 업로드 완료 안내문 띄우는jsp로 연결하기.
	}
        
        
        
}
