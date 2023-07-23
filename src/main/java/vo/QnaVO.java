package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class QnaVO {
	private int qna_idx; //글번호
	private int member_idx; // 유저fk
	private int qna_ref; //참조글 번호 
	private int qna_step; //댓글 순서
	private int qna_depth; //댓글 깊이
	
	private String name; //작성자
	private String pwd; //비밀번호
	private String subject; //제목
	private String content; //내용
	private String regdate; //작성일
}
