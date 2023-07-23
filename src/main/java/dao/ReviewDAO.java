package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.AreaVO;
import vo.MustEatVO;
import vo.RegionTourismHomeVO;
import vo.ReviewCommentVO;
import vo.ReviewVO;

public class ReviewDAO {
	SqlSession sqlSession;
	
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	// 리뷰 전체 리스트 조회
	public List<ReviewVO> review_all_list(ReviewVO vo) {	
		List<ReviewVO> list = sqlSession.selectList("review.review_all_list", vo);
		return list;
	}
	
	// 전체 게시물 수 조회
	public int getRowTotal() {
		int res = sqlSession.selectOne("review.review_count");
		return res;
	}
	
	// 특정 지역 게시물 수 조회
	public int getRegionRowTotal(String region) {
		int res = sqlSession.selectOne("review.review_region_count", region);
		return res;
	}
	
	// 특정 지역 체크
	public List<ReviewVO> review_list_check(String region) {
		List<ReviewVO> list = sqlSession.selectList("review.review_list_check", region);
		return list;
	}
	
	// 리뷰 특정 지역 리스트 조회
	public List<ReviewVO> review_list(ReviewVO vo) {
		List<ReviewVO> list = sqlSession.selectList("review.review_list", vo);
		return list;
	}
	
	// 리뷰 등록하기
	public int review_insert(ReviewVO vo) {
		int res = sqlSession.insert("review.review_insert", vo);
		return res;
	}
	
	// 리뷰 상세보기
	public ReviewVO review_view(int review_idx) {
		ReviewVO vo = sqlSession.selectOne("review.review_view", review_idx);
		return vo;
	}
	
	// 리뷰 수정하기
	public int review_modify(ReviewVO vo) {
		int res = sqlSession.update("review.review_modify", vo);
		return res;
	}
	
	// 리뷰 삭제하기
	public int review_delete(int review_idx) {
		int res = sqlSession.delete("review.review_delete", review_idx);
		return res;
	}
	
	// 리뷰 댓글 리스트
	public List<ReviewCommentVO> review_comment_list(int review_idx) {
		List<ReviewCommentVO> list = sqlSession.selectList("review.review_comment_list", review_idx); 
		return list;
	}
	
	// 리뷰에 댓글 작성하기
	public int review_comment_insert(ReviewCommentVO vo) {
		int res = sqlSession.insert("review.review_comment_insert", vo);
		return res;
	}
	
	// 리뷰에 댓글 삭제하기
	public int comment_del(int review_comment_idx) {
		int res = sqlSession.delete("review.review_comment_delete", review_comment_idx);
		return res;
	}
	
	// 지역페이지 지역별 정보 가져오기
	public List<AreaVO> select_area_info(String a_region) {
		List<AreaVO> list = sqlSession.selectList("review.select_area_info", a_region);
		return list;
	}
	
	// 지역페이지 지역별 맛집 가져오기
	public List<MustEatVO> select_must_eat_info(String m_region) {
		List<MustEatVO> list = sqlSession.selectList("review.select_must_eat_info", m_region);
		return list;
	}
	
	public List<RegionTourismHomeVO> select_region_tourism_info(String t_region) {
		List<RegionTourismHomeVO> list = sqlSession.selectList("review.select_region_tourism_info", t_region);
		return list;
	}
	
}
