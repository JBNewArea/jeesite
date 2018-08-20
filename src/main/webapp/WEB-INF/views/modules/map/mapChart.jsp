<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<link rel="stylesheet" href="${ctxStatic}/layer/theme/default/layer.css"  media="all">
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css"rel="stylesheet">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="${ctxStatic}/layer/layer.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"> </script>
<style type="text/css">
body, html,#allmap {width:100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A5KDCk9IQZULG0LNauvyUMbwKLveDF3D"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
</head>
<body class="page-body">
<div class="page-container" style="background-color:#F5F5F5">
	<div class="main-content">
		<div class="row">
			<div class="col-sm-12">
				 <ul id="myTab" class="nav nav-tabs">
				 	<li class="active">
						<a href="#map" data-toggle="tab">
							 地图定位展示
						</a>
					</li>
				    <li><a href="#ios" data-toggle="tab">热力图分布</a></li>
				 </ul>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" style="height:1000px;padding-top:5px;" id="map">
						<div class="col-sm-12" >
							<div class="panel ">
							    <div class="panel-body">
							    	<div class="panel-heading">
							        	<form id="chartForm" class="form-horizontal" role="form" method="post" enctype="application/x-www-form-urlencoded" action="${pageContext.request.contextPath}${url}">
												<div class="col-sm-3">
													 <div class="form-group" >
													    <label for="projectCode" class="col-sm-3 control-label">代码</label>
													    <div class="col-sm-8">
													    <c:if test="${chartType == 'project'}">
													    	 <input type="text" class="form-control" id="Code" name="code"  value="${ProjectDeclare.projectCode}" placeholder="请输入项目代码" >
													    </c:if>
													     <c:if test="${chartType == 'company'}">
													    	 <input type="text" class="form-control" id="Code" name="code"  value="${Company.companyCreditcode }" placeholder="请输入企业信用代码" >
													    </c:if>
													    </div>
													  </div>
												</div>
												<div class="col-sm-3">
													  <div class="form-group">
													    <label for="projectName" class="col-sm-3 control-label">名称</label>
													    <div class="col-sm-8">
														    <c:if test="${chartType == 'project'}">
														    	 	  <input type="text" class="form-control" id="projectName" name="name" value="${ProjectDeclare.projectName}" placeholder="请输入项目名称">
														   	</c:if>
														   	 <c:if test="${chartType == 'company'}">
														   	 	<input type="text" class="form-control" id="companyName" name="name" value="${Company.companyname }" placeholder="请输入企业名称">
														   	 </c:if>
													    </div>
													  </div>
												</div>
												<div class="col-sm-3">
													 <c:if test="${chartType == 'project'}">
														  <div class="form-group">
														    <label for="projectType" class="col-sm-3 control-label">类型</label>
														    <div class="col-sm-8">
														    	 <c:if test="${chartType == 'project'}">
														    	 		 <input type="text" class="form-control" id="projectType" name="type" value="${ProjectDeclare.projectType}" placeholder="请输入项目类型">
														    	 </c:if>
														    </div>
														  </div>
													  </c:if>
													   <c:if test="${chartType == 'company'}">
												     	<div class="form-group">
													    <label for="projectName" class="col-sm-3 control-label">等级</label>
													    <div class="col-sm-8">
													    	 	  <input type="text" class="form-control" id="companyQualityrating" name="companyQualityrating" value="${Company.companyQualityrating}" placeholder="请输入企业信用登记">
													    </div>
													  </div>
												     </c:if>
												</div>
												<div class="col-sm-3">
													<c:if test="${chartType == 'project'}">
													  <div class="form-group">
													    <label for="projectAttribute" class="col-sm-3 control-label">属性</label>
													    <div class="col-sm-8">
													    	 <c:if test="${chartType == 'project' }">
													    	 		<input type="text" class="form-control" id="projectAttribute" name="attribute" value="${ProjectDeclare.projectAttribute}" placeholder="请输入项目属性">
													    	 </c:if>
													    </div>
													  </div>
													 </c:if>
												</div>
											</form>
									    </div>
							    </div>
							     <div class="panel-body">
							        <!-- 提供额外的视觉效果，标识一组按钮中的原始动作 -->
									<button id="search" type="button" class="btn btn-primary" style="float:right;">查询</button>
							     </div>
							    <div id="allmap" style="height:0px;padding-bottom:100%;"></div> 
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="ios">
						<div class="col-sm-12" >
							<div id="allmaphot" style="height:0px;padding-bottom:100%;"></div> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
var list = '${declareList}';
var opts;
var map = new BMap.Map("allmap");
var maphot = new BMap.Map("allmaphot");
//初始化内容 
var myobj=eval("(" + list + ")");
window.onload=function(){ 
	loadMap_1();
	loadMap_2();
	$("#search").click(function(){
		$("#chartForm").submit();
	});
}
function loadMap_2(){
	//百度地图API功能
	var point = new BMap.Point(118.71917,32.16433);
	maphot.centerAndZoom(point, 15);             // 初始化地图，设置中心点坐标和地图级别
	maphot.enableScrollWheelZoom(); // 允许滚轮缩放
	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	maphot.addControl(top_left_control);        
	maphot.addControl(top_left_navigation); 
	maphot.centerAndZoom(point, 15);             // 初始化地图，设置中心点坐标和地图级别
	maphot.enableScrollWheelZoom(); // 允许滚轮缩放
	maphot.setMapStyle({style:'midnight'});
 	if(!isSupportCanvas()){
    	alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
    }
 	var lolat;
 	var points = [];
 	for(var i=0;i<myobj.length;i++){
 		var poinsObj = {lng:'',lat:'',count:''}
 		poinsObj.lng=parseFloat(myobj[i].longitude);
 		poinsObj.lat=parseFloat(myobj[i].latitude);
 		poinsObj.count=i;
 		console.log(poinsObj);
 		points[i] = poinsObj;	
 	}
	console.log(points);
 	heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20});
 	maphot.addOverlay(heatmapOverlay);
	heatmapOverlay.setDataSet({data:points});
 	
}
function loadMap_1(){
	//百度地图API功能
	var point = new BMap.Point(118.71917,32.16433);
	map.centerAndZoom(point, 15);
	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	map.addControl(top_left_control);        
	map.addControl(top_left_navigation); 
	var marker;
	var content;
	var opts;
	var point;
	var cou = 0;
	for(var i=0;i<myobj.length;i++){
		point = new BMap.Point(myobj[i].longitude,myobj[i].latitude);
		marker = new BMap.Marker(point);
		map.addOverlay(marker);
		opts = { width : 250, height: 80, title : "信息窗口" , enableMessage:true};
		addClickHandler(myobj[i].projectName,marker);
	}
}
function addClickHandler(content,marker){
	marker.addEventListener("click",function(e){
		openInfo(content,e)}
	);
}
function openInfo(content,e){
	var p = e.target;
	var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
	var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
	map.openInfoWindow(infoWindow,point); //开启信息窗口
}

//判断浏览区是否支持canvas
function isSupportCanvas(){
    var elem = document.createElement('canvas');
    return !!(elem.getContext && elem.getContext('2d'));
}
</script>
</html>
