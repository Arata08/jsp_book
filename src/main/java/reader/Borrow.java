package reader;

import javabean.Base;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Borrow
 */
@WebServlet("/reader/borrow")
public class Borrow extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("application/json; charset=utf8");
		// 接收参数
		String limit = req.getParameter("limit");
		String page = req.getParameter("page");
		String condition = req.getParameter("condition");
		String conditionValue = req.getParameter("conditionValue");
		String where = ""; // 无限制条件
		if (page == null) {
			page = "1";
		}
		if (limit == null) {
			limit = "10";
		}
		// 准备查询
		Connection connection = null;
		PreparedStatement pstmt = null;
		PreparedStatement countPstmt = null;
		ResultSet resultSet = null;
		ResultSet countSet = null;
		String sql;
		String countSql;
		// 准备返回参数
		int code = 1;
		String msg = "无数据";
		int count = 0;

		HttpSession session = req.getSession();

		JSONObject jsonData = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject jsonResult = new JSONObject();
		// 进行查询
		try {
			connection = Base.getConnection();
			sql = "select * from borrow_books where card_id = " + session.getAttribute("reader");
			if (condition != null && conditionValue != null && !condition.equals("") && !conditionValue.equals("")) {
				where = " and " + condition + " like '%" + conditionValue + "%' ";
				sql += where;
			}
			sql += " limit ?,?";// 1 10 (1-1)*10
			System.out.println("???" + sql);
			pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, (Integer.parseInt(page) - 1) * Integer.parseInt(limit));
			pstmt.setInt(2, Integer.parseInt(limit));
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				jsonData.put("id", resultSet.getString("id"));
				jsonData.put("card_id", resultSet.getString("card_id"));
				jsonData.put("book_id", resultSet.getString("book_id"));
				jsonData.put("borrow_date", resultSet.getString("borrow_date"));
				jsonData.put("end_date", resultSet.getString("end_date"));
				if (resultSet.getString("return_date")==null) {
					jsonData.put("return_date", "未归还");
				}else{
					jsonData.put("return_date", resultSet.getString("return_date"));
				}
				jsonArray.add(jsonData);
			}
			countSql = "select count(*) as count from borrow_books where card_id = "
					+ req.getSession().getAttribute("reader");
			countSql += where;
			countPstmt = connection.prepareStatement(countSql);
			countSet = countPstmt.executeQuery();
			if (countSet.next()) {
				count = countSet.getInt("count");
			}
			if (!jsonArray.isEmpty()) {
				code = 0;
				msg = "查询成功";
			}

		} catch (ClassNotFoundException e) {
			msg = "class没找到";
		} catch (SQLException e) {
			msg = "sql错误";
		} finally {
			try {
				Base.closeResource(null, pstmt, resultSet);
				Base.closeResource(connection, countPstmt, countSet);
			} catch (SQLException e) {
				msg = "关闭资源失败";
			}

		}
		// 返回数据
		jsonResult.put("code", code);
		jsonResult.put("count", count);
		jsonResult.put("msg", msg);
		jsonResult.put("data", jsonArray.toArray());
		PrintWriter out = resp.getWriter();
		out.print(jsonResult);
	}

}
