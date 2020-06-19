package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 1. 로그아웃상태인 경우, "로그인하세요" 메세지 출력
		다른 사용자의 비밀번호 변경 불가
		opener 페이지를 loginForm.jsp 페이지로 이동
		현재 페이지 닫기
	2. pass, chgpass 파라미터 값 저장
	3. pass 비밀번호가 DB에 저장된 비밀번호와 같지 않으면 "비밀번호 오류" 메세지 출력. passwordForm.jsp 페이지로 이동.
	4. pass 비밀번호가 DB에 저장된 비밀번호와 같으면 비밀번호 수정. opener 페이지를 updateForm.jsp 페이지로 이동. 현재 페이지 닫기.
 */
public class PwChangeAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		String msg = "비밀번호 오류입니다. 확인하세요";
		String url = "pwChangeForm.me";
		
		String password = request.getParameter("password");
		String chgpw = request.getParameter("chgpw");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		
		if(password.equals(mem.getPassword())) {
			closer = true;
			if(dao.editPw(login,chgpw) > 0) {
				opener = true;
				msg = "비밀번호가 변경되었습니다.";
				url = "myInfo.me?id=" + login;
			} else {
				msg = "비밀번호 변경 시 오류가 발생했습니다.";
			}
		}
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward();
	}
}