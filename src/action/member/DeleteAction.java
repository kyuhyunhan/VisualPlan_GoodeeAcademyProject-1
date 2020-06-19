package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*	
  	(UserLoginAction에서 처리)
	1. 로그아웃 상태 : "로그인 하세요" 메세지 출력 loginForm.me 페이지 이동
	2. 일반사용자
		- id 파라미터 정보와 login 정보가 다른 경우
			"본인만 탈퇴 가능합니다." 메세지 출력 후 main.me 페이지 이동
			
		----------------------------------------------------
	3. 일반사용자
		- id, pass 정보를 이용하여 비밀번호 검증
		- 비밀번호 불일치 : "비밀번호가 틀림" 메세지 출력 후 deleteForm.me로 페이지 이동.
	     관리자
		- id가 관리자인 경우 탈퇴 불가. list.me 페이지 이동
	4. 탈퇴 성공 : member db에서 delete 처리 완료
		일반사용자 : "삭제 성공" 메세지 출력 후, 로그아웃 실행. loginForm.me 페이지 이동
		관리자 : "삭제 성공" 메세지 출력 후 ,list.me로 페이지 이동
	5. 탈퇴 실패 : member db에서 delete 처리 시 오류 발생
		일반사용자 : "탈퇴 실패" 메세지 출력 후 info.me로 페이지 이동
		관리자 : "삭제 실페" 메세지 출력 후,  list.me로 페이지 이동
 */
public class DeleteAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String password = request.getParameter("password");
		String msg = null;
		String url = null;
		if(id.equals("admin")) { 	//탈퇴 대상이 되는 회원은 관리자 안됨	
			msg = "관리자는 탈퇴할 수 없습니다.";
			url = "../home/home.me";
		} else {
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(id);	//db 정보 조회
			if(login.equals("admin") || password.equals(dbmem.getPassword())) {
				if(dao.delete(id) > 0) {	//삭제 성공
					if(login.equals("admin")) {	//관리자인경우
						msg = id + "사용자를 강제 탈퇴 성공";
						url = "memberlist.me";
					} else {	//일반 사용자인 경우
						msg = id + "님의 회원탈퇴가 완료되었습니다.";
						url = "../home/home.me";
						request.getSession().invalidate();	//로그아웃
					}
				} else {	//삭제 실패
					msg = id + "님의 탈퇴 시 오류 발생";
					if(login.equals("admin")) {	//관리자인 경우
						url = "memberlist.me";
					} else {	//일반 사용자인 경우
						url = "myInfo.me?id=" + id;
					}
				}
			} else {	//일반 사용자가 비밀번호가 틀린경우(!login.equals("admin") && !pass.equals(dbmem.getPass())) 
				msg = id + "님의 비밀번호가 틀립니다.";
				url = "deleteForm.jsp?id=" + id;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}