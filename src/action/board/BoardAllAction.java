package action.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Board;
import model.MPBoard;
import model.Reply;
import model.ReplyDao;
import model.Stage;
import model.StageDao;
import model.BoardDao;
import model.MPBoardDao;

public class BoardAllAction {
	private BoardDao dao = new BoardDao();
	private MPBoardDao mpbdao = new MPBoardDao(); 
	private ReplyDao repdao = new ReplyDao();
	private StageDao stagedao = new StageDao();
	
	public ActionForward write (HttpServletRequest request, HttpServletResponse response) {
		String msg = "게시물 등록 실패";
		String url = "writeForm.do?btype=" + Integer.parseInt(request.getParameter("btype"));
		
		Board board = new Board();
		board.setBtype(Integer.parseInt(request.getParameter("btype")));
		board.setId(request.getParameter("id"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		int num = dao.maxnum(board);
		board.setBoardno(++num);
		if(dao.insert(board)) {
			msg = "게시물 등록 성공";
			if(board.getBtype()==1) {
				url = "notice.do?btype=1";
			} else {
				url = "freeBoard.do?btype=2";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	public ActionForward list (HttpServletRequest request, HttpServletResponse response) {
		int pageNum = 1;
		int btype = Integer.parseInt(request.getParameter("btype"));
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {}
		
		int limit = 10;
		List<Board> list = dao.list(pageNum, limit, btype);
		
		int boardcount = dao.boardCount(btype);
		int maxpage = (int)((double)boardcount/limit + 0.95);
		int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		int boardnum = boardcount - (pageNum - 1) * limit;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sf.format(new Date());
		
		request.setAttribute("list", list);
		
		request.setAttribute("boardcount", boardcount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("today", today);
		return new ActionForward();
	}
	public ActionForward boardinfo (HttpServletRequest request, HttpServletResponse response) {
		int btype = Integer.parseInt(request.getParameter("btype"));
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		
		List<Reply> replylist = repdao.replylist(btype, boardno);
		int replycount = repdao.replyCount(btype, boardno);
		Board b = dao.selectOne(btype, boardno);
		if(request.getRequestURI().contains("boards/boardInfo.do")) {
			dao.readcntAdd(boardno);
		}
		request.setAttribute("b", b);
		request.setAttribute("replycount", replycount);
		request.setAttribute("replylist", replylist);
		return new ActionForward();
	}
	public ActionForward edit (HttpServletRequest request, HttpServletResponse response) {
		Board board = new Board();

		board.setBtype(Integer.parseInt(request.getParameter("btype")));
	 	board.setBoardno(Integer.parseInt(request.getParameter("boardno")));
		board.setId(request.getParameter("id"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		//2. 비밀번호 검증
		BoardDao dao = new BoardDao();
		Board dbBoard = dao.selectOne(board.getBtype(), board.getBoardno());
		String msg = "";
		String url = "";
		if(dao.edit(board)) {
			msg = "게시글이 수정되었습니다.";
			url = "boardInfo.do?btype=" + request.getParameter("btype") + "&boardno=" + board.getBoardno();
		} else {
			msg = "수정실패";
			url = "editForm.do?btype=" + request.getParameter("btype") + "&boardno="+board.getBoardno();
		} 
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
	 	return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward delete (HttpServletRequest request, HttpServletResponse response) {
		int btype = Integer.parseInt(request.getParameter("btype"));
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		
		String msg = "비밀번호 오류";
		String url = "deleteForm.do?boardno="+boardno;
		
		Board dbBoard = dao.selectOne(btype, boardno);
		
		if(dbBoard == null) {
			msg = "없는 게시글입니다.";
			url = "notice.do?btype=" + btype;
		} else {
			if(dao.delete(boardno)) {
				msg = "게시글이 삭제되었습니다.";
				url = "notice.do?btype=" + btype;
			} else {
				msg = "게시글 삭제 실패";
				url = "boardInfo.do?btype=" + btype + "&boardno=" + boardno;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
	public ActionForward reply (HttpServletRequest request, HttpServletResponse response) {
		String msg = "댓글 등록 실패";
		String url = "boardInfo.do?btype=" + Integer.parseInt(request.getParameter("btype")) 
					 + "&boardno=" + Integer.parseInt(request.getParameter("boardno"));
		
		Reply reply = new Reply();
		reply.setBtype(Integer.parseInt(request.getParameter("btype")));
		reply.setBoardno(Integer.parseInt(request.getParameter("boardno")));
		reply.setId(request.getParameter("id"));
		reply.setComment(request.getParameter("comment"));
		
		int num = repdao.maxnum(reply);
		reply.setReplyno(++num);
		if(repdao.insert(reply)) {
			msg = "댓글 등록 성공";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
	public ActionForward addplan (HttpServletRequest request, HttpServletResponse response) {
		String msg = "플랜 등록 실패";
		String url = "addPlanForm.do";	//에러날것 같은데..
		
		MPBoard mpboard = new MPBoard();
		mpboard.setTitle(request.getParameter("title"));
		mpboard.setDetail(request.getParameter("detail"));
		mpboard.setId(request.getParameter("id"));
		int plannum = mpbdao.maxnum(mpboard);
		mpboard.setPlanno(++plannum);
		if(mpbdao.insert(mpboard)) {
			msg = "플랜등록까지 성공";
		}
		
		String stagetitles[] = request.getParameterValues("stagetitle_cloned");
		String percentagesString[] = request.getParameterValues("percentage_cloned");
		int[] percentages = new int[percentagesString.length];
		for(String s : percentagesString) {
			System.out.println(s);
		}
		for(int i=0;i<percentagesString.length;i++) {
			percentages[i] = Integer.parseInt(percentagesString[i]);
		}
		String memos[] = request.getParameterValues("memo_cloned");
		
		for(int i=0;i<stagetitles.length;i++) {
			Stage stage = new Stage();
			stage.setPlanno(plannum);
			stage.setStagetitle(stagetitles[i]);
			stage.setPercentage(percentages[i]);
			stage.setMemo(memos[i]);
			stage.setChecked(false);
			int stagenum = stagedao.maxnum(stage);
			stage.setStageno(++stagenum);
			if(stagedao.insert(stage)) {
				msg="중간목표 등록까지 성공";
			}
		}
		
//		int num = dao.maxnum(board); 
//		board.setBoardno(++num); 
//		if(dao.insert(board)) {
//			msg = "게시물 등록 성공"; 
//			if(board.getBtype()==1) { 
//				url = "notice.do?btype=1"; 
//			} else { 
//				url = "freeBoard.do?btype=2"; 
//			} 
//		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false, "../alert.jsp");
	}
}
