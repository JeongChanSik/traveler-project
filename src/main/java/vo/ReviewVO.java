package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_idx, page_start, page_end, likecheck;
	private String id, subject, content, region, regdate;
	private MultipartFile image1, image2, image3, image4, image5;
	private String filename1, filename2, filename3, filename4, filename5;
}
