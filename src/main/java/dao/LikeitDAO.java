package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.LikeitVO;
import vo.MemberVO;
import vo.ReviewVO;

public class LikeitDAO {

	SqlSession sqlSession;
	
	public LikeitDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ReviewVO saveHeart(LikeitVO lvo) {
		
		ReviewVO rvo = new ReviewVO();
		//하트누른 게시글 세팅
		rvo.setReview_idx(lvo.getReview_idx()); 
		
		//해당 review 게시글의 likecheck를 +1
		sqlSession.update("l.likecheck_up",rvo);
		
		//좋아요 체크 
		LikeitVO lvoRes = sqlSession.selectOne("l.like_count",lvo);
		
		if(lvoRes == null) {
			//likeit 테이블에 추가
			int result = sqlSession.insert("l.like_insert",lvo);
			
			if(result == 1) {
				//review 테이블에 새로운 좋아요가 추가되면 갱신된 하트 개수 가져오기
				rvo = sqlSession.selectOne("l.review_like",rvo);
				
			}
		}
		
		return rvo;
	}
	
	public ReviewVO removeHeart(LikeitVO lvo) {
					
		
		ReviewVO rvo = new ReviewVO();
		//하트누른 게시글 세팅
		rvo.setReview_idx(lvo.getReview_idx()); 
		
		//해당 review 게시글의 likecheck를 -1
		sqlSession.update("l.likecheck_down",rvo);
		
		//좋아요 체크 
		LikeitVO lvoRes = sqlSession.selectOne("l.like_count",lvo);
		
		if(lvoRes != null) {
			//likeit 테이블에 추가
			int result = sqlSession.delete("l.like_delete",lvo);
			
			if(result == 1) {
				//review 테이블에 새로운 좋아요가 추가되면 갱신된 하트 개수 가져오기
				rvo = sqlSession.selectOne("l.review_like",rvo);
				
			}
		}
		
		return rvo;
	}
	
	//좋아요 게시물 
	public List<ReviewVO> select_likeList(HashMap<String, Integer> map){
		List<ReviewVO> likeList = sqlSession.selectList("l.likeit_list",map);
		return likeList;
	}
	
	//좋아요 여부 확인
	public LikeitVO selectOne(LikeitVO lvo) {
		LikeitVO lvoRes = sqlSession.selectOne("l.like_count",lvo);
		return lvoRes;
	}
	
	//좋아요 게시물 수 조회
	public int getRowTotal(int member_idx) {
		int res = sqlSession.selectOne("l.likeReview_count",member_idx);
		return res;
	}
	
}
