package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
  	1. 파라미터 정보를 Member 객체에 저장.
	2. Member 객체의 정보를 db에 저장.
	3. 회원가입성공 : loginForm.me 페이지 이동.
	       회원가입실패 : joinForm.me 페이지 이동.
 */
public class JoinAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPassword(request.getParameter("password"));
		mem.setName(request.getParameter("name"));
		mem.setEmail(request.getParameter("email"));
		
		String msg = "회원가입 실패";
		String url = "joinForm.me";
		MemberDao dao = new MemberDao();
		int result = dao.insert(mem);
		if(result > 0) {
			msg = mem.getName() + "님 회원 가입 완료";
			url = "../home/home.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}