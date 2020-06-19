package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
	1. �Ķ���� �� ����
	2. db�� ������ �о, ���̵�� ��й�ȣ ��
	3. ���̵� ���� ��� 
		"���̵� �����ϴ�" �޼��� ��� �� loginForm.jsp �������� �̵�
	4. ��й�ȣ�� Ʋ�� ���
		"��й�ȣ�� Ʋ�Ƚ��ϴ�" �޼��� ��� �� loginForm.jsp �������� �̵�
	5. ���̵�, ��й�ȣ ��ġ
		- session ��ü�� �α��� ���� ����
		- "--���� �α����߽��ϴ�."�޼��� ��� �� home.me ������ �̵� 
*/
public class LoginAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String msg = "���̵� Ȯ���ϼ���";
		String url = "loginForm.me";
		//1. �Ķ���� ����
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		//2. db ���� �б�
		Member mem = new MemberDao().selectOne(id);
		//3. ���̵�, ��й�ȣ ����
		if(mem != null) {
			if(password.equals(mem.getPassword())) {
				request.getSession().setAttribute("login", id);		//request.getSession()���� JSP�� session ��ü�� �����´�.
				msg = mem.getName() + "���� �α����߽��ϴ�.";
				if(mem.getId().equals("admin")) {
					url = "../home/home.me";
				} else {
					url = "../planboard/myPlanBoard.me";
				}
			} else {
				msg = "��й�ȣ�� Ʋ���ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
