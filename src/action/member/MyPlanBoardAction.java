package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import action.ActionForward;
import model.MPBoard;
import model.MPBoardDao;
import model.Stage;

public class MyPlanBoardAction extends UserLoginAction {
	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		List<MPBoard> mpblist = new MPBoardDao().list(id);
		request.setAttribute("mpblist", mpblist);
		return new ActionForward();
	}
}