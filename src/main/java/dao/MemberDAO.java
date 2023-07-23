package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;
import vo.MyimgVO;


public class MemberDAO {

	SqlSession sqlSession;
	
	
	public MemberDAO(SqlSession sqlSession){
		this.sqlSession =sqlSession;
		
	}
	
	//회원가입 정보기입
	public int member_insert(MemberVO vo) {
		int res = sqlSession.insert("m.member_insert",vo);
		return res;
	}
	
	//id 중복 체크
	public int id_check(String id) {
		int res = sqlSession.selectOne("m.id_check",id);
	
		return res;
	}
	
	//계정 로그인
	
	public MemberVO userlogin(String id) {
		MemberVO vo = sqlSession.selectOne("m.userlogin",id);
		return vo;
	}
	
	//아이디 찾기
	
	public String f_id(HashMap<String, String> map) {
		String id = sqlSession.selectOne("m.f_id",map);
		return id;
	}

	//비밀번호 수정을 위한 idx찾기.
	
	public int f_pw(HashMap<String, String> map) {
		int idx = sqlSession.selectOne("m.f_pw",map);
		return idx;
	}
	
	//비밀번호 수정
	public int change_pw(HashMap<String, Object> map) {
		System.out.println(map); //pw와 idx전송 확인용.
		int res = sqlSession.update("m.c_pw",map);
		return res;
	}

	//회원정보 수정
	public int member_update(MemberVO vo) {
		int res = sqlSession.update("m.member_update",vo);
		return res;
	}

	//회원 탈퇴
	public int member_delete(MemberVO vo) {
		int res = sqlSession.update("m.member_delete",vo);
		return res;
	}
	
	//이미지 수정
	public int img_change(MyimgVO vo) {
		int res = sqlSession.insert("m.myimg_insert",vo);
		return res;
	}
	
	//내 이미지 띄우기
	public MyimgVO my_img(int member_idx) {
		MyimgVO res = sqlSession.selectOne("m.myimg_select",member_idx);
		return res;
	}


}