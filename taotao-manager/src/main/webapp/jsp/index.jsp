<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
</style>
<title>淘淘商城后台</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css" />
<script type="text/javascript"
	src="//api.map.baidu.com/api?v=2.0&ak=zUa4PB6tIl973ncTNGLZa9dnUWVbEUZP"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/echarts-en.common.min.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header" style="background-color: #278295">
			<div class="layui-logo" style="color: white; font-size: large;">淘淘商城后台管理系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href=""><i
						class="layui-icon layui-icon-home"
						style="font-size: 16px; color: #F0F8FF;"></i> 首页</a></li>
				<li class="layui-nav-item"><a href="">合作机构</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"><img
						src="http://image.biaobaiju.com/uploads/20180802/01/1533146053-MPleGLypUw.jpg"
						class="layui-nav-img">Adonia</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">个人中心</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">注销</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-green">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree layui-bg-green"
					lay-filter="test">
					<li class="layui-nav-item"><a class="" href="javascript:;">商品管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a id="addItemCat" href="javascript:;">商品分类添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品分类查询</a>
							</dd>
							<dd>
								<a id="addItem" href="javascript:;">商品添加</a>
							</dd>
							<dd>
								<a id="showItem" href="javascript:;">商品查询</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">商品规格参数模板查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">cms内容管理系统</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">cms内容模板添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容模板查询</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容添加</a>
							</dd>
							<dd>
								<a href="javascript:;">cms内容查询</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">订单管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询订单</a>
							</dd>
							<dd>
								<a href="javascript:;">订单统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查询用户</a>
							</dd>
							<dd>
								<a href="javascript:;">用户统计</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">权限管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">查看权限</a>
							</dd>
							<dd>
								<a href="javascript:;">分配权限</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">活动管理</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">新增活动</a>
							</dd>
							<dd>
								<a href="javascript:;">查看活动</a>
							</dd>
						</dl></li>
				</ul>
			</div>
		</div>

		<div class="layui-body layui-bg-gray">
			<div id="content" style="padding: 15px;">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md3">
						<div class="layui-card">
							<div class="layui-card-header"
								style="font-weight: 540; font-size: 16px; color: black; display: flex; justify-content: space-between;">
								<span>访问量</span> <span class="layui-badge layui-bg-blue"
									style="margin-top: 12px">周</span>
							</div>
							<div class="layui-card-body">
								<br /> <font size="6px">9，999，666</font><br /> <br />
								<div
									style="font-weight: 500; font-size: 16px; display: flex; justify-content: space-between;">
									总计访问量 <span>88万&ensp;&ensp;<i class="layui-icon"
										style="font-size: 18px">&#xe66c;</i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md3">
						<div class="layui-card">
							<div class="layui-card-header"
								style="font-weight: 540; font-size: 16px; color: black; display: flex; justify-content: space-between;">
								<span>下载</span> <span class="layui-badge layui-bg-black"
									style="margin-top: 12px">月</span>
							</div>
							<div class="layui-card-body">
								<br /> <font size="6px">33，555</font><br /> <br />
								<div
									style="font-weight: 500; font-size: 16px; display: flex; justify-content: space-between;">
									新下载 <span>10%&ensp;&ensp;<i class="layui-icon"
										style="font-size: 18px">&#xe60c;</i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md3">
						<div class="layui-card">
							<div class="layui-card-header"
								style="font-weight: 540; font-size: 16px; color: black; display: flex; justify-content: space-between;">
								<span>收入</span> <span class="layui-badge layui-bg-green"
									style="margin-top: 12px">年</span>
							</div>
							<div class="layui-card-body">
								<br /> <font size="6px">999，666</font><br /> <br />
								<div
									style="font-weight: 500; font-size: 16px; display: flex; justify-content: space-between;">
									总收入 <span>***&ensp;&ensp;<i class="layui-icon"
										style="font-size: 18px">&#xe659;</i></span>
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md3">
						<div class="layui-card">
							<div class="layui-card-header"
								style="font-weight: 540; font-size: 16px; color: black; display: flex; justify-content: space-between;">
								<span>活跃用户</span> <span class="layui-badge layui-bg-orange"
									style="margin-top: 12px">月</span>
							</div>
							<div class="layui-card-body">
								<br /> <font size="6px">66，666</font><br /> <br />
								<div
									style="font-weight: 500; font-size: 16px; display: flex; justify-content: space-between;">
									最近一个月 <span>15%&ensp;&ensp;<i class="layui-icon"
										style="font-size: 18px">&#xe770;</i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br />
				<div class="layui-col-md12">
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">商品分类统计</div><br/>
							<div class="layui-card-body">
								<div id="echartsMain1" style="width: 400px; height: 400px;"></div>
							</div>
						</div>
					</div>
					<div class="layui-col-md6">
						<div class="layui-card">
							<div class="layui-card-header">当前地址</div><br/>
							<div class="layui-card-body">
								<div style="width: 400px; height: 400px" id="allmap"></div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-footer" style="background-color: #dddddd;">
				<!-- 底部固定区域 -->
				<font>© 欢迎来到淘淘商城后台管理系统</font>
			</div>
		</div>
		<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
			var myChart1 = echarts
					.init(document.getElementById('echartsMain1'));
			var weatherIcons = {};
			$.get('/itemCat/statisticsItem').done(function(resule) {
				myChart1.setOption({
					title : {
						text : '商品分类统计',
						left : 'center'
					},
					tooltip : {
						trigger : 'item',
						formatter : '{a} <br/>{b} : {c} ({d}%)'
					},
					series : [ {
						type : 'pie',
						radius : '65%',
						center : [ '50%', '50%' ],
						selectedMode : 'single',
						data : resule
					} ]
				});
			})
			//	百度地图API功能
		var map = new BMap.Map("allmap"); // 创建Map实例
		map.centerAndZoom(new BMap.Point(104.06, 30.67), 11); // 初始化地图,设置中心点坐标和地图级别
		//	添加地图类型控件
		map.addControl(new BMap.MapTypeControl({
			mapTypes : [ BMAP_NORMAL_MAP, BMAP_HYBRID_MAP ]
		}));
		map.setCurrentCity("成都"); // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
		</script>
</body>
</html>