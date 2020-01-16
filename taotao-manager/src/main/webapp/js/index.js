$(function(){
	//JavaScript代码区域
	layui.use('element', function() {
		var element = layui.element;

	});
	$("#addItem").click(function(){
		$("#content").load("/jsp/addItem.jsp");
	})
	$("#showItem").click(function(){
		$("#content").load("/jsp/showItem.jsp");
	})
	$("#addItemCat").click(function(){
		$("#content").load("/jsp/addItemCat.jsp");
	})
})