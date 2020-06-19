package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 	1. ��� �Ķ���� ������ Member ��ü�� ����
	2. �Էµ� ��й�ȣ�� DB�� ����� ��й�ȣ ��
		- ���� ���� ��� : "��й�ȣ ����" �޼��� ��� �� updateForm.me ������ �̵�
		- ���� ��� : �Ķ���͸� �����ϰ� �ִ� Member ��ü�� �̿��Ͽ� db ���� ����.
			int MemberDao.update(Member) :  ����� 0 ���ϸ� "��������" ��� �� updateForm.me �������� �̵�.
											����� 1 �̻��̸� ��������, info.me �������� �̵�. 
 */
public class EditAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new Member();
		mem.setId(request.getParameter("id"));
		mem.setPassword(request.getParameter("password"));
		mem.setName(request.getParameter("name"));
		mem.setEmail(request.getParameter("email"));
		
		String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
		String url = "editForm.me?id="+mem.getId();
		MemberDao dao = new MemberDao();
		Member dbmem = dao.selectOne(mem.getId());
//		String login = (String)request.getSession().getAttribute("login");
		
		if(login.equals("admin") || mem.getPassword().equals(dbmem.getPassword())) {
			int result = dao.edit(mem);
			if(result > 0) {
				return new ActionForward(true,"myInfo.me?id=" + mem.getId());
			} else {
				msg = "��������";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}