package service;

import java.util.ArrayList;

import dao.MemberDao;
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
	public void updatePass(String id, String pass) throws MemberException {
		dao.updatePass(id,pass);
	}
	
	// 로그인
	public MemberVo checkLogin(String id, String pass) throws Exception {
		return dao.checkLogin(id, pass);
	}
	
	// 회원정보 수정
	public void modifyMemberVo(MemberVo vo) throws Exception {
		dao.updateMember(vo);
	}
	
	// 회원 검색
	public ArrayList<MemberVo> searchMember(String kind, String search) {
		return dao.searchMember(kind, search);
	}
	
	// 회원 수정(관리자용)
	public boolean modifyManageMemberVo(MemberVo vo) {
		return dao.modifyManageMemberVo(vo);
	}
	
	// 회원 삭제(관리자용)
	public boolean deleteManageMemberVo(String id) {
		return dao.deleteManageMemberVo(id);
	}
}
