package reader;

import javabean.ReaderRegister;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

@WebServlet("/reader/register1")
public class readerRegister extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置头文件
        response.setContentType("application/json; charset=utf8");
        PrintWriter out = response.getWriter();
        // 获取账号密码
        String username = request.getParameter("user");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        // 设置响应map
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        ReaderRegister register = new ReaderRegister();
        String result = null;
        try {
            result = register.login(username, password ,name);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        if (result != null && result.equals("1")) {
            hashMap.put("code", 0);
            hashMap.put("msg", "注册成功");
            hashMap.put("url", request.getContextPath() +"/reader/01readerLogin.jsp");
        }else {
            hashMap.put("code", 1);
            hashMap.put("msg", result);
        }

        JSONObject json = JSONObject.fromObject(hashMap);
        out.write(json.toString());

    }

}
