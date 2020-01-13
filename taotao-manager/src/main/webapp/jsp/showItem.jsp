<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品展示页面</title>
<script src="${pageContext.request.contextPath}/js/showItem.js"></script>
</head>
<body>
	<table class="layui-hide" id="showItemPage" lay-filter="itemToolBar"></table>

	<div id="toolbarDemo" style="display: none;"
		class="layui-btn-container">
		<div class="layui-row" style="margin-top: 15px">
			<div class="layui-col-md3">
				<input type="text" name="title-search" id="title-search"
					class="layui-input"
					style="border: 1px solid #1E9FFF; height: 40px;"
					placeholder="请输入商品名称">
			</div>
			<div class="layui-col-md3">
				<input type="text" name="sellPoint-search" id="sellPoint-search"
					class="layui-input"
					style="border: 1px solid #1E9FFF; height: 40px; margin-left: 15px"
					placeholder="请输入商品卖点">
			</div>
			<div class="layui-col-md3">
				<input type="text" name="price-search" id="price-search"
					class="layui-input"
					style="border: 1px solid #1E9FFF; height: 40px; margin-left: 30px"
					placeholder="请输入商品价格">
			</div>
			<div class="layui-col-md3">
				<button style="height: 40px; margin-left: 28px" type="button"
					class="layui-btn layui-btn-normal" lay-event="search">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</div>
		</div><br/>
			<button class="layui-btn layui-btn-sm" lay-event="itemDelete">选中删除</button>
			<button class="layui-btn layui-btn-sm" lay-event="addItem">新增商品</button>
			<button class="layui-btn layui-btn-sm" lay-event="updateItem">修改商品</button>
			<button class="layui-btn layui-btn-sm"
				lay-event="commodityUpperShelves">商品上架</button>
			<button class="layui-btn layui-btn-sm"
				lay-event="commodityLowerShelves">商品下架</button>
	</div>
	<div style="display: none;" id="barDemo">
		<a class="layui-btn layui-btn-xs" lay-event="edit"><i
			class="layui-icon">&nbsp;&#xe642;</i></a><a
			class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i
			class="layui-icon">&nbsp;&#xe640;</i></a>
	</div>

	<script type="text/html" id="titleTpl">
    {{#  if(d.status ==2){ }}
        	下架 
    {{#  }  else if(d.status==1){ }}
			上架
 	{{#  }  else if(d.status==3){ }}
       	删除
    {{#  } }}
	</script>
</body>
</html>