package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
  	1. �Ķ���� ������ Member ��ü�� ����.
	2. Member ��ü�� ������ db�� ����.
	3. ȸ�����Լ��� : loginForm.me ������ �̵�.
	       ȸ�����Խ��� : joinForm.me ������ �̵�.
 */
public class JoinAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPassword(request.getParameter("password"));
		mem.setName(request.getParameter("name"));
		mem.setEmail(request.getParameter("email"));
		
		String msg = "ȸ������ ����";
		String url = "joinForm.me";
		MemberDao dao = new MemberDao();
		int result = dao.insert(mem);
		if(result > 0) {
			msg = mem.getName() + "�� ȸ�� ���� �Ϸ�";
			url = "../home/home.me";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}