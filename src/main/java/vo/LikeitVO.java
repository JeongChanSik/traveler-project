package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeitVO {

	private int like_idx; //pk
	private int member_idx; //멤버fk
	private int review_idx; //리뷰fk
	private int likecheck; //좋아요클릭여부
	
}
