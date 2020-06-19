package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 1. �α׾ƿ������� ���, "�α����ϼ���" �޼��� ���
		�ٸ� ������� ��й�ȣ ���� �Ұ�
		opener �������� loginForm.jsp �������� �̵�
		���� ������ �ݱ�
	2. pass, chgpass �Ķ���� �� ����
	3. pass ��й�ȣ�� DB�� ����� ��й�ȣ�� ���� ������ "��й�ȣ ����" �޼��� ���. passwordForm.jsp �������� �̵�.
	4. pass ��й�ȣ�� DB�� ����� ��й�ȣ�� ������ ��й�ȣ ����. opener �������� updateForm.jsp �������� �̵�. ���� ������ �ݱ�.
 */
public class PwChangeAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		boolean opener = false;
		boolean closer = false;
		String msg = "��й�ȣ �����Դϴ�. Ȯ���ϼ���";
		String url = "pwChangeForm.me";
		
		String password = request.getParameter("password");
		String chgpw = request.getParameter("chgpw");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		
		if(password.equals(mem.getPassword())) {
			closer = true;
			if(dao.editPw(login,chgpw) > 0) {
				opener = true;
				msg = "��й�ȣ�� ����Ǿ����ϴ�.";
				url = "myInfo.me?id=" + login;
			} else {
				msg = "��й�ȣ ���� �� ������ �߻��߽��ϴ�.";
			}
		}
		request.setAttribute("opener", opener);
		request.setAttribute("closer", closer);
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward();
	}
}