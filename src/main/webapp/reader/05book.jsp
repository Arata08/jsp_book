<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" href="../layui/css/layui.css"  media="all">
</head>
<body>
	<script src="../layui/layui.js" charset="utf-8"></script>
	<!-- 表单 -->
	<table class="layui-hide" id="cardTable" lay-filter="formFilter"></table>
	<!-- 头部工具栏 -->
	<script type="text/html" id="headBar">
 		 条件搜索：
		<div class="layui-inline">
	  	  <select id="condition" name="condition" lay-verify="required">
        	<option value=""></option>
			<option value="id">图书编号</option>
			<option value="name" selected>图书名称</option>
        	<option value="author">作者</option>
			<option value="position">位置</option>
			<option value="description">描述</option>
		  </select>
	 	 </div>
  		<div class="layui-inline">
    		<input class="layui-input" id="conditionValue" name="conditionValue" id="demoReload" autocomplete="off">
  		</div>
  			<button class="layui-btn layui-bg-blue" name="condition" data-type="reload"  lay-event="search">搜索</button>
	</script>

	<script> 
	layui.use(['table','jquery'], function(){
	  $ = layui.jquery;
	  var table = layui.table;
	  // 进行渲染
	  var tableIns =  table.render({
	    elem: '#cardTable'
	    ,url:'./book'
	    ,toolbar: '#headBar'
	    ,cols: [[
	      {field:'id', width:80, title: '编号', sort: true}
	      ,{field:'name', width:130, title: '图书名称', sort: true}
	      ,{field:'author', width:100, title: '作者', sort: true}
	      ,{field:'library_id', title: '图书馆', width: 100, sort: true}
	      ,{field:'sort_id', width:100, title: '分类', sort: true,}
	      ,{field:'position', width:100, title: '位置', sort: true}
	      ,{field:'status', width:100, title: '状态', sort: true,templet: function (item) {
	    	  var btns="";
	    	  if(item.status=='0'){
	    		  btns += '<span style="color:red">已借出</span>';
	    	  }else if(item.status=='1'){
	    		  btns += '<span style="color:green">未借出</span>';
	    	  }
	    	  return btns;
	    	  }
	      }
	      ,{field:'description', minWidth:80, title: '描述'}
	    ]]
	    ,page: true
	    ,page: {theme: '#2F88FF'},
	  });

	  // 头部工具栏事件
	  table.on('toolbar(formFilter)', function(obj){
		  var checkStatus = table.checkStatus(obj.config.id);
		  switch(obj.event){
		  	// 条件查找图书证
		    case 'search':
		      var conditionValue = $('#conditionValue');
	    	  var condition = $('#condition');

	    	  // 进行搜索，重新渲染
	    	  tableIns.reload({
				    where: { //设定异步数据接口的额外参数，任意设
				    	"condition": condition.val(),
				    	"conditionValue": conditionValue.val()
				    }
				    ,page: {
				      curr: 1 //重新从第 1 页开始
				    }
				  });
		    break;
		  };
		});
	});
	</script>
</body>
</html>