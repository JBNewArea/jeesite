<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A5KDCk9IQZULG0LNauvyUMbwKLveDF3D"></script>
</head>
<body>
 <div id="allmap"></div>
</body>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");  // 创建Map实例
	var new_point = new BMap.Point('${longitude}','${latitude}');
	map.centerAndZoom(new_point,15);      // 初始化地图,用城市名设置地图中心点
	var marker = new BMap.Marker(new_point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "${companyname}" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	  message:""
	}
	var infoWindow = new BMap.InfoWindow("地址：${companydomicile}", opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow,new_point); //开启信息窗口
	});
</script>
</html>
