package vo;

/*
 * 현재 사용자가 조회하고 있는 페이지 정보
 * 현재 페이지 번호,
 * 전체 글 개수, 
 * 한 페이지당 출력할 글목록 개수
 * 게시판 하단에 나타낼 페이지 번호 개수
*/
public class PaggingVo {
	private int count;							// 전체 게시글 개수
	private final int pageOfContentCount = 7;	// 한 페이지당 출력할 게시글(글목록) 개수
	private final int pageGroupOfCount = 4;		// 게시판 하단에 나타낼 페이지 번호 개수
	private int currentPage;					// 현재 페이지 번호
	
	public PaggingVo(int count, int currentPage) {
		super();
		this.count = count;
		this.currentPage = currentPage;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	
	// 총 페이지 개수를 return ex) 64개 게시글이면 총 10페이지
	public int getTotalPage() {
		int totalPage = count/pageOfContentCount;
		if(count % pageOfContentCount != 0)
			totalPage++;
		return totalPage;
		
	}
	
	// 총 페이지 그룹 수 ex) 10페이지이면 3 그룹
	public int getTotalPageGroup() {
		int totalPageGroup = getTotalPage()/pageGroupOfCount;
		if(getTotalPage() % pageGroupOfCount != 0)
			totalPageGroup++;
		return totalPageGroup;
	}
	
	// 현재 페이지의 그룹 번호
	public int getNowPageGroupNo() {
		int nowPageGroupNo = currentPage / pageGroupOfCount;
		if(currentPage % pageGroupOfCount!=0)
			nowPageGroupNo++;
		return nowPageGroupNo;
	}
	
	// 현재 페이지 그룹의 시작 페이지 번호
	public int getStartPageOfPageGroup() {
		return pageGroupOfCount * (getNowPageGroupNo()-1) +1;
	}
	
	// 현재 페이지 그룹의 마지막 페이지 번호
	public int getEndPageOfPageGroup() {
		int endpageOfPageGroup = pageGroupOfCount * getNowPageGroupNo();
		if(getTotalPage() < endpageOfPageGroup)
			endpageOfPageGroup = getTotalPage();
		return endpageOfPageGroup;
	}
	
	// 이전 페이지 그룹이 있는지 체크
	public boolean isPreviousPageGroup() {
		return getNowPageGroupNo()>1;
	}
	
	// 다음 페이지 그룹이 있는지 체크
	public boolean isNextPageGroup() {
		return getTotalPageGroup() > getNowPageGroupNo();
	}
}
