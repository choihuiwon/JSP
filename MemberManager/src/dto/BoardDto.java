package dto;

public class BoardDto {
	private int bno;
	private String title;
	private String bdate;
	private int bcount;
	private String writer;
	private String content;
	private int blike;
	private int bhate;
	private int comment_count;
	
	
	// 게시글 등록용
	public BoardDto(String title, String writer, String content) {
		super();
		this.title = title;
		this.writer = writer;
		this.content = content;
	}
	
	// 게시글 목록 조회용
	public BoardDto(int bno, String title, String bdate, int bcount, String writer, String content, int blike,
			int bhate, int comment_count) {
		super();
		this.bno = bno;
		this.title = title;
		this.bdate = bdate;
		this.bcount = bcount;
		this.writer = writer;
		this.content = content;
		this.blike = blike;
		this.bhate = bhate;
		this.comment_count = comment_count;
	}
	
	// 게시글 조회용
	public BoardDto(int bno, String title, String bdate, int bcount, String writer, String content, int blike,
			int bhate) {
		super();
		this.bno = bno;
		this.title = title;
		this.bdate = bdate;
		this.bcount = bcount;
		this.writer = writer;
		this.content = content;
		this.blike = blike;
		this.bhate = bhate;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getBlike() {
		return blike;
	}
	public void setBlike(int blike) {
		this.blike = blike;
	}
	public int getBhate() {
		return bhate;
	}
	public void setBhate(int bhate) {
		this.bhate = bhate;
	}
	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", title=" + title + ", bdate=" + bdate + ", bcount=" + bcount + ", writer="
				+ writer + ", content=" + content + ", blike=" + blike + ", bhate=" + bhate + "]";
	}
	
	
}
