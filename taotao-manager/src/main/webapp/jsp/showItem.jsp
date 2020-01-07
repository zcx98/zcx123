<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示页面</title>
</head>
<body>
	<div>
		<input type="text" name=""/>
	</div>
	<table class="layui-hide" id="showItemPage" lay-filter="itemToolBar"></table>

	<div id="toolbarDemo" style="display: none;"  class="layui-btn-container">
		<button class="layui-btn layui-btn-sm" lay-event="itemDelete">选中删除</button>
		<button class="layui-btn layui-btn-sm" lay-event="addItem">新增商品</button>
		<button class="layui-btn layui-btn-sm" lay-event="updateItem">修改商品</button>
		<button class="layui-btn layui-btn-sm" lay-event="commodityUpperShelves">商品上架</button>
		<button class="layui-btn layui-btn-sm" lay-event="commodityLowerShelves">商品下架</button>
	</div>
	<div style="display: none;" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> 
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</div>
	
	<script>
		var table;
		layui.use('table', function() {
			table = layui.table;
			table.render({
				elem : '#showItemPage',//绑定哪个table表 可以以id选择器绑定 可以以class选择器 还可以以 name选择器
				url : '/item/showItemPage',//请求服务器的url路径
				toolbar : '#toolbarDemo',//开启头部工具栏，并为其绑定左侧模板
				defaultToolbar : [ 'filter', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
					layEvent : 'LAYTABLE_TIPS',
					icon : 'layui-icon-tips'
				} ],
				title : '商品表',
				cols : [ 
				         [ 
				{
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'id',
					title : 'ID',
					width : 60,
					fixed : 'left'
				}, {
					field : 'title',
					title : '商品名称',
					width : 95
				}, {
					field : 'sellPoint',
					title : '商品卖点',
					width : 95
				}, {
					field : 'price',
					title : '商品价格',
					width : 95
				}, {
					field : 'num',
					title : '商品数量',
					width : 90
				}, {
					field : 'cId',
					title : '商品类目',
					width : 90
				}, {
					field : 'status',
					title : '商品状态',
					width : 95,
					templet: '#titleTpl',
					sort : true
				},{
					field : 'created',
					title : '创建时间',
					templet:'<div>{{ layui.util.toDateString(d.created, "yyyy-MM-dd HH:mm:ss") }}</div>',
					width : 90
				},{
					field : 'updated',
					title : '更新时间',
					templet:'<div>{{ layui.util.toDateString(d.updated, "yyyy-MM-dd HH:mm:ss") }}</div>',
					width : 90
				},
				{fixed: 'right', title:'操作', toolbar: '#barDemo', width:115}
					]
				],
				page : true
			});
		});
	</script>
	<script type="text/html" id="titleTpl">
    {{#  if(d.status ==0){ }}
        	下架 
    {{#  }  else if(d.status==1){ }}
       	上架
 	{{#  }  else if(d.status==2){ }}
       	删除
    {{#  } }}
	</script>
</body>
</html>