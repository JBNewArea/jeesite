<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目库数据统计</title>
	<meta name="decorator" content="default"/>
	<script src="${pageContext.request.contextPath}/static/laydate/laydate.js"></script>
	<script type="text/javascript">
		function changeDate(dateStart,dateEnd){
			var data = {"dateStart":dateStart,"dateEnd":dateEnd};
			$.ajax({
				url:"tongji_left",
				type:'post',
				data:data,
				dataType:'json',
				success:function(res){
					console.log(res+res.qiye);
					$('.tongji_qiye').html(res.qiye);
					$('.tongji_zaiye').html(res.zaiye);
					$('.tongji_hangye').html(res.hangye);
					$('.tongji_zhuce').html(res.zhuce);
				}
			});
		}
		
		$(document).ready(function() {
			$('.time').each(function(){
				laydate.render({
				elem: this
				,position: 'fixed'
				,format: 'yyyy-MM-dd'
				});
				})
				
			$('.doTongji').click(function(){
				var dateStart = $('input[name="dateStart"]').val();
				var dateEnd = $('input[name="dateEnd"]').val();
				changeDate(dateStart,dateEnd);
			});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		
		
		
	</script>
	
	<script src="${pageContext.request.contextPath}/static/echarts/esl/esl.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/echarts/echarts-all.js"
	type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/companyshow.js"></script>
	
	<style>
	.btn_tongji {
}
	.index{
	    width: 100%;
	 			overflow-y: scroll;
	}
	.index-tongzhi {
		width: 100%;
		overflow: hidden;
		background: white;
		padding-bottom: 40px;
	}
	.tongzhi-left {
	    width: 40%;
	    overflow: hidden;
	    float: left;
	}
	.tongzhi-right {
	    width: 60%;
	    height: 350px;
	    float: left;
	    margin-top: 2%;
	}
	.left-neirong {
	    width: 90%;
	    margin: 5% 0 0 5%;
	    overflow: hidden;
	    border-right: 1px solid #f4f4f4;
	    padding-right: 5%;
	}
	.neirong-top {
	    width: 100%;
	    border-bottom: 1px solid #f4f4f4;
	    padding-bottom: 3%;
	    overflow: hidden;
	}
	.neirong-xuanxiang {
	    width: 100%;
	    margin-top: 3%;
	    overflow: hidden;
	}
	.tongzhi-top {
	    width: 95%;
	    overflow: hidden;
	}
	.tongzhi-title {
	    float: left;
	    font-size: 16px;
	}
	.tongzhi-nian {
	    float: right;
	}	
	.jcsx {
	    width: 45%;
	    background: #66b7f0;
	    border-radius: 10px;
	    float: left;
	    overflow: hidden;
	    height: 100px;
	}
	.xx-shuoming {
	    float: left;
	    width: 80%;
	    margin: 30px 0 0 15%;
	}
	.xx-shuoming p:nth-child(1) {
	    font-size: 36px;
	    font-weight: bold;
	    color: white;
	    padding: 0;
	    line-height: 27px;
	}
	.xx-shuoming p:nth-child(2) {
	    font-size: 14px;
	    font-weight: bold;
	    color: #ffffff;
	    line-height: 10px;
	}
	.zbxm {
	    width: 45%;
	    background: #fcb945;
	    border-radius: 10px;
	    float: left;
	    overflow: hidden;
	    height: 100px;
	    margin-left:5%;
	}
	.ywj {
	    width: 45%;
	    background: #a4c55f;
	    border-radius: 10px;
	    float: left;
	    overflow: hidden;
	    height: 100px;
	    margin-top: 5%;
	}
	.tze{
		width: 45%;
	    background:#e92b0df5;
	    border-radius: 10px;
	    float: left;
	    overflow: hidden;
	    height: 100px;
	    margin-top: 5%;
	    margin-left:5%;
	}


.index-bottom {
    width: 100%;
    height: 1200px;
    margin-top: 25px;
    overflow: hidden;
}
.circle-chart-list {
	list-style-type:none;
    padding-bottom: 10px;
    margin-left:0px;
}
.circle-chart-list li>h1 {
    margin: 21px 0px 0 21px;
}

.title_tj {
    height: 18px;
    line-height: 18px;
    font-size: 18px;
    font-weight: bold;
    color: #4178be;
    padding-left: 15px;
    border-left:5px solid #4178be;
}
.circle-chart-list li>div {
    width: 600px;
    height: 500px;
    margin-top: 12px;
}
.circle-chart-list li {
    float: left;
    margin: 0 21px 20px 0;
    width: 47%;
    height: 600px;
    background-color: white;
}
.mr0{
	width:80%;
	margin-right:0!important;
}

</style>
</head>
<body style="background-color:red;">
	<div class="index">
		<div class="index-tongzhi">
			<div class="tongzhi-left">
				<div class="left-neirong">
					<div class="neirong-left">
						<input type='text' name="dateStart" onchange="changeDate();" class="form-control time "    readonly/>
						<span> - </span>
						<input type='text' name="dateEnd" onchange="changeDate();" class="form-control time "  readonly/>
						<a class="btn doTongji btn_tongji" style="background:#53b1db;margin-left:63px;">统计</a>
					</div>
					<div class="neirong-xuanxiang">
						<!-- 企业总数 -->
						<div class="jcsx" style="background:#eb7b55;">
							<a href="javascript:void(0);" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_qiye">${qiye }  </p>
									<p>企业总数(个)</p>
								</div>
							</a>
						</div>
						<!-- 主题项目 -->
						<!-- <div class="ztxm">
							<a href="javascript:void(0);" data-url="">
								<span>
									<img>
								</span> 
								<div class="xx-shuoming">
									<p id="count_dwsp">6</p>
									<p>主题项目</p>
								</div>
							</a>
						</div> -->
						<!-- 在业企业 -->
						<div class="zbxm" style="background:#618ce6;">
							<a href="javascript:void(0);" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_zaiye">${zaiye }  </p>
									<p>在业企业(个)</p>
								</div>
							</a>
						</div>
						<!-- 备案项目 -->
						<div class="ywj" style="background:#53b1db;">
							<a href="javascript:void(0);" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_hangye">${hangye}</p>
									<p>行业总数(个)</p>
								</div>
							</a>
						</div>
						<!-- 审批项目 -->
						<div class="tze" style="background:#8391bb;">
							<a href="javascript:void(0);" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_zhuce">${zhuce }</p>
									<p>注册资本总额(亿)</p>
								</div>
							</a>
						</div>
						<!-- zdxm -->
						<!-- <div class="zdxm">
							<a href="javascript:void(0);" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp">2</p>
									<p>重大项目</p>
								</div>
							</a>
						</div> -->
					</div>
				
				</div>
			</div>
			<div class="tongzhi-right">
				<div class="tongzhi-top">
					<div class="tongzhi-title">
						企业数量(按开业日期统计)
					</div>
					<div class="tongzhi-nian">
						<select id="yearSelect">
							<option>2018</option>
							<option>2017</option>
							<option>2016</option>
						</select>
					</div>
				</div>
				<div class="zhexian" id="zhexian" style="height:350px;">
					
				</div>
			
			</div>
		</div>
		<div class="index-bottom">
			<ul class="circle-chart-list clearfix">
				<li>
					<h1 class="title_tj">从业人数(个)</h1>
					<div class="circle-chart1" id="circle-chart1">
					
					</div>
				</li>
				<li>
					<h1 class="title_tj">注册资本(个)</h1>
					<div class="circle-chart2" id="circle-chart2">
					
					</div>
				</li>
				<li class="mr0">
					<h1 class="title_tj">企业类型(个)</h1>
					<div class="circle-chart3" id="circle-chart3" style="width:800px;">
					
					</div>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>