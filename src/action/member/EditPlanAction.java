package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.MPBoard;
import model.MPBoardDao;
import model.Stage;
import model.StageDao;

public class EditPlanAction extends UserLoginAction {
		private MPBoardDao mpbdao = new MPBoardDao();
		private StageDao stagedao = new StageDao();
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg = "플랜 수정 성공";
		String url = "myPlanBoard.me";
		
		MPBoard mpboard = new MPBoard();
		mpboard.setTitle(request.getParameter("title"));
		mpboard.setDetail(request.getParameter("detail"));
		mpboard.setId(request.getParameter("id"));
		mpboard.setPlanno(Integer.parseInt(request.getParameter("planno")));
		if(mpbdao.edit(mpboard)) {
			String stagetitles[] = request.getParameterValues("stagetitle");
			String percentagesString[] = request.getParameterValues("percentage");
			int[] percentages = new int[percentagesString.length];
			for(int i=0;i<percentagesString.length;i++) {
				percentages[i] = Integer.parseInt(percentagesString[i]);
			}
			String memos[] = request.getParameterValues("memo");
			
			int stagenum = 1;
			for(int i=0;i<stagetitles.length;i++) {
				Stage stage = new Stage();
				stage.setId(request.getParameter("id"));
				stage.setPlanno(Integer.parseInt(request.getParameter("planno")));
				stage.setStagetitle(stagetitles[i]);
				stage.setPercentage(percentages[i]);
				stage.setMemo(memos[i]);
				stage.setChecked(false);
				stage.setStageno(stagenum);
				if(stagedao.edit(stage)) {
					stagenum++;
				}
			}
		} else {
			msg = "플랜 수정 실패";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}