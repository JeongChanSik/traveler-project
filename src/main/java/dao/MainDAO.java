package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MainVO;

public class MainDAO {

	SqlSession sqlSession;
	
	public MainDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 전체 게시글 조회
	public List<MainVO> selectList(){
		List<MainVO> list = sqlSession.selectList("m.mainpage");
		return list;
	}
	
}
	
