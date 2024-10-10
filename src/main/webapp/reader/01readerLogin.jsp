<%--
  Created by IntelliJ IDEA.
  User: 陈兴
  Date: 2023/6/22
  Time: 上午 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <title>图书管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="../layui/layui.js"></script>
  <link href="../layui/css/layui.css" rel="stylesheet">
  <style type="text/css">
  	body{
  		zoom:1.05;
        background-image: url("/public/image/white.png") ;
  	}
  	#welcome{
  		font-family:华文行楷;
  		font-size: 20px;
  	}
  </style>
</head>
<body>
<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo layui-hide-xs layui-bg-black" name="logo">
    	<img src="../public/image/nustti.png" width="230px">
    	</div>
    <ul class="layui-nav layui-layout-left">
      <!-- 移动端显示 -->
      <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
        <i class="layui-icon layui-icon-spread-left"></i>
      </li>
      <li class="layui-nav-item"><a href="javascript;"><h2 id="welcome">欢迎登录图书管理系统</h2></a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
       <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="../public/image/reader.png" class="layui-nav-img">读者页面</a>
        <dl class="layui-nav-child">
          <dd><a href="../loginManager.html"><img src="../public/image/manager.png" class="layui-nav-img">工作人员</a></dd>
          <dd><a href="../adminLogin.html"><img src="../public/image/admin.png" class="layui-nav-img">管理人员</a></dd></dl>
       </li>
        <li class="layui-nav-item"><a href="javascript:;"><%--获得用户名--%>
			<%if(session.getAttribute("reader")==null) {
            }else{%>
            <%
                try{
                    String cardId=session.getAttribute("reader").toString();
                    String sql="select*from borrow_card where ID = '"+ cardId +"';";
                    ResultSet rs = check.executeQuery(sql);
                    while (rs.next()) {
            %>
            <a href="04i.jsp" target="view_frame" title="查看个人信息"><%=rs.getString("READER") %></a><%
            }
            }catch(Exception ignored){

            }
        %>
         	<%} %>
            </a></li>
            <%if(session.getAttribute("reader") !=null) {%>
        <li class="layui-nav-item"><a href="./exit" target="_parent">退出</a></li>
            <%}else{%>
        <li class="layui-nav-item"><button type="button" class="layui-btn layui-btn-normal" lay-on="test-page-custom">登录
        </button></li>
            <%}%>
    </ul>
  </div>
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree" lay-filter="test">
      <% if(session.getAttribute("reader")!=null){%>
          <li  class="layui-nav-item"><a href="02main.jsp" target="view_frame">
              <i class="layui-icon layui-icon-home" style="font-size: 15px; color: #87CEFA;"></i>&nbsp;&nbsp;&nbsp;首页</a></li>
          <li  class="layui-nav-item"><a href="05book.jsp" target="view_frame">
              <i class="layui-icon layui-icon-search" style="font-size: 15px; color: #B0E0E6;"></i>&nbsp;&nbsp;图书查询</a></li>
          <li  class="layui-nav-item"><a href="12rules.jsp" target="view_frame">
              <i class="layui-icon layui-icon-question" style="font-size: 15px; color: #40E0D0;"></i>&nbsp;&nbsp;读者规则</a></li>
          <li  class="layui-nav-item"><a href="07announcement.jsp" target="view_frame">
              <i class="layui-icon layui-icon-speaker" style="font-size: 15px; color: #FFF8DC;"></i>&nbsp;&nbsp;查看公告</a></li>
          <li  class="layui-nav-item"><a href="10LookMessage.jsp" target="view_frame">
              <i class="layui-icon layui-icon-survey" style="font-size: 15px; color: #7FFFD4;"></i>&nbsp;&nbsp;读者留言</a></li>
	 	  <li  class="layui-nav-item"><a href="04i.jsp" target="view_frame">
            <i class="layui-icon layui-icon-username" style="font-size: 15px; color: #ADFF2F;"></i>&nbsp;&nbsp;个人信息</a></li>
		  <li  class="layui-nav-item"><a href="06borrow.jsp" target="view_frame">
            <i class="layui-icon layui-icon-date" style="font-size: 15px; color: #00FFFF;"></i>&nbsp;&nbsp;借阅信息</a></li>
		  <li  class="layui-nav-item"><a href="08illegal.jsp" target="view_frame">
            <i class="layui-icon layui-icon-tips" style="font-size: 15px; color: #4169E1;"></i>&nbsp;&nbsp;违章信息</a></li>
		  <li  class="layui-nav-item"><a href="13message.jsp" target="view_frame">
            <i class="layui-icon layui-icon-reply-fill" style="font-size: 15px; color: #FFE4E1;"></i>&nbsp;&nbsp;我要留言</a></li>
		<%
			}else{
		%>
          <li  class="layui-nav-item"><a href="02main.jsp" target="view_frame">
              <i class="layui-icon layui-icon-home" style="font-size: 15px; color: #87CEFA;"></i>&nbsp;&nbsp;&nbsp;首页</a></li>
          <li  class="layui-nav-item"><a href="05book.jsp" target="view_frame">
              <i class="layui-icon layui-icon-search" style="font-size: 15px; color: #B0E0E6;"></i>&nbsp;&nbsp;图书查询</a></li>
          <li  class="layui-nav-item"><a href="12rules.jsp" target="view_frame">
              <i class="layui-icon layui-icon-question" style="font-size: 15px; color: #40E0D0;"></i>&nbsp;&nbsp;读者规则</a></li>
          <li  class="layui-nav-item"><a href="07announcement.jsp" target="view_frame">
              <i class="layui-icon layui-icon-speaker" style="font-size: 15px; color: #FFF8DC;"></i>&nbsp;&nbsp;查看公告</a></li>
          <li  class="layui-nav-item"><a href="10LookMessage.jsp" target="view_frame">
              <i class="layui-icon layui-icon-survey" style="font-size: 15px; color: #7FFFD4;"></i>&nbsp;&nbsp;读者留言</a></li>
			<%
			}
			%>
      </ul>
    </div>
  </div>
  <div class="layui-body">
    <!-- 内容主体区域 -->
      <iframe src="02main.jsp" width="99%" height="100%"  name="view_frame"></iframe>
  </div>
  <div class="layui-footer">
    <!-- 底部固定区域 -->
      <%
          try{
              String announcesql="select*from announcement";//查询公告
              ResultSet announcers = check.executeQuery(announcesql);
              announcers.last();//讲指针指向最后一个记录
      %>
         <marquee style="font-size:20px;font-family:YouYuan;" behavior="scroll" direction="left"  loop="-1" scrollamount="18"
               scrolldelay="150" onMouseOut="this.start()" onMouseOver="this.stop()">
             <i class="layui-icon layui-icon-notice" style="font-size: 17px; color: #1E9FFF;"></i>&nbsp;<%=announcers.getString("DETAIL")%></marquee>
      <%

      }catch(Exception ignored){

      }
  %>

  </div>
</div>
<script>
    layui.use(function(){
        var $ = layui.$;
        var layer = layui.layer;
        var util = layui.util;
        var form = layui.form;

        // 事件
        util.on('lay-on', {
            'test-page-custom': function(){
                $.ajax({
                    url: '../login/loginForm.html',
                    success: function(data) {
                        layer.open({
                            type: 1,
                            area: '350px',
                            resize: false,
                            shadeClose: true,
                            moveOut:false,
                            offset: ['280px', '830px'],
                            title: '读者登录',
                            content: data,
                        });
                    },
                    error: function() {
                        console.log('Error loading login form');
                    }
                });
            }
        })
    });
</script>
</body>
</html>