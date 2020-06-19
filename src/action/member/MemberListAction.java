package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.MemberDao;

public class MemberListAction extends AdminLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("memberlist", new MemberDao().memberlist());
		return new ActionForward();
	}

}
