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
               <script type="text/javascript">
               $(document).ready(function() {
                  $('#reservation').daterangepicker({
                  }, function(start, end, label) {
                  });
               });
               </script>
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
						<a href="${pageContext.request.contextPath}/a/project/projectDeclare/?projectType=0" data-url="">
						<div class="xe-upper">
							<div class="xe-icon">
								<i class="fa-folder"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="project_sb"></strong>
								<span>申报项目总数（个）</span>
							</div>
						</div>
						</a>
						<div class="xe-lower">
							<div class="border"></div>
							<span>描述：</span>
							<strong id="qyzs"></strong>
						</div>
						
					</div>
					<!-- 横幅_2 -->
					<div class="xe-widget xe-counter-block xe-counter-block-purple" data-count=".num" data-from="0" data-to="512" data-duration="3">
						<a href="${pageContext.request.contextPath}/a/project/projectDeclare/?projectType=1" data-url="">
						<div class="xe-upper">
							<div class="xe-icon">
								<i class="fa-check-square-o"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="project_ba"></strong>
								<span>备案项目（个）</span>
							</div>
						</div>
						</a>
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
						<a href="${pageContext.request.contextPath}/a/project/projectDeclare/?projectType=3" data-url="">
						<div class="xe-upper">
							<div class="xe-icon">
								<i class="fa-folder-open"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="project_hz"></strong>
								<span>核准（个）</span>
							</div>
						</div>
						</a>
						<div class="xe-lower">
							<div class="border"></div>
							<span>描述：</span>
							<strong id="hyzs"></strong>
						</div>
					</div>
					<!-- 横幅_4 -->
					<div class="xe-widget xe-counter-block xe-counter-block-orange">
						<a href="${pageContext.request.contextPath}/a/project/projectDeclare/?projectType=2" data-url="">
						<div class="xe-upper">
							<div class="xe-icon">
								<i class="fa-edit"></i>
							</div>
							<div class="xe-label">
								<strong class="num" id="project_sp"></strong>
								<span>审批项目（个）</span>
							</div>
						</div>
						</a>
						<div class="xe-lower">
							<div class="border"></div>
							<span>描述：</span>
							<strong id="zczb"></strong>
						</div>
					</div>
		 	 </div>
		 	 <div class="col-sm-6">
		 	 	 <div id="main" style="width:100%;height:430px;"></div>
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
		  var projectAttribute = null;
 	      var projectAttribute_name = null;
		  var projectType_name = null;
		  var projectType = null;
		  var investment = null;
		  var guobiao = null;
		  var guobiao_name = null;
		  $.ajax({
			url:"echarts",
	   		type:'post',
	   		data:null,
	   		dataType:'json',
	   		async:false, 
	   		success:function(data){
	   			projectType_name = data.projectType_name;
	   			projectType = data.projectType;
	   			projectAttribute = data.projectAttribute;
	   			projectAttribute_name = data.projectAttribute_name;
	   			investment = data.money;
	   			guobiao = data.guobiao;
  			    guobiao_name = data.guobiao_name;
	   		}
		  });
		  var investmentList = [{value:investment.low,name:'100万元以下'},{value:investment.middle,name:'100-1000万'},{value:investment.bigmiddle,name:'1000万-1亿'},{value:investment.big,name:'一亿元以上'}];
		  var myChart = echarts.init(document.getElementById('doughnut'));
		  var chartColor = ['#ff7f50','#87cefa', '#61a0a8', '#d48265', '#91c7ae','#749f83',  '#ca8622', '#bda29a','#6e7074', '#546570', '#c4ccd3'];
		  //指定图表的配置项和数据
          var option = {
      		 tooltip: {
      		        trigger: 'item',
      		        formatter: "{a} <br/>{b}: {c} ({d}%)"
      		    },
      		    legend: {
      		        orient: 'vertical',
      		        x: 'left',
      		        data:projectType_name
      		    },
      		    color : chartColor,
      		    series: [
      		        {
      		            name:'申报项目类型(个)',
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
      		            data:projectType
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
        		        data:projectAttribute_name
        		    },
        		    color :chartColor,
        		    series: [
        		        {
        		            name:'申报项目属性(个)',
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
        		            data:projectAttribute
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
			        		        data:['100万元以下','100-1000万','1000万-1亿','一亿元以上']
			        		    },
			        		    color :chartColor,
			        		    series: [
			        		        {
			        		            name:'投资规模(个)',
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
			        		            data:investmentList
			        		        }
			        		    ]
			         };
			         // 使用刚指定的配置项和数据显示图表。
		             myChart.setOption(option);
		             myChart = echarts.init(document.getElementById('doughnut_qylx'));
	 				 //指定图表的配置项和数据
			         var option = {
			        		 title : {
			        		        text: '申报项目类型(个)',
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
			        		        data: guobiao_name
			        		    },
			        		    series : [
			        		        {
			        		            name: '企业类型',
			        		            type: 'pie',
			        		            radius : '55%',
			        		            center: ['50%', '60%'],
			        		            data:guobiao,
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
			        //基于准备好的dom，初始化echarts实例
			         myChart = echarts.init(document.getElementById('main'));
			         var param_zhexian = {"year":2018}; 
			         var result = query_zhexian(param_zhexian);
			         console.log(result);
			         var declare = result["declare"]
				         if(declare!=null){
				        	// 指定图表的配置项和数据
					         var option = {
					             title: {
					                 text: '项目申报'
					             },
					             tooltip: {},
					             legend: {
					                 data:['项目申报情况']
					             },
					             xAxis: {
					                 data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
					             },
					             color : chartColor,
					             yAxis: {},
					             series: [{
					                 name: '项目申报',
					                 type: 'bar',
					                 data: declare
					             }]
					         };
					         // 使用刚指定的配置项和数据显示图表。
					         myChart.setOption(option);
				         }
				         var fist_num = 0;
					 	function initDiamonds(start,end,year){
							var data = {"dateStart":start,"dateEnd":end,"dateYear":year};
							$.ajax({
								url:"tongji_left",
								type:'post',
								data:data,
								dataType:'json',
								success:function(res){
									$('#project_sb').html(res.declare);
									$('#project_ba').html(res.ba);
									$('#project_hz').html(res.hezhun);
									$('#project_sp').html(res.sp);
									if(fist_num == 0){
										loadDescribe();
									}
								}
							});
						}
					 	function loadDescribe(){
					 		$("#qyzs").html('所有项目申报数据');
					 		$("#zyqy").html('所有备案项目数据');
					 		$("#hyzs").html('所有项目核准数据');
					 		$("#zczb").html('所有项目审批数据');
					 	}
					 	function changeZxt(start,end,year){
					 		var myChart = echarts.init(document.getElementById('main'));
					 		if(year == ''){
					 			year ='2018';
					 		}
					 		
				 		var data = {"dateStart":start,"dateEnd":end,"year":year};
				 		var result = query_zhexian(data);
						// 指定图表的配置项和数据
				         var option = {
				             title: {
				                 text: '项目申报'
				             },
				             tooltip: {},
				             legend: {
				                 data:['项目申报']
				             },
				             xAxis: {
				                 data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
				             },
				             color : chartColor,
				             yAxis: {},
				             series: [{
				                 name: '项目申报',
				                 type: 'bar',
				                 data: result["declare"]
				             }]
				         };
				         // 使用刚指定的配置项和数据显示图表。
				         myChart.setOption(option);
				 	}
					function query_zhexian(param_zhexian){
						console.log(param_zhexian);
						var result = null;
						$.ajax({
				        	url:"zhexian",
				 			type:'post',
				 			data:param_zhexian,
							dataType:'json',
							async:false, 
							success:function(data){
								console.log(data);
								result = data;
							}
				         });
						return result;
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
				 			$("#qyzs").text(year+'年,所有项目申报数据');
					 		$("#zyqy").html(year+'年,所有备案项目数据');
					 		$("#hyzs").html(year+'年,所有项目核准数据');
					 		$("#zczb").html(year+'年,所有项目审批数据');
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
				 	})
		 		 </script>
<!-- Bottom Scripts -->
</html>