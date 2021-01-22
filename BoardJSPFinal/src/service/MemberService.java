package service;

import java.util.List;

import dao.MemberDao;
import dto.QnADto;
import exception.MemberException;
import vo.MemberVo;

public class MemberService {
	private static MemberService instance = new MemberService();
	private MemberDao dao;
	private MemberService() {
		dao = MemberDao.getInstance();
	}
	public static MemberService getInstance() {
		if(instance == null)
			instance = new MemberService();
		return instance;
	}
	
	// 회원가입
	public void insertMemberVo(MemberVo vo) throws Exception {
		if(dao.selectMemberVo(vo.getId()) != null)
			throw new MemberException("이미 회원정보가 있습니다.");
		dao.insertMemberVo(vo);
	}
	
	// 비밀번호 수정 전 회원정보 확인
	public void findMemberVo(String id, String name) throws Exception {
		MemberVo vo = dao.selectMemberVo(id);
		if(!vo.getName().equals(name))
			throw new Exception("정보에 해당하는 회원정보가 없습니다.");
	}
	
	// 비밀번호 수정
	public int updatePass(String id, String pass) {
		int count = 0;
		count = dao.updatePass(id,pass);
		return count;
	}
	
	// 로그인
	public MemberVo checkLogin(String id, String pass){
		return dao.checkLogin(id, pass);
	}
	
	// 회원정보 수정
	public void modifyMemberVo(MemberVo vo) throws Exception {
		dao.updateMember(vo);
	}
	
	// 회원 검색
	public List<MemberVo> searchMember(String kind, String search) {
		return dao.searchMember(kind, search);
	}
	
	// 회원 수정(관리자용)
	public int modifyManageMemberVo(MemberVo vo) {
		return dao.modifyManageMemberVo(vo);
	}
	
	// 회원 삭제(관리자용)
	public int deleteManageMemberVo(String id) {
		return dao.deleteManageMemberVo(id);
	}
	
	// 문의 등록
	public void sendQnA(QnADto dto) throws Exception {
		dao.sendQnA(dto);
	}
	
	// 문의 목록
	public List<QnADto> selectQnAList(String id, int pageNo, String grade) {
		if(grade.equals("0")) 
			return dao.selectQnAAdminList(pageNo);
		return dao.selectQnAList(id, pageNo);
	}
	
	// 문의 답변 등록
	public int responseQnA(int qno, String res) {
		return dao.responseQnA(qno, res);
	}
	
	// 문의 답변 읽음 처리
	public int readQnA(int qno) {
		return dao.readQnA(qno);
	}
	
	// 비밀번호 찾기
	public String findPass(String id, String name) {
		return dao.findPass(id, name);
	}
	
	// 회원 목록 가져오기(관리자)
	public List<MemberVo> getMemberVoList() {
		return dao.getMemberVoList();
	}
}
