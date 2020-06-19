package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*	
  	(UserLoginAction���� ó��)
	1. �α׾ƿ� ���� : "�α��� �ϼ���" �޼��� ��� loginForm.me ������ �̵�
	2. �Ϲݻ����
		- id �Ķ���� ������ login ������ �ٸ� ���
			"���θ� Ż�� �����մϴ�." �޼��� ��� �� main.me ������ �̵�
			
		----------------------------------------------------
	3. �Ϲݻ����
		- id, pass ������ �̿��Ͽ� ��й�ȣ ����
		- ��й�ȣ ����ġ : "��й�ȣ�� Ʋ��" �޼��� ��� �� deleteForm.me�� ������ �̵�.
	     ������
		- id�� �������� ��� Ż�� �Ұ�. list.me ������ �̵�
	4. Ż�� ���� : member db���� delete ó�� �Ϸ�
		�Ϲݻ���� : "���� ����" �޼��� ��� ��, �α׾ƿ� ����. loginForm.me ������ �̵�
		������ : "���� ����" �޼��� ��� �� ,list.me�� ������ �̵�
	5. Ż�� ���� : member db���� delete ó�� �� ���� �߻�
		�Ϲݻ���� : "Ż�� ����" �޼��� ��� �� info.me�� ������ �̵�
		������ : "���� ����" �޼��� ��� ��,  list.me�� ������ �̵�
 */
public class DeleteAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String password = request.getParameter("password");
		String msg = null;
		String url = null;
		if(id.equals("admin")) { 	//Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�	
			msg = "�����ڴ� Ż���� �� �����ϴ�.";
			url = "../home/home.me";
		} else {
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(id);	//db ���� ��ȸ
			if(login.equals("admin") || password.equals(dbmem.getPassword())) {
				if(dao.delete(id) > 0) {	//���� ����
					if(login.equals("admin")) {	//�������ΰ��
						msg = id + "����ڸ� ���� Ż�� ����";
						url = "memberlist.me";
					} else {	//�Ϲ� ������� ���
						msg = id + "���� ȸ��Ż�� �Ϸ�Ǿ����ϴ�.";
						url = "../home/home.me";
						request.getSession().invalidate();	//�α׾ƿ�
					}
				} else {	//���� ����
					msg = id + "���� Ż�� �� ���� �߻�";
					if(login.equals("admin")) {	//�������� ���
						url = "memberlist.me";
					} else {	//�Ϲ� ������� ���
						url = "myInfo.me?id=" + id;
					}
				}
			} else {	//�Ϲ� ����ڰ� ��й�ȣ�� Ʋ�����(!login.equals("admin") && !pass.equals(dbmem.getPass())) 
				msg = id + "���� ��й�ȣ�� Ʋ���ϴ�.";
				url = "deleteForm.jsp?id=" + id;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}