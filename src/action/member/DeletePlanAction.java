package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.MPBoardDao;
import model.StageDao;

public class DeletePlanAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int planno = Integer.parseInt(request.getParameter("planno"));
		
		String msg = "";
		String url = "";
		
		MPBoardDao mpbdao = new MPBoardDao();
		StageDao stagedao = new StageDao();
		if(stagedao.delete(id, planno) && mpbdao.delete(id, planno)) {
			msg = "�÷��� �����Ǿ����ϴ�.";
			url = "myPlanBoard.me";
		} else {
			msg = "������ �߻��߽��ϴ�.";
			url = "planDetail.me?planno=" + planno;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
