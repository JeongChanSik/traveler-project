package context;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

// bean객체 만들어줌
@Configuration
public class Context_4_fileupload {
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		
		// 최대 업로드 용량을 약 10MB로 지정한다.
		multipartResolver.setMaxUploadSize(104857600);
		return multipartResolver;
	}
}
