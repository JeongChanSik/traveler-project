package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.QnaVO;

public class QnaDAO {

	SqlSession sqlSession;
	
	public QnaDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Q&A 게시물 전체조회
	public List<QnaVO> select(HashMap<String, Integer> map){
		List<QnaVO> list = sqlSession.selectList("q.qna_list", map);
		return list;
	}
	
	//Q&A 게시물 갯수 조회
	public int getRowTotal() {
		int res = sqlSession.selectOne("q.qna_count");
		return res;
	}
	
	//idx에 해당하는 Q&A 게시물 한 건 조회
	public QnaVO selectOne(int qna_idx) {
		QnaVO vo = sqlSession.selectOne("q.qna_one", qna_idx);
		return vo;
	}
	
	//Q&A 게시물 추가
	public int insert(QnaVO vo) {
		int res = sqlSession.insert("q.qna_insert", vo);
		return res;
	}
	
	//Q&A 게시글 삭제
	public int del(QnaVO vo) {
		int res = sqlSession.delete("q.qna_delete", vo);
		return res;
	}
	
	//댓글 추가를 위한 step+1
	public int update_step(QnaVO vo) {
		int res = sqlSession.update("q.qna_update_step", vo);
		return res;
	}
	
	//댓글달기
	public int reply(QnaVO vo) {
		int res = sqlSession.insert("q.qna_reply", vo);
		return res;
	}
	
	//유저idx에 해당하는 게시물만 조회
	public List<QnaVO> my_qna(HashMap<String, Integer> map){
		List<QnaVO> list = sqlSession.selectList("q.my_qna", map);
		return list;
	}
}
