package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.korea.last.LikeitController;
import com.korea.last.MainController;
import com.korea.last.QnaController;
import com.korea.last.ReviewController;
import com.korea.last.loginController;

import dao.LikeitDAO;
import dao.MainDAO;
import dao.MemberDAO;
import dao.QnaDAO;
import dao.ReviewDAO;


@Configuration
@EnableWebMvc
// basePackages : 여러 패키지를 탐색할 수 있다.
// @ComponentScan("com.korea.json")
// 컨트롤러뿐만 아니라 Component의 자식 요소를 전부 탐색해서 객체로 만들어준다.

// 어노테이션에도 상속관계가 있다
/*
 *@Component
 *	ㄴ@Controller
 *	ㄴ@Service
 *	ㄴ@Repository
 * */
//컴포넌트의 자식객체가 들어있으면 사실 Controller가 아니어도 만들어질 수 있다.
public class Servlet_Context implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Bean
	public MainController MainController(MainDAO main_dao) {
		return new MainController(main_dao);
	}
	
	@Bean
	public loginController controller(MemberDAO member_dao) {
		return new loginController(member_dao);
	}
	
	@Bean
	public QnaController qnaController(QnaDAO qna_dao) {
		return new QnaController(qna_dao);
	}
	
	
	@Bean 
	public LikeitController boardController(LikeitDAO likeit_dao) { 
		return new LikeitController(likeit_dao); 
	}
	
	@Bean
	public ReviewController reviewController(ReviewDAO review_dao) {
		return new ReviewController(review_dao);
	}
	
}
