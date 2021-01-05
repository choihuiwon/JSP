package dto;

public class CommentDto {
	private int cno;
	private int bno;
	private String content;
	private String cdate;
	private String writer;
	private int blike;
	private int bhate;
	
	public CommentDto(int bno, String content, String writer) {
		super();
		this.bno = bno;
		this.content = content;
		this.writer = writer;
	}
	public CommentDto(int cno, int bno, String content, String cdate, String writer, int blike, int bhate) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.content = content;
		this.cdate = cdate;
		this.writer = writer;
		this.blike = blike;
		this.bhate = bhate;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	@Override
	public String toString() {
		return "CommentDto [cno=" + cno + ", bno=" + bno + ", content=" + content + ", cdate=" + cdate + ", writer="
				+ writer + ", blike=" + blike + ", bhate=" + bhate + "]";
	}
	
	
}
