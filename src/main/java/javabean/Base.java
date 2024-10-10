package javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Base {
	private static final String driver = DBConstants.driver;
	private static final String url = DBConstants.url;
	private static final String username = DBConstants.username;
	private static final String password = DBConstants.password;

	/**
	 * 获取数据库连接
	 *
	 */
	public static Connection getConnection() throws ClassNotFoundException {
		Connection connection = null;
		try {
			Class.forName(driver);
			connection = (Connection) DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	/**
	 * 公共查询
	 * 
	 * @param connection
	 *            连接
	 * @param resultSet
	 *            结果集
	 */
	public static ResultSet executequery(Connection connection, PreparedStatement preparedStatement,
			ResultSet resultSet, String sql, Object[] params) throws SQLException {
		if (preparedStatement == null) {
			preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
		}
		for (int i = 0; params != null && i < params.length; i++) {
			preparedStatement.setObject(i + 1, params[i]);
		}
		resultSet = preparedStatement.executeQuery();
		return resultSet;

	}

	/**
	 * 公共修改方法
	 *
	 */
	public static int executeUpdate(Connection connection, PreparedStatement preparedStatement, String sql,
			Object[] params) throws SQLException {
		if (preparedStatement == null) {
			preparedStatement = (PreparedStatement) connection.prepareStatement(sql);
		}
		for (int i = 0; params != null && i < params.length; i++) {
			preparedStatement.setObject(i + 1, params[i]);
		}
		int updateRows = preparedStatement.executeUpdate();
		return updateRows;

	}

	/**
	 * 释放资源
	 *
	 */
	public static boolean closeResource(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet)
			throws SQLException {
		boolean flag = true;
		if (resultSet != null) {
			try {
				resultSet.close();
				resultSet = null;
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if (preparedStatement != null) {
			try {
				preparedStatement.close();
				preparedStatement = null;
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		if (connection != null) {
			try {
				connection.close();
				connection = null;
			} catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
		return flag;
	}

}
