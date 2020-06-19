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
    //init() servelet�� ��üȭ�� �� ȣ��Ǵ� �޼���. (�ʱ�ȭ����)
    //���: action.properties ������ �о, Ŭ������ �̸��� �ش��ϴ� ��ü�� ����
    //		commandMap��ü�� ����
    @Override
    public void init(ServletConfig config) throws ServletException {
    	// props : action.properties ����
    	String props = config.getInitParameter("properties");
    	// Properties : Hashtable Ŭ������ �ڼ� Ŭ����
    	//				Key�� Value�� ��� String�� Ŭ����
    	// Hashtable : Map �������̽� ����Ŭ����(Hashtable�� Map�̴�)
    	// Map : (Key, Value)���� ��ü��.
    	Properties pr = new Properties();
    	FileInputStream f = null;
    	try {
    		// f: action.properties ���� ����.
    		f = new FileInputStream(config.getServletContext().getRealPath("/")+"WEB-INF/"+props);
    		// action.properties ������ ������ Map��ü�� �ε�.
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
    		// command(key��) : /model2/hello.me
    		String command = (String)k;
    		// className = action.HelloAction
    		String className = pr.getProperty(command);
    		try {
    			// commandClass : action.HelloAction Ŭ���� ����
    			Class commandClass = Class.forName(className.trim());
    			// commandObj : action.HelloAction Ŭ���� ��ü
    			Object commandObj = commandClass.newInstance();	//��üȭ
    			commandMap.put(command, (Action)commandObj);
    		} catch (Exception e) {
    			throw new ServletException(e);
    		}
    	}
    }
    //Get ��� ��û �� ȣ��Ǵ� �޼���
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			// command : /model2/hello.me
			command = request.getRequestURI().substring(request.getContextPath().length());
			// action : action.HelloAction ��ü ����
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
				disp.forward(request,  response);	//hello.jsp forward��
			}
		}
	}
	//Post ��� ��û �� ȣ��Ǵ� �޼���.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}