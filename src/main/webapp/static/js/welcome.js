$(function() {
	// <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
	// Step:3 echarts & zrender as a Global Interface by the echarts-plain.js.
	// Step:3 echarts和zrender被echarts-plain.js写入为全局接口
//	onloadurl();
	var myChart = echarts.init(document.getElementById('zhexian'));
//	var now = new Date();
//	var res = [];
//	var len = 20;
//	while (len--) {
//		var time = now.toLocaleTimeString().replace(/^\D*/, '');
//		time = time.substr(time.indexOf(":") + 1);
//		res.unshift(time);
//		now = new Date(now - 1000);
//	}
	var data_declare = [];
	var data_handle = [];
	/*var param_zhexian = {"year":2018};
	$.ajax({
		url:"zhexian",
		type:'post',
		data:param_zhexian,
		dataType:'json',
		success:function(data){
			var declare = data["declare"];
			var handle = data["handle"];
			console.log(declare);
			data_declare = [declare.january,declare.february,declare.march,declare.april,declare.may,declare.june,declare.july,
			                declare.august,declare.september,declare.october,declare.november,declare.december];
			data_handle = [handle.january,handle.february,handle.march,handle.april,handle.may,handle.june,handle.july,
			                handle.august,handle.september,handle.october,handle.november,handle.december];
			var temp = data_declare[0];
			var temp2 = data_handle[0];
			for(var i=0;i<data_declare.length;i++){
				if(data_declare[i]>temp){
					temp = data_declare[i];
				}
			}
			for(var i=0;i<data_handle.length;i++){
				if(data_handle[i]>temp2){
					temp2 = data_handle[i];
				}
			}
			if(temp2>temp){
				temp=temp2;
			}
			option = {
					legend : {
						data : [ '项目申报情况', '项目办理情况']
					},
					grid : {
						x : 40,
						y : 30,
						x2 : 10,
						y2 : 35,
						borderWidth : 0,
						borderColor : "#FFFFFF"
					},
					xAxis : [ {
						axisLabel : {
							rotate : 40,
						},
						type : 'category',// 坐标轴类型，横轴默认为类目型'category'，纵轴默认为数值型'value'
						data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月',]
					} ],
					yAxis : [ {
						min : 0,
						max : temp,
						axisLabel : {
							formatter : '{value}'
						}
					} ],
					series : [
							{
								name : '项目申报情况',
								type : 'line',
								data : data_declare
							},
							{
								name : '项目办理情况',
								type : 'line',
								data : data_handle
							},]
							
				};
				myChart.setOption(option);
		}
	});*/
	var param_zhexian = {"year":2018};
	changeYear(param_zhexian);
	
	$('#yearSelect').change(function(){
		var param_zhexian={"year":$("#yearSelect").val()};
		changeYear(param_zhexian);
	});
	
	function changeYear(param_zhexian){
		$.ajax({
			url:"zhexian",
			type:'post',
			data:param_zhexian,
			dataType:'json',
			success:function(data){
				var declare = data["declare"];
				var handle = data["handle"];
				console.log(declare);
//				data_declare = [declare.january,declare.february,declare.march,declare.april,declare.may,declare.june,declare.july,
//				                declare.august,declare.september,declare.october,declare.november,declare.december];
//				data_handle = [handle.january,handle.february,handle.march,handle.april,handle.may,handle.june,handle.july,
//				                handle.august,handle.september,handle.october,handle.november,handle.december];
				/*data_declare = [declare.january,declare.february,declare.march];
				data_handle = [handle.january,handle.february,handle.march];*/
				data_declare = data["declare"];
				data_handle = data["handle"];
				
				var temp = data_declare[0];
				var temp2 = data_handle[0];
				for(var i=0;i<data_declare.length;i++){
					if(parseInt(data_declare[i])>parseInt(temp)){
						temp = data_declare[i];
					}
				}
				for(var i=0;i<data_handle.length;i++){
					if(data_handle[i]>temp2){
						temp2 = data_handle[i];
					}
				}
				if(temp2>temp){
					temp=temp2;
				}
				option = {
						tooltip : {
							trigger: 'axis',
							axisPointer : { // 坐标轴指示器，坐标轴触发有效
							type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
							}
						},
						toolbox: {
							show : true,
							feature : {
							mark : {show: true},
							dataView : {show: true, readOnly: false},
							magicType : {show: true, type: ['line', 'bar']},
							restore : {show: true},
							saveAsImage : {show: true}
							}
							},
							calculable : true,
						legend : {
							data : [ '项目申报情况', '项目办理情况']
						},
						grid : {
							x : 40,
							y : 30,
							x2 : 10,
							y2 : 35,
							borderWidth : 0,
							borderColor : "#FFFFFF"
						},
						xAxis : [ {
							axisLabel : {
								rotate : 40,
							},
							type : 'category',// 坐标轴类型，横轴默认为类目型'category'，纵轴默认为数值型'value'
							data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月',]
						} ],
						yAxis : [ {
							min : 0,
							max : temp<1?1:temp,
							axisLabel : {
								formatter : '{value}'
							}
						} ],
						series : [
								{
									name : '项目申报情况',
									type : 'line',
									data : data_declare
								},
								{
									name : '项目办理情况',
									type : 'line',
									data : data_handle
								},]
								
					};
					myChart.setOption(option,true);
			}
		});
	};
	
	
    var echart1 = echarts.init(document.getElementById("circle-chart1"));
    var echart2 = echarts.init(document.getElementById("circle-chart2"));
    var echart3 = echarts.init(document.getElementById("circle-chart3"));
    var echart4 = echarts.init(document.getElementById("circle-chart4"));
    /*var echart5 = echarts.init(document.getElementById("circle-chart5"));*/
    
    
    initCharts();
    
    function initCharts(){
    	$.ajax({
    		url:'echarts',
    		type:'post',
    		data:null,	
    		dataType:'json',
    		success:function(res){
    			var projectAttribute = res.projectAttribute;
    			var guobiao = res.guobiao;
    			var projectType = res.projectType;
    			var money = res.money;
    			
    			var projectAttribute_name = res.projectAttribute_name;
    			var guobiao_name = res.guobiao_name;
    			var projectType_name = res.projectType_name;
    			
    			//申报项目类型环形图
    			var data1 = projectType;
    			    
    			    var option1 =  {  
//    			        title : {  
//    			            text: '重大项目(项)',  
//    			            x:"center"  
//    			        },  
    			        tooltip : {  
    			            trigger: 'item',  
    			            formatter: "{a} <br/>{b} : {c} ({d}%)"  
    			        },  
    			        legend: {  
    			            orient: 'horizontal',  
    			            x:"center",  
    			            y:"bottom",  
    			            data: projectType_name,  
    			        },  
    			        series : [  
    			            {  
    			                name: '申报项目类型(个)',  
    			                type: 'pie',  
    			                radius : ['40%','60%'],  
    			                center: ['50%', '40%'],  
    			                data:data1,  
    			                itemStyle: {  
    			                	normal:{
    		    	    				label:{
    		    	    					show:true,
    		    	    					position:'outer',
    		    	    					formatter:'{b}:{c} ({d}%)'
    		    	    				},
    		    	    				shadowBlur:200,
    		    	    			},
    			                    emphasis: {  
    			                        shadowBlur: 10,  
    			                        shadowOffsetX: 0,  
    			                        shadowColor: 'rgba(0, 0, 0, 0.5)'  
    			                    }  
    			                }  
    			            }  
    			        ]  
    			    };  
    			      
    			    echart1.setOption(option1);

    			//申报项目国标
    			var data3 = guobiao;
    			    
    			    var option3 =  {  
    			        tooltip : {  
    			            trigger: 'item',  
    			            formatter: "{a} <br/>{b} : {c} ({d}%)"  
    			        },  
    			                  
    			        legend: {  
    			            orient: 'horizontal',  
    			            x:"center",  
    			            y:"bottom",  
    			            data: guobiao_name,  
    			        },  
    			        series : [  
    			            {  
    			                name: '申报项目国标行业(个)',  
    			                type: 'pie',  
    			                radius : ['40%','60%'],  
    			                center: ['50%', '40%'],   
    			                data:data3,  
    			                itemStyle: {  
    			                	normal:{
    		    	    				label:{
    		    	    					show:true,
    		    	    					position:'outer',
    		    	    					formatter:'{b}:{c} ({d}%)'
    		    	    				},
    		    	    				shadowBlur:200,
    		    	    			},
    			                    emphasis: {  
    			                        shadowBlur: 10,  
    			                        shadowOffsetX: 0,  
    			                        shadowColor: 'rgba(0, 0, 0, 0.5)'  
    			                    }  
    			                }  
    			            }  
    			        ]  
    			    };  
    			      
    			    echart3.setOption(option3);
    				
    			//申报项目属性
    			var data2 = projectAttribute;
    			    
    			var option2 = {  
    			        tooltip : {  
    			            trigger: 'item',  
    			            formatter: "{a} <br/>{b} : {c} ({d}%)"  
    			        },  
    			                  
    			        legend: {  
    			            orient: 'horizontal',  
    			            x:"center",  
    			            y:"bottom",  
    			            data: projectAttribute_name  
    			        },  
    			        series : [  
    			            {  
    			                name: '申报项目属性(个)',  
    			                type: 'pie',  
    			                radius : ['40%','60%'],  
    			                center: ['50%', '40%'],  
    			                data:data2,  
    			                itemStyle: {  
    			                	normal:{
    		    	    				label:{
    		    	    					show:true,
    		    	    					position:'outer',
    		    	    					formatter:'{b}:{c} ({d}%)'
    		    	    				},
    		    	    				shadowBlur:200,
    		    	    			},
    			                    emphasis: {  
    			                        shadowBlur: 10,  
    			                        shadowOffsetX: 0,  
    			                        shadowColor: 'rgba(0, 0, 0, 0.5)'  
    			                    }  
    			                }  
    			            }  
    			        ]  
    			    };

    			echart2.setOption(option2);
    			
    			
    			//投资规模
    			var data4 = [{value:money.low,name:'100万元以下'},{value:money.middle,name:'100-1000万'}
    	    	,{value:money.bigmiddle,name:'1000万-1亿'},{value:money.big,name:'一亿元以上'}];;
    			    
    			var option4 = {  
    			        tooltip : {  
    			            trigger: 'item',  
    			            formatter: "{a} <br/>{b} : {c} ({d}%)"  
    			        },  
    			                  
    			        legend: {  
    			            orient: 'horizontal',  
    			            x:"center",  
    			            y:"bottom",  
    			            data: ['100万元以下','100-1000万','1000万-1亿','一亿元以上']   
    			        },  
    			        series : [  
    			            {  
    			                name: '投资规模(个)',  
    			                type: 'pie',  
    			                radius : ['40%','60%'],  
    			                center: ['50%', '40%'],  
    			                data:data4,  
    			                itemStyle: {  
    			                	normal:{
    		    	    				label:{
    		    	    					show:true,
    		    	    					position:'outer',
    		    	    					formatter:'{b}:{c} ({d}%)'
    		    	    				},
    		    	    				shadowBlur:200,
    		    	    			},
    			                    emphasis: {  
    			                        shadowBlur: 10,  
    			                        shadowOffsetX: 0,  
    			                        shadowColor: 'rgba(0, 0, 0, 0.5)'  
    			                    }  
    			                }  
    			            }  
    			        ]  
    			    };

    			echart4.setOption(option4);
    		}
    	});
    }
    

});