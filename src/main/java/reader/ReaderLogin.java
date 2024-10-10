package reader;

import javabean.Reader;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet(name = "readerLogin", value = "/login-servlet")
public class ReaderLogin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置头文件
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf8");
		// 获取账号密码
		String user = request.getParameter("user");
		String psw = request.getParameter("psw");
		// 设置响应map

        Reader reader = new Reader();
		String result = null;
		try {
			result = reader.login(user, psw);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
        response.getWriter();
        if (result != null && result.equals("1")) {
			HttpSession session = request.getSession();
			session.setAttribute("reader", user);
			session.setAttribute("reader_first", "1");
			response.sendRedirect("reader/02main.jsp");
		} else {
			response.sendRedirect("reader/09wrong.jsp");
		}
	}

}
