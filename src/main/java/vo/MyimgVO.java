package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class MyimgVO {

	private int myimg_idx;
	private int member_idx; // fk
	private String filename;
	private String regdate;
	private MultipartFile image;
		
}
