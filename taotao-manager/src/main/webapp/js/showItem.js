$(function(){
	var table;
	layui.use(['table','form'], function() {
		table = layui.table;
		var form = layui.form;
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
		//头工具栏事件
		table.on('toolbar(itemToolBar)', function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			switch(obj.event){
			case 'itemDelete':
				var data = checkStatus.data;
				$.ajax({
					type: "POST",
					url: "/item/itemDelete",
					contentType: "application/json;charset=utf-8",
					data:JSON.stringify(data),
					dataType: "json",
					success:function (message) {
						if(message.status==200){
							layer.alert('删除商品成功');
							table.reload('showItemPage',{  });
						}else{
							layer.alert(message.msg);
						}
					}
				});
				break;
			case 'commodityUpperShelves':
				var data = checkStatus.data;
				$.ajax({
					type: "POST",
					url: "/item/commodityUpperShelves",
					contentType: "application/json;charset=utf-8",
					data:JSON.stringify(data),
					dataType: "json",
					success:function (message) {
						if(message.status==200){
							layer.alert(message.msg);
							table.reload('showItemPage',{  });
						}else{
							layer.alert(message.msg);
						}
					}
				});
				break;
			case 'commodityLowerShelves':
				var data = checkStatus.data;
				$.ajax({
					type: "POST",
					url: "/item/commodityLowerShelves",
					contentType: "application/json;charset=utf-8",
					data:JSON.stringify(data),
					dataType: "json",
					success:function (message) {
						if(message.status==200){
							layer.alert(message.msg);
							table.reload('showItemPage',{  });
						}else{
							layer.alert(message.msg);
						}
					}
				});
				break;
			case 'search':
				var title=$("#title-search").val();
				var sellPoint=$("#sellPoint-search").val();
				var price=$("#price-search").val();
				table.reload('showItemPage', {
                    url:"/item/search",
                    where: {
                    	title:title,
                    	sellPoint:sellPoint,
                    	price:price
                    }
                });
				break;
			};
		});
	});
})