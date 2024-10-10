package javabean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.TreeMap;

public class Common {


	public static TreeMap<String, String> getLibraryMap() throws SQLException {
		Connection connection = null;
		PreparedStatement libraryPstmt = null;
		ResultSet librarySet = null;
		String librarySql = "select id,name from library";
		
		TreeMap<String, String> map = new TreeMap<String, String>();
		// 获取图书馆
		try {
			connection = (Connection) Base.getConnection();
			libraryPstmt = connection.prepareStatement(librarySql);
			librarySet = libraryPstmt.executeQuery();
			while(librarySet.next()) {
				map.put(librarySet.getString("id"), librarySet.getString("name"));
			}
		} catch (ClassNotFoundException e) {
			return null;
		} catch (SQLException e) {
			return null;
		} finally {
			Base.closeResource(connection, libraryPstmt, librarySet);
		}
		return map;
	}
	
	public static void main(String[] args) throws SQLException {
		System.out.println(Common.getLibraryMap());
	}
}
