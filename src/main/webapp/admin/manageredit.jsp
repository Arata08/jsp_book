<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javabean.Base"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员修改</title>
<!-- layui -->
<link rel="stylesheet" href="../layui/css/layui.css">
<script src="../layui/layui.js"></script>
<style>
  .layui-form{
    margin: 10px 20px;
 }
</style>
</head>
</head>
<body>
<%
	String id = request.getParameter("id");
	Connection connection = (Connection)Base.getConnection();
	String sql = "select * from manager where id=?";
	PreparedStatement pstmt = connection.prepareCall(sql);
	pstmt.setString(1,id);
	ResultSet resultSet = pstmt.executeQuery();
	resultSet.next();

%>
<form class="layui-form layui-form-pane"  action="" lay-filter="formFilter">
  <input type="text" name="id" value=<%=id %>  lay-verify="required" required autocomplete="off" placeholder="请输入姓名" class="layui-input layui-hide">
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="name" value=<%=resultSet.getString("name") %> lay-verify="required" required autocomplete="off" placeholder="请输入姓名" class="layui-input">
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">账号</label>
    <div class="layui-input-block">
      <input type="text" name="account" value=<%=resultSet.getString("account") %> disabled lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="password" name="password" value=<%=resultSet.getString("password") %> lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">邮箱</label>
    <div class="layui-input-block">
      <input type="text" name="email" value=<%=resultSet.getString("email") %> lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
    </div>
  </div>
 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="submitButton">立即提交</button>
    </div>
  </div>
</form>
<script>


layui.use(['form', 'jquery'], function(){
	  $ = layui.jquery;
	  var form = layui.form
	  ,layer = layui.layer
	  //监听提交
	  form.on('submit(submitButton)', function(data){
	    $.ajax({
	    	url: './managerEdit',
	    	method: 'post',
	    	data: data.field,
	    	dataType: 'json',
	    	success: function(data){
	    		if(data.code == "0"){
	    			parent.layer.msg("修改成功",{
	    				icon: 6,
	    				time: 500
	    			});
	    			setTimeout(function(){
	    				parent.location.reload();
	    			}, 500);
	    		}else{
	    			layer.msg(data.msg);
	    		}
	    	    
	    	}
	    })
	    
	    
	    return false;
	  });
	});

</script>
</body>
</html>