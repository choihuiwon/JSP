package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import db.DBManager;
import dto.QnADto;
import vo.MemberVo;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private SqlSession session;
	private MemberDao() {
		session = DBManager.getInstance().getSession();
	}

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	public void insertMemberVo(MemberVo vo) {
		session.insert("member.insertMemberVo", vo);
	}

	public MemberVo selectMemberVo(String id) {
		return session.selectOne("member.selectMemberVo", id);
	}

	public String findPass(String id, String name) {
		String pass = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		pass = session.selectOne("member.findPass",map);
		return pass;
	}
	
	public int updatePass(String id, String pass) {
		int count = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("passwd", pass);
		count = session.update("member.updatePass", map);
		return count;
	}

	public MemberVo checkLogin(String id, String pass) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("passwd", pass);
		return session.selectOne("member.checkLogin", map);
	}

	public void updateMember(MemberVo vo) {
		session.update("member.updateMember", vo);
	}

	// 회원 등급을 반환하는 메서드
	public String memberGradeName(String id) {
		return session.selectOne("member.memberGradeName", id);
	}

	// 회원 정보 리스트를 반환하는 메서드
	public List<MemberVo> getMemberVoList() {
		return session.selectList("member.getMemberVoList");
	}

	// 검색할 종류와 검색어를 받아 정보 리스트를 반환하는 메서드
	public List<MemberVo> searchMember(String kind, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		return session.selectList("member.searchMember", map);
	}

	// 회원 수정(관리자용)
	public int modifyManageMemberVo(MemberVo vo) {
		int count = 0;
		count = session.update("member.modifyManageMemberVo", vo);
		return count;
	}

	// 회원 삭제(관리자용)
	public int deleteManageMemberVo(String id) {
		int count = 0;
		count = session.delete("member.deleteManageMemberVo", id);
		return count;
	}

	// 문의 등록
	public int sendQnA(QnADto dto) throws Exception {
		int count = 0;
		count = session.insert("member.sendQnA", dto);
		return count;
	}

	// 문의 목록 회원용
	public List<QnADto> selectQnAList(String id, int pageNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pageNo", pageNo);
		return session.selectList("member.selectQnAList", map);
	}
	
	// 문의 목록 관리자용
	public List<QnADto> selectQnAAdminList(int pageNo) {
		return session.selectList("member.selectQnAAdminList", pageNo);
	}
	
	// 미답변 문의 조회
	public List<QnADto> selectQnANoAnswerList() {
		return session.selectList("member.selectQnANoAnswerList");
	}

	// 문의 답변 등록
	public int responseQnA(int qno, String res) {
		int count = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qno", qno);
		map.put("res", res);
		count = session.update("member.responseQnA", map);
		return count;
	}

	// 문의 답변 읽음 처리
	public int readQnA(int qno) {
		int count = 0;
		count = session.update("member.readQnA", qno);
		return count;
	}

}
