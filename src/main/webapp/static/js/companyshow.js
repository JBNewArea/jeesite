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
	var data_company_createDate = [];
	
	var param_zhexian = {"year":2018};
	changeYear(param_zhexian);
	
	$('#yearSelect').change(function(){
		var param_zhexian={"year":$("#yearSelect").val()};
		changeYear(param_zhexian);
	});
	
	function clearOutDateData(data){
		var date=new Date;  
		var year=date.getFullYear();   
		var month=date.getMonth()+1;
		var yearSelect = $("#yearSelect").val();
		var returnData = new Array();
		if(year != yearSelect){
			return;
		}else{
			for(var i=0;i<data.length;i++){
				if(i<month-1){
					returnData.push(data[i]);
				}else{
					returnData.push(null);
				}
			}
		}
		return returnData;
	}
	
	
	
	function changeYear(param_zhexian){
		$.ajax({
			url:"zhexian",
			type:'post',
			data:param_zhexian,
			dataType:'json',
			success:function(data){
				var company = data["company"];
				console.log(company);
				/*data_company_createDate = [company.january,company.february,company.march,company.april,company.may,company.june,company.july,
				                company.august,company.september,company.october,company.november,company.december];*/
//				data_company_createDate = [company.january,company.february,company.march];
//				data_company_createDate = clearOutDateData(data_company_createDate);
				data_company_createDate = data["company"];
				data_hangye = data["hangye"]
				var temp = data_company_createDate[0];
				var temp0 = data_hangye[0];
//				console.log(data_company_createDate);
				for(var i=0;i<data_company_createDate.length;i++){
					if(parseInt(data_company_createDate[i])>parseInt(temp)){
						temp = data_company_createDate[i];
					}
				}
				for(var i=0;i<data_hangye.length;i++){
					if(parseInt(data_hangye[i])>parseInt(temp0)){
						temp0 = data_hangye[i];
					}
				}
				if(temp0>temp){
					temp = temp0;
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
							data : [ '企业数量','行业总数']
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
							//max : temp<1?1:temp,
							max:1164,
							axisLabel : {
								formatter : '{value}'
							}
						} ],
						series : [
								{
									name : '企业数量',
									type : 'line',
									data : data_company_createDate
								},
								
								{
									name : '行业总数',
									type : 'line',
									data : data_hangye
								}
								]
								
					};
					
					
					myChart.setOption(option,true);
			}
		});
	};
	
	
    var echart1 = echarts.init(document.getElementById("circle-chart1"));//从业人员
    var echart2 = echarts.init(document.getElementById("circle-chart2"));//注册资本
    var echart3 = echarts.init(document.getElementById("circle-chart3"));//企业类型
    /*var echart4 = echarts.init(document.getElementById("circle-chart4"));
    var echart5 = echarts.init(document.getElementById("circle-chart5"));*/
    
    initecharts();
    
    function daoxu(achearr){
    	var bchearr=[];
    	//方法1：
    	for (var i = 0; i <=achearr.length;i++) {
    	bchearr.push(achearr.pop());
    	}
    	bchearr.push(achearr[0]);
    	return bchearr;
    }
    function genColor(){ return "#"+("00000"+((Math.random()*16777215+0.5)>>0).toString(16)).slice(-6); }
    
    function initecharts(){
    	
    	$.ajax({
    		url:"echarts",
    		type:'post',
    		data:null,
    		dataType:'json',
    		success:function(data){
    			var congye = data.congye;
    			var zhuce = data.zhuce;
    			var type = data.type_kv;
    			var type_name = data.type_name;
    			var color = [];
    			var color0 = [];
    			for(var i=0;i<type.length;i++){
    				color.push(genColor());
    			}
    			for(var i=0;i<4;i++){
    				color0.push(genColor());
    			}
    			//从业人员
    	    	var data1 = [{value :congye.low,name:'50人以下'}, {value:congye.middle,name:'50-99人'},{value:congye.bigmiddle,name:'100-500人'},{value:congye.big,name:'500人以上'}];
    	    	    
    	    	    var option1 =  {  
//    	    	        title : {  
//    	    	            text: '重大项目(项)',  
//    	    	            x:"center"  
//    	    	        },  
    	    	        tooltip : {  
    	    	            trigger: 'item',  
    	    	            formatter: "{a} <br/>{b} : {c} ({d}%)"  
    	    	        },  
    	    	        legend: {  
    	    	            orient: 'horizontal',  
    	    	            x:"center",  
    	    	            y:"bottom",  
    	    	            data: ['50人以下','50-99人','100-500人','500人以上']  
    	    	        },  
    	    	        series : [  
    	    	            {  
    	    	                name: '从业人员',  
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
    	    	        ]  ,
    	    	        color:color0
    	    	    };  
    	    	      
    	    	    echart1.setOption(option1);

    	    	//注册资本
    	    	var data2 = [{value:zhuce.low,name:'100万元以下'},{value:zhuce.middle,name:'100-1000万'}
    	    	,{value:zhuce.bigmiddle,name:'1000万-1亿'},{value:zhuce.big,name:'一亿元以上'}];
    	    	    
    	    	    var option2 =  {  
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
    	    	                name: '注册资本',  
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
    	    		
    	    	//企业类型
    	    	var data3 = type;
    	    	    
    	    	var option3 = {  
    	    	        tooltip : {  
    	    	            trigger: 'item',  
    	    	            formatter: "{a} <br/>{b} : {c} ({d}%)"  
    	    	        },  
    	    	               
    	    	        legend: {  
    	    	            orient: 'horizontal',  
    	    	            x:"center",  
    	    	            y:"80%",  
    	    	            data: type_name 
    	    	        },  
    	    	        series : [  
    	    	            {  
    	    	                name: '企业类型(项)',  
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
    	    	        ]  ,
    	    	        color:color
    	    	    };

    	    	echart3.setOption(option3);
    		}
    	});
    	
    	
    	
    }

});