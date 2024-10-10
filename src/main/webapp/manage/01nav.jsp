<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>工作人员页面</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../layui/css/layui.css">
	<script src="../layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">工作人员页面</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
   
   <ul class="layui-nav layui-layout-left">
    </ul>
    <jsp:useBean id="name" scope="session" class="javabean.JDBCBean"></jsp:useBean>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <%
            try{
              String account = session.getAttribute("manager").toString();
              String sql="select*from manager where account = '"+ account +"';";
              ResultSet rs = name.executeQuery(sql);
              while (rs.next()) {
          %>
          <img src="../public/image/manager.png" class="layui-nav-img">
          <%=rs.getString("name") %><%
            }
          }catch(Exception ignored){

          }
        %>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="09managerSelf.jsp"  target="content">基本资料</a></dd>
        </dl>
      </li>
      <li  class="layui-nav-item">
      <a href="javascript:;"><img src="../public/image/manager.png" class="layui-nav-img">工作人员</a>
      <dl class="layui-nav-child">
        <dd><a href="../reader/01readerLogin.jsp"><img src="../public/image/reader.png" class="layui-nav-img">图书馆首页</a></dd>
        <dd><a href="../adminLogin.html"><img src="../public/image/admin.png" class="layui-nav-img">管理人员</a></dd></dl>
    </li>
      <li class="layui-nav-item"><a href="./quit" target="_parent">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">
            <i class="layui-icon layui-icon-read" style="font-size: 20px; color: lightblue;"></i>&nbsp;图书管理</a>
          <dl class="layui-nav-child">
            <dd><a href="02borrow.jsp" target="content">借阅图书</a></dd>
            <dd><a href="04judge.jsp" target="content">归还图书</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;"><i class="layui-icon layui-icon-form" style="font-size: 20px; color: orange;"></i>&nbsp;报表管理</a>
          <dl class="layui-nav-child">
            <dd><a href="06borrowTable.jsp" target="content">借书报表</a></dd>
            <dd><a href="07returnTable.jsp" target="content">还书报表</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="08announcement.jsp" target="content">
          <i class="layui-icon layui-icon-release" style="font-size: 20px; color: yellow;"></i>&nbsp;发布公告</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <iframe src="02borrow.jsp" name="content" height="100%" width="100%" frameborder="0" ></iframe>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © 图书管理系统 
  </div>
</div>
<script src="../layui/layui.js"></script>
<script>
  //JS
  layui.use(['element', 'layer', 'util'], function(){
    var element = layui.element;
    var layer = layui.layer;
    var util = layui.util;
    var $ = layui.$;
    //头部事件
    util.event('lay-header-event', {
      menuLeft: function(othis){ // 左侧菜单事件
        layer.msg('展开左侧菜单的操作', {icon: 0});
      },
      menuRight: function(){  // 右侧菜单事件
        layer.open({
          type: 1
          ,title: '更多'
          ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
          ,area: ['260px', '100%']
          ,offset: 'rt' //右上角
          ,anim: 'slideLeft'
          ,shadeClose: true
          ,scrollbar: false
        });
      }
    });
  });
</script>
</body>
</html>