<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.css"rel="stylesheet">
<link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/static/datetimepicker/css/daterangepicker-bs3.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/xenon-core.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/xenon-forms.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/xenon-components.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/xenon-skins.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/custom.css">
<link href="https://cdn.bootcss.com/bootstrap-select/1.12.4/css/bootstrap-select.min.css" rel="stylesheet">

<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/datetimepicker/js/moment.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/datetimepicker/js/daterangepicker.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/echarts/echarts.js"></script>

</head>
<body class="page-body">
<div class="page-container" style="background-color:#F5F5F5">
	<div class="main-content"> 
		 <div class="row">
			  <div class="col-sm-12">
			   <!-- <button type="button"  style="float: right;"class="btn btn-default" onclick="reset()">重置</button> -->
			   <button type="button" class="btn btn-primary" style="float: right;margin-right:1%;" onclick="search()">查询</button>
			  <!-- time -->
               <form class="form-horizontal" style="float: right;margin-right:3%;" >
                 <fieldset>
                  <div class="control-group">
                    <div class="controls">
                     <div class="input-prepend input-group">
                       <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span><input type="text" readonly style="width: 200px;background-color:white;" name="reservation" id="reservation" class="form-control" value="选择时间区间" /> 
                     </div>
                    </div>
                  </div>
                 </fieldset>
               </form>
               <div class="form-group" style="float: right;margin-right:2%;">
					<select class="selectpicker" >
						<option value='0'>年份</option>
						<option>2018</option>
						<option>2017</option>
						<option>2016</option>
					</select>
				</div>
			  </div>
		 </div>
		 <div class="row">
		 	 <div class="col-sm-3" style="margin-top:3%;">
 					<!-- 横幅_1 -->
		 	 		<div class="xe-widget xe-counter-block" data-count=".num" data-from="0" data-to="99.9" data-suffix="%" data-duration="2">
						<div class="xe-upper">
							<div class="xe-icon">
								<i class="fa-bank"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="companyAll"></strong>
								<span>企业总数</span>
							</div>
						</div>
						<div class="xe-lower">
							<div class="border"></div>
							<span>描述：</span>
							<strong id="qyzs"></strong>
						</div>
					</div>
					<!-- 横幅_2 -->
					<div class="xe-widget xe-counter-block xe-counter-block-purple" data-count=".num" data-from="0" data-to="512" data-duration="3">
						<div class="xe-upper">
							<div class="xe-icon">
								<i class="fa-university"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="company_zy"></strong>
								<span>在业企业</span>
							</div>
							
						</div>
						<div class="xe-lower">
							<div class="border"></div>
							<span >描述：</span>
							<strong id="zyqy"></strong>
						</div>
					</div>
		 	 </div>
		 	 <div class="col-sm-3"  style="margin-top:3%;">
		 	 	<!-- 横幅_3 -->
					<div class="xe-widget xe-counter-block xe-counter-block-blue" data-suffix="k" data-count=".num" data-from="0" data-to="310" data-duration="4" data-easing="false">
						<div class="xe-upper">
							
							<div class="xe-icon">
								<i class="fa-line-chart"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="company_hangye"></strong>
								<span>行业总数</span>
							</div>
							
						</div>
						<div class="xe-lower">
							<div class="border"></div>
							<span>描述：</span>
							<strong id="hyzs"></strong>
						</div>
					</div>
					<!-- 横幅_4 -->
					<div class="xe-widget xe-counter-block xe-counter-block-orange">
						<div class="xe-upper">
							
							<div class="xe-icon">
								<i class="fa-cny"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="company_zhuce"></strong>
								<span>注册资本总额（亿）</span>
							</div>
							
						</div>
						<div class="xe-lower">
							<div class="border"></div>
							<span>描述：</span>
							<strong id="zczb"></strong>
						</div>
					</div>
		 	 </div>
		 	 <div class="col-sm-6">
		 	 	 <div id="main" style="width:100%;height:430px;"></div>
		 	 	 <script type="text/javascript">
		 	 	 </script>
		 	 </div>
		 </div>
		 <div class="row">
		 	<div class="col-sm-4">
		 		 <div id="doughnut" style="width:100%;height:400px;"></div>
		 		 
		 	</div>
		 	<div class="col-sm-4">
		 		 <div id="doughnut_zb" style="width:100%;height:400px;"></div>
		 		 <script type="text/javascript">
		 		 </script>
		 	</div>
		 	<div class="col-sm-4">
		 		 <div id="doughnut_qyxy" style="width:100%;height:400px;"></div>
		 		 <script type="text/javascript">
		 		 </script>
		 	</div>
		 </div>
		 <div class="row">
		 <div class="col-sm-6">
	 			 <div id="doughnut_qylx" style="width:100%;height:450px;"></div>
	 			 <script type="text/javascript">
	 			 </script>
	 		</div>
	 		 <!-- <div class="col-sm-6">
	 		 	<div id="doughnut_sshy" style="width:100%;height:450px;"></div>
	 		 	<script type="text/javascript">
	 				var myChart = echarts.init(document.getElementById('doughnut_sshy'));
	 				var type_value =null;
	 				var type_name = null;
	 			// 指定图表的配置项和数据
			         var option = {
			        		 title : {
			        		        text: '所属行业',
			        		        x:'center'
			        		    },
			        		    tooltip : {
			        		        trigger: 'item',
			        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
			        		    },
			        		    legend: {
			        		        orient: 'vertical',
			        		        left: 'left',
			        		        data:type_name
			        		    },
			        		    series : [
			        		        {
			        		            name: '访问来源',
			        		            type: 'pie',
			        		            radius : '55%',
			        		            center: ['50%', '60%'],
			        		            data:type_value,
			        		            itemStyle: {
			        		                emphasis: {
			        		                    shadowBlur: 10,
			        		                    shadowOffsetX: 0,
			        		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			        		                }
			        		            }
			        		        }
			        		    ]
			         };
			         // 使用刚指定的配置项和数据显示图表。
			         myChart.setOption(option);
	 			 </script>
	 		 </div> -->
		 </div>
	</div>
</div>
</body>
<script type="text/javascript">
	  var myChart = echarts.init(document.getElementById('doughnut'));
	  var congye = null;
	  var zhuce = null;
	  var cride = null;
	  var type =null;
 	  var type_name = null;
	  $.ajax({
		url:"echarts",
  		type:'post',
  		data:null,
  		dataType:'json',
  		async:false, 
  		success:function(data){
  			congye = data.congye;
  			zhuce = data.zhuce;
  			cride = data.newcreditList;
  			 type = data.type_kv;
  			 type_name = data.type_name;
  		}
	  });
	  var chartColor = ['#ff7f50','#87cefa', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'];
		// 指定图表的配置项和数据
       var option = {
      		 tooltip: {
      		        trigger: 'item',
      		        formatter: "{a} <br/>{b}: {c} ({d}%)"
      		    },
      		    legend: {
      		        orient: 'vertical',
      		        x: 'left',
      		        data:['50人以下','50-99人','100-500人','500人以上']
      		    },
      		    color : chartColor,
      		    series: [
      		        {
      		            name:'从业个数',
      		            type:'pie',
      		            radius: ['50%', '70%'],
      		            avoidLabelOverlap: false,
      		            label: {
      		                normal: {
      		                    show: false,
      		                    position: 'center'
      		                },
      		                emphasis: {
      		                    show: true,
      		                    textStyle: {
      		                        fontSize: '30',
      		                        fontWeight: 'bold'
      		                    }
      		                }
      		            },
      		            labelLine: {
      		                normal: {
      		                    show: false
      		                }
      		            },
      		            data:[
      		                {value:congye.low, name:'50人以下'},
      		                {value:congye.middle, name:'50-99人'},
      		                {value:congye.bigmiddle, name:'100-500人'},
      		                {value:congye.big, name:'500人以上'}
      		            ]
      		        }
      		    ]
       };
       // 使用刚指定的配置项和数据显示图表。
       myChart.setOption(option);
       myChart = echarts.init(document.getElementById('doughnut_zb'));
		//指定图表的配置项和数据
         var option = {
					tooltip: {
        		        trigger: 'item',
        		        formatter: "{a} <br/>{b}: {c} ({d}%)"
        		    },
        		    legend: {
        		        orient: 'vertical',
        		        x: 'left',
        		        data:chartColor
        		    },
        		    color : ['#ff7f50','#87cefa', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'],
        		    series: [
        		        {
        		            name:'从业资本',
        		            type:'pie',
        		            radius: ['50%', '70%'],
        		            avoidLabelOverlap: false,
        		            label: {
        		                normal: {
        		                    show: false,
        		                    position: 'center'
        		                },
        		                emphasis: {
        		                    show: true,
        		                    textStyle: {
        		                        fontSize: '30',
        		                        fontWeight: 'bold'
        		                    }
        		                }
        		            },
        		            labelLine: {
        		                normal: {
        		                    show: false
        		                }
        		            },
        		            data:[
        		                {value:zhuce.low, name:'100万以下'},
        		                {value:zhuce.middle, name:'100-1000万'},
        		                {value:zhuce.bigmiddle, name:'1000万-1亿'},
        		                {value:zhuce.big, name:'1亿以上'}
        		            ]
        		        }
        		    ]
         };
         // 使用刚指定的配置项和数据显示图表。
         myChart.setOption(option);
					         
          myChart = echarts.init(document.getElementById('doughnut_qyxy'));
	 		// 指定图表的配置项和数据
		         var option = {
		        		 tooltip: {
		        		        trigger: 'item',
		        		        formatter: "{a} <br/>{b}: {c} ({d}%)"
		        		    },
		        		    legend: {
		        		        orient: 'vertical',
		        		        x: 'left',
		        		        data:['A','B','C','D']
		        		    },
		        		    color : chartColor,
		        		    series: [
		        		        {
		        		            name:'企业信用等级',
		        		            type:'pie',
		        		            radius: ['50%', '70%'],
		        		            avoidLabelOverlap: false,
		        		            label: {
		        		                normal: {
		        		                    show: false,
		        		                    position: 'center'
		        		                },
		        		                emphasis: {
		        		                    show: true,
		        		                    textStyle: {
		        		                        fontSize: '30',
		        		                        fontWeight: 'bold'
		        		                    }
		        		                }
		        		            },
		        		            labelLine: {
		        		                normal: {
		        		                    show: false
		        		                }
		        		            },
		        		            data:cride
		        		        }
		        		    ]
		         };
		         // 使用刚指定的配置项和数据显示图表。
		         myChart.setOption(option);
                 myChart = echarts.init(document.getElementById('doughnut_qylx'));
				//指定图表的配置项和数据
	         	var option = {
	        		 title : {
	        		        text: '企业类型',
	        		        x:'center'
	        		    },
	        		    tooltip : {
	        		        trigger: 'item',
	        		        formatter: "{a} <br/>{b} : {c} ({d}%)"
	        		    },
	        		    color : chartColor,
	        		    legend: {
	        		        orient: 'vertical',
	        		        left: 'left',
	        		        data: type_name
	        		    },
	        		    series : [
	        		        {
	        		            name: '企业类型',
	        		            type: 'pie',
	        		            radius : '55%',
	        		            center: ['50%', '60%'],
	        		            data:type,
	        		            itemStyle: {
	        		                emphasis: {
	        		                    shadowBlur: 10,
	        		                    shadowOffsetX: 0,
	        		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	        		                }
	        		            }
	        		        }
	        		    ]
	         };
	         // 使用刚指定的配置项和数据显示图表。
	         myChart.setOption(option);
	         var fist_num = 0;
			 	function initDiamonds(start,end,year){
					var data = {"dateStart":start,"dateEnd":end,"dateYear":year};
					$.ajax({
						url:"tongji_left",
						type:'post',
						data:data,
						dataType:'json',
						success:function(res){
							$('#companyAll').html(res.qiye);
							$('#company_zy').html(res.zaiye);
							$('#company_hangye').html(res.hangye);
							$('#company_zhuce').html(res.zhuce);
							if(fist_num == 0){
								loadDescribe();
							}
						}
					});
				}
			 	function loadDescribe(){
			 		$("#qyzs").html('所有企业数据');
			 		$("#zyqy").html('所有在业企业数据');
			 		$("#hyzs").html('企业所属行业总数');
			 		$("#zczb").html('所有企业注册资本数据');
			 	}
			 	function changeZxt(start,end,year){
			 		var myChart = echarts.init(document.getElementById('main'));
			 		if(year == ''){
			 			year ='2018';
			 		}
			 		var data = {"dateStart":start,"dateEnd":end,"year":year};
			 		var result = queryZhexian(data);
					// 指定图表的配置项和数据
			         var option = {
			             title: {
			                 text: '企业数量'
			             },
			             tooltip: {},
			             legend: {
			                 data:['企业数量','行业总数']
			             },
			             xAxis: {
			                 data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			             },
			             color : chartColor,
			             yAxis: {},
			             series: [{
			                 name: '企业数量',
			                 type: 'bar',
			                 data: result.company
			             },{
			            	 name: '行业总数',
			                 type: 'bar',
			                 data: result.hangye
			             }]
			         };
			         // 使用刚指定的配置项和数据显示图表。
			         myChart.setOption(option);
			 	}
			 	function search(){
			 		//解析时间区间
			 		var reserv = $("#reservation").val();
			 		var start,end = null;
			 		var arry = reserv.split(' - ');
			 		start = arry[0];
			 		end = arry[1];
			 		//解析年份
			 		var year = $(".selectpicker").val();
			 		if(year == '0'){
			 			year = '';
			 			loadDescribe();
			 		}else{
			 			fist_num = 1;
			 			$("#qyzs").text(year+'年,所有企业数据');
				 		$("#zyqy").html(year+'年,所有在业企业数据');
				 		$("#hyzs").html(year+'年,所有企业所属行业总数');
				 		$("#zczb").html(year+'年,所有企业注册资本数据');
			 		}
			 		if(start == '选择时间区间'){
			 			start = null;
			 		}
			 		//首页方块检索
			 		initDiamonds(start,end,year);
			 		//首页柱形图
			 		changeZxt(start,end,year);
			 	}
			 	$(function(){
			 		initDiamonds('','','');
			 	});
			 	$(document).ready(function() {
	                  $('#reservation').daterangepicker({
	                  }, function(start, end, label) {
	                  });
	            });
			 	function queryZhexian(param_zhexian){
			 		var result = null;
			 		$.ajax({
			        	url:"zhexian",
			 			type:'post',
			 			data:param_zhexian,
						dataType:'json',
						async:false, 
						success:function(data){
							result = data;
						}
			         });
			 		return result;
			 	}
			 // 基于准备好的dom，初始化echarts实例
		         var myChart = echarts.init(document.getElementById('main'));
		         var param_zhexian = {"year":2018}; 
		         var company_Bar = queryZhexian(param_zhexian);
		         console.log(company_Bar);
		         if(company_Bar!=null){
		        	// 指定图表的配置项和数据
			         var option = {
			             title: {
			                 text: '企业数量'
			             },
			             tooltip: {},
			             legend: {
			                 data:['企业数量','行业总数']
			             },
			             xAxis: {
			                 data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			             },
			             color : chartColor,
			             yAxis: {},
			             series: [{
			                 name: '企业数量',
			                 type: 'bar',
			                 data: company_Bar.company
			             },{
			            	 name: '行业总数',
			                 type: 'bar',
			                 data: company_Bar.hangye
			             }]
			         };
			         // 使用刚指定的配置项和数据显示图表。
			         myChart.setOption(option);
		         }
	 </script>
<!-- Bottom Scripts -->
</html>