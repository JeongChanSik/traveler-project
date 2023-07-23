package util;

public class Common {
	// 여러가지 기능들을 편리하게 관리하기 위해서 설정용 클래스를 따로 만듦
	
	public static final String VIEW_PATH = "/WEB-INF/views/main/";
	
	public static final String MEMBER_PATH = "/WEB-INF/views/member/";
	
	public static final String QNA_PATH = "/WEB-INF/views/qna/";
	
	public static final String REVIEW_PATH = "/WEB-INF/views/review/";
	
	public static class Board{
		
		// 한 페이지에 보여줄 게시물 개수
		public final static int BLOCKLIST = 10;
		
		// 페이지 메뉴 개수
		public final static int BLOCKPAGE = 3;
		
		// Common.Board.BLOCKLIST; -> 10
	}
	
}
