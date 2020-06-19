package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
	1. 파라미터 값 저장
	2. db의 정보를 읽어서, 아이디와 비밀번호 비교
	3. 아이디가 없는 경우 
		"아이디가 없습니다" 메세지 출력 후 loginForm.jsp 페이지로 이동
	4. 비밀번호가 틀린 경우
		"비밀번호가 틀렸습니다" 메세지 출력 후 loginForm.jsp 페이지로 이동
	5. 아이디, 비밀번호 일치
		- session 객체에 로그인 정보 저장
		- "--님이 로그인했습니다."메세지 출력 후 home.me 페이지 이동 
*/
public class LoginAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "아이디를 확인하세요";
		String url = "loginForm.me";
		//1. 파라미터 저장
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		//2. db 정보 읽기
		Member mem = new MemberDao().selectOne(id);
		//3. 아이디, 비밀번호 검증
		if(mem != null) {
			if(password.equals(mem.getPassword())) {
				request.getSession().setAttribute("login", id);		//request.getSession()으로 JSP의 session 객체를 가져온다.
				msg = mem.getName() + "님이 로그인했습니다.";
				if(mem.getId().equals("admin")) {
					url = "../home/home.me";
				} else {
					url = "../planboard/myPlanBoard.me";
				}
			} else {
				msg = "비밀번호가 틀립니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
