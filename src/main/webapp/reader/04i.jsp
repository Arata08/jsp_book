<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Nifty Modal Window Effects</title>
<meta name="description"
	content="Nifty Modal Window Effects with CSS Transitions and Animations" />
<meta name="keywords"
	content="modal, window, overlay, modern, box, css transition, css animation, effect, 3d, perspective" />
<meta name="author" content="Codrops" />
	<link href="../css/default.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="../public/css/component.css" />
<script src="../public/js/modernizr.custom.js"></script>
	<style>
		body
		{
			background-image: url(../public/image/4.jpg);
			background-size: cover;
		}
		div.transbox
		{/*信息框参数*/
			width: 500px;
			height: 420px;
			border-radius:15px;
			margin-left: 34%;
			margin-top: 10%;
			background-color: #ffffff;
			border: 2px solid #ff5555;
			opacity:0.8;
		}
		.ex1{color: #0c0c0c}
		h1 {text-align: center;color: #0c0c0c}
		h2.ex1 {margin-left:10%;margin-top: -27%}/*整体文字信息*/
		h3.ex1 {margin-left:10%;}
		img.ex2{margin-left:60%;}/*头像参数*/
		p{text-align: right;}
		p.ex1{margin-right: 10%;}
		p{color:mediumpurple}

		/*cc:change color*/
		a.cc:visited {color:#0000ff;}
		a.cc:hover {color:#ffcc00;}

		button.btn.btn-lg.btn-primary{
			height: 10%!important;
			margin-left: 10%;
			font-size: 23px!important;
			width: 35%!important;
			padding-left: 0 !important;
		}
		.c1{//规则编号
			color: #1e9fff!important;
		}
	</style>
	<script>
		$(function () {
			$("[data-toggle='popover']").popover();
		});
	</script>
</head>
<body>
	<%
		if (session.getAttribute("reader") == null) {
	%>
	<script>
		location.href = "../loginreader.html";
	</script>
	<%
		}
	%>
	<jsp:useBean id="check" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	<jsp:useBean id="check1" scope="session" class="javabean.JDBCBean"></jsp:useBean>
	<!-- All modals added here for the demo. You would of course just have one, dynamically created -->

	<div class="md-modal md-effect-13" id="modal-13">
		<div class="md-content">
			<h3>修改密码</h3>
			
				<form action="11update.jsp" method="post"
				class="form-horizontal">
				<div class="form-group" align="center">
					<br>
					<label for="psw1" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10" align="center">
						<input type="password" class="form-control" name="psw1" id="password1"
							   placeholder="请输入新密码" style="width:70%;"/>
					</div>
				</div>
				<br>
				<div class="form-group" align="center">
					<label for="psw2" class="col-sm-2 control-label">新密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="psw2" id="password2"
							   placeholder="请再次输入密码进行确认" style="width:70%;"/>
					</div>
				</div>
				<div align="center">
				<input type="submit" class="btn btn-primary" value="确认">
				</div>
				<br>
			</form>
				<button class="md-close btn-primary">取消</button>
				<br>
		</div>
	</div>
	<div class="main clearfix" style="font-size:10px;margin-top:0%;font-family:YouYuan;">
		<div class="background">
			<div class="transbox">
				<%
				try{
					String cardId=session.getAttribute("reader").toString();
					String sql="select*from borrow_card where ID = '"+ cardId +"';";
					ResultSet rs = check.executeQuery(sql);
					while (rs.next()) {
						try{String rulesId=rs.getString("RULE_ID");
						String rulesql="select*from rules where id = '"+ rulesId +"';";
						ResultSet rulers = check1.executeQuery(rulesql);
					while (rulers.next()) {
				%>
				<% int id = rs.getInt(1);%>
				<h1>个人简介</h1>
				<img src="../public/image/头像.jpg" height="150px" width="150px" class="ex2"/>
				<h2 class="ex1"><%=rs.getString("READER")%></h2>
				<h3 class="ex1">借阅证编号：<%=rs.getString("ID")%></h3>
				<div class="c1"><button type="button"  class="btn btn-lg  btn-primary ex3" title="可借阅数量：
							<%=rulers.getString("BORROW_NUM") %>" data-html="true"
							 data-container="body" data-trigger="focus" data-toggle="popover" data-placement="right"
							 data-content="可借阅天数：<%=rulers.getString("LIMIT_DAY") %><br>可借阅图书馆：
							<%=rulers.getString("BORROW_LIBRARY") %>
					<br>过期扣费/天：<%=rulers.getString("OVERTIME_FEE") %>" style="width:40%;height:100%;font-size:17px;margin-top:4%;">
					规则编号：<%=rs.getString("RULE_ID")%>
				</button></div>
				<%
					}
				}catch(Exception e){
			}
			%>
				<h3 class="ex1">状态：
					<%
					if(rs.getString("STATUS").equals("1")){
						out.println("可用");
					}
					else{
						out.println("挂失");
					}
					%></h3>
				<h3 class="ex1">学校：<a class="cc" href="http://nation.chaoxing.com/nation?prefix=nustti&id=040F7B2F1C4
					EE2143D2FCBE3F991F0F89C3A0806B3CA5C440FC998BC464634D7">南京理工大学泰州科技学院</a></h3>
				<p class="ex1">这个人很懒，什么都没有留下......</p>
				<div align="center" style="font-size:20px;">
				<button class="md-trigger" data-modal="modal-13"  style="margin-top:0%;background-color: #FFC0CB">
					修改密码</button>
				</div>
				<%
						}
					}catch(Exception e){
					}
				%>
				</div>
		</div>
		<header style="font-align:center;margin-top: 20px">
		<h1>
			<span style="font-size:30px;">All the art of living lies in a fine mingling of letting go and holding on
			</span>
		</h1>
	</header>
	</div>

	<!-- /container -->
	<div class="md-overlay"></div>
	<script src="../public/js/classie.js"></script>
	<script src="../public/js/modalEffects.js"></script>
	<script>
		var polyfilter_scriptpath = '/js/';
	</script>
	<script src="../public/js/cssParser.js"></script>
	<script src="../public/js/css-filters-polyfill.js"></script>
</body>
</html>