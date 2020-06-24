package action.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.MPBoard;
import model.MPBoardDao;
import model.Stage;
import model.StageDao;

public class PlanDetailAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		int planno = Integer.parseInt(request.getParameter("planno"));
		MPBoard mpb = new MPBoardDao().loaddetail(id, planno);
		List<Stage> stagelist = new StageDao().loaddetail(id, planno);
		
		request.setAttribute("mpb", mpb);
		request.setAttribute("stagelist", stagelist);
		return new ActionForward();
	}
}