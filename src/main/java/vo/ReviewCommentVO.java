package vo;

import lombok.Data;

@Data

public class ReviewCommentVO {
	private int review_comment_idx, review_idx, del_info;
	private String id, review_comment, comment_regdate;
	
}
