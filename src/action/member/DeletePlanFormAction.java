package action.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

public class DeletePlanFormAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		int planno = Integer.parseInt(request.getParameter("planno"));
		request.setAttribute("planno", planno);
		return new ActionForward();
	}

}
