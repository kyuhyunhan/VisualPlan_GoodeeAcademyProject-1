package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 	1. 모든 파라미터 정보를 Member 객체에 저장
	2. 입력된 비밀번호와 DB에 저장된 비밀번호 비교
		- 같지 않은 경우 : "비밀번호 오류" 메세지 출력 후 updateForm.me 페이지 이동
		- 같은 경우 : 파라미터를 저장하고 있는 Member 객체를 이용하여 db 정보 수정.
			int MemberDao.update(Member) :  결과가 0 이하면 "수정실패" 출력 후 updateForm.me 페이지로 이동.
											결과가 1 이상이면 수정성공, info.me 페이지로 이동. 
 */
public class EditAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPassword(request.getParameter("password"));
		mem.setName(request.getParameter("name"));
		mem.setEmail(request.getParameter("email"));
		
		String msg = "비밀번호가 틀렸습니다.";
		String url = "editForm.me?id="+mem.getId();
		MemberDao dao = new MemberDao();
		Member dbmem = dao.selectOne(mem.getId());
//		String login = (String)request.getSession().getAttribute("login");
		
		if(login.equals("admin") || mem.getPassword().equals(dbmem.getPassword())) {
			int result = dao.edit(mem);
			if(result > 0) {
				return new ActionForward(true,"myInfo.me?id=" + mem.getId());
			} else {
				msg = "수정실패";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}