package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

@WebServlet(urlPatterns= {"*.me"}, initParams = {@WebInitParam(name="properties", value= "action.properties")})
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Map<String,Action> commandMap = new HashMap<String,Action>();
    public ControllerServlet() {
        super();
    }
    //init() servelet이 객체화될 때 호출되는 메서드. (초기화해줌)
    //기능: action.properties 파일을 읽어서, 클래스의 이름에 해당하는 객체를 생성
    //		commandMap객체에 저장
    @Override
    public void init(ServletConfig config) throws ServletException {
    	// props : action.properties 저장
    	String props = config.getInitParameter("properties");
    	// Properties : Hashtable 클래스의 자손 클래스
    	//				Key의 Value가 모두 String인 클래스
    	// Hashtable : Map 인터페이스 구현클래스(Hashtable은 Map이다)
    	// Map : (Key, Value)쌍인 객체들.
    	Properties pr = new Properties();
    	FileInputStream f = null;
    	try {
    		// f: action.properties 파일 선택.
    		f = new FileInputStream(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
    		// action.properties 파일의 내용을 Map객체로 로드.
    		//	/model2/hello.me=action.HelloAction
    		//			(key)	=	(value)
    		pr.load(f);
    	} catch (IOException e) {
    		throw new ServletException(e);
    	} finally {
    		try {
    			if(f != null) f.close();
    		} catch (IOException e) {}
    	}
    	for (Object k : pr.keySet()) {
    		// command(key값) : /model2/hello.me
    		String command = (String)k;
    		// className = action.HelloAction
    		String className = pr.getProperty(command);
    		try {
    			// commandClass : action.HelloAction 클래스 정보
    			Class commandClass = Class.forName(className.trim());
    			// commandObj : action.HelloAction 클래스 객체
    			Object commandObj = commandClass.newInstance();	//객체화
    			commandMap.put(command, (Action)commandObj);
    		} catch (Exception e) {
    			throw new ServletException(e);
    		}
    	}
    }
    //Get 방식 요청 시 호출되는 메서드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			// command : /model2/hello.me
			command = request.getRequestURI().substring(request.getContextPath().length());
			// action : action.HelloAction 객체 저장
			action = commandMap.get(command);
			// forward : new ActionForward(false,"hello.jsp")
			forward = action.execute(request, response);
		} catch (NullPointerException e) {
			forward = new ActionForward();
		} catch (Exception e) {
			throw new ServletException(e);
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getView());
			} else {
				if(forward.getView() == null) {
					forward.setView(command.replace(".me", ".jsp"));
				}
				RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
				disp.forward(request,  response);	//hello.jsp forward됨
			}
		}
	}
	//Post 방식 요청 시 호출되는 메서드.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}