package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.LikeitDAO;
import dao.MainDAO;
import dao.MemberDAO;
import dao.QnaDAO;
import dao.ReviewDAO;

// bean객체 만들어줌
@Configuration
public class Context_3_dao {
	
	@Bean
	public MainDAO main_dao(SqlSession sqlSession) {
		return new MainDAO(sqlSession);
	}
	
	@Bean
	public MemberDAO member_dao(SqlSession sqlSession) {
		return new MemberDAO(sqlSession);
	}
	
	@Bean
	public QnaDAO qna_dao(SqlSession sqlSession) {
		return new QnaDAO(sqlSession);
	}
	
	@Bean
	public ReviewDAO review_dao(SqlSession sqlSession) {
		return new ReviewDAO(sqlSession);
	}
	
	 @Bean 
	 public LikeitDAO likeit_dao(SqlSession sqlSession) { 
		 return new	LikeitDAO(sqlSession); 
	 }
	
	}
