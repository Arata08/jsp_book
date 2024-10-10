<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
	<script src="../layui/layui.js"></script>
	<link href="../layui/css/layui.css" rel="stylesheet">
<style>
	body{
		font-family:YouYuan;
		zoom:1.5;
	}
	.layui-timeline-item{
		margin-top: 1%;
	}
</style>
</head>
<body>
 <div style="background: steelblue;height: 25px;;color:#ffffff;border-radius: 20px;width: 70%;margin:1% auto;">
	<marquee style="font-size:20px;font-family:YouYuan;" behavior="scroll" direction="left"  hspace="0.1%" vspace="0.1%" loop="-1" scrollamount="20" scrolldelay="100" onMouseOut="this.start()" onMouseOver="this.stop()">
	今日公告：不好意思，今天没有大事发生！
	</marquee>
</div>
<div class="layui-timeline">
<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<%
		String sql="select*from announcement";
		ResultSet rs = check.executeQuery(sql);
		while (rs.next()) {
%>
		<div class="layui-timeline-item">
			<i class="layui-icon layui-timeline-axis"></i>
			<div class="layui-timeline-content layui-text">
				<h2 class="layui-timeline-title"><i class="layui-icon layui-icon-log" style="font-size: 23px; color: #1E9FFF;"></i> <%=rs.getString("PUBLISH_DATE") %></h2>
				<h3><%=rs.getString("TITLE") %></h3>
				<p><%=rs.getString("DETAIL") %></p>
			</div>
		</div>
<%
		}

 %>
	<div class="layui-timeline-item">
		<i class="layui-icon layui-timeline-axis"></i>
		<div class="layui-timeline-content layui-text">
			<div class="layui-timeline-title">过去</div>
		</div>
	</div>
</div>
</body>
</html>