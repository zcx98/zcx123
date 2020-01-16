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
			<div class="layui-form-item">
				<div class="layui-col-md3">
					<input type="text" name="title-search" id="title-search"
						class="layui-input"
						style="border: 1px solid #1E9FFF; height: 40px;"
						placeholder="请输入商品名称">
				</div>
				<div class="layui-col-md3">
					<div class="layui-inline">
						<div class="layui-input-inline" style="margin-left: 33px">
						<input id="selectCid" lay-event="cid" type="text" placeholder="请选择商品分类"
						class="layui-input" style="border: 1px solid #1E9FFF; height: 40px;"/>
						</div>
						<input type="hidden" id="cidContent" name="cId" />
					</div>
				</div>
				<div class="layui-col-md5">
					<div class="layui-inline">
						<label class="layui-form-label">范围:</label>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" id="priceMin" placeholder="￥:0"
								autocomplete="off" class="layui-input" style="border: 1px solid #1E9FFF; height: 40px;">
						</div>
						<div class="layui-form-mid">-</div>
						<div class="layui-input-inline" style="width: 100px;">
							<input type="text" id="priceMax" placeholder="￥:10000000"
								autocomplete="off" class="layui-input" style="border: 1px solid #1E9FFF; height: 40px;">
						</div>
					</div>
				</div>
				<div class="layui-col-md1">
					<button style="height: 40px;" type="button"
						class="layui-btn layui-btn-radius layui-btn-normal" lay-event="search">
						<i class="layui-icon">&#xe615;搜索</i>
					</button>
				</div>
			</div>
		</div>
		<br />
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