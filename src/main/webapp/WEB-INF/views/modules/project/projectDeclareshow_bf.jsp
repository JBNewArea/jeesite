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
					$('.tongji_declare').html(res.declare);
					$('.tongji_hezhun').html(res.hezhun);
					$('.tongji_ba').html(res.ba);
					$('.tongji_sp').html(res.sp);
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/welcome.js"></script>
	
	<style>
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
	    background: #e92b0d;
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
/* .mr0{
	margin-right:0!important;
} */

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
						<!-- 基础事项 -->
						<div class="jcsx" style="background:#eb7b55;">
							<a href="${ctx}/project/projectDeclare/?projectType=0" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_declare">${declare }</p>
									<p>申报项目总数(个)</p>
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
						<!-- 在办项目 -->
						<div class="zbxm" style="background:#618ce6;">
							<a href="${ctx}/project/projectDeclare/?projectType=3" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_hezhun">${hezhun }</p>
									<p>核准(个)</p>
								</div>
							</a>
						</div>
						<!-- 已完结 -->
						<div class="ywj" style="backgound:#53b1db;">
							<a href="${ctx}/project/projectDeclare/?projectType=1" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_ba">${ba}</p>
									<p>备案项目(个)</p>
								</div>
							</a>
						</div>
						<!-- 投资额 -->
						<div class="tze" style="background:#8391bb;">
							<a href="${ctx}/project/projectDeclare/?projectType=2" data-url="">
								<span>
									<img>
								</span>
								<div class="xx-shuoming">
									<p id="count_dwsp" class="tongji_sp">${sp }</p>
									<p>审批项目(个)</p>
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
						项目申报及办理趋势
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
		<!-- <div>
			<select class="yearSelect_circle" style="margin-left:30px;float:left;">
				<option>2018</option>
				<option>2017</option>
				<option>2016</option>
			</select>
			<button class="changeYear_circle" style="margin-left:30px;float:left;">切换</button>
		</div> -->
		<div class="index-bottom">
			<ul class="circle-chart-list clearfix">
				<li>
					<h1 class="title_tj">申报项目类型(个)</h1>
					<div class="circle-chart1" id="circle-chart1">
					
					</div>
				</li>
				<li>
					<h1 class="title_tj">申报项目属性（个）</h1>
					<div class="circle-chart2" id="circle-chart2">
					
					</div>
				</li>
				<li class="mr0">
					<h1 class="title_tj">申报项目管理行业（个）</h1>
					<div class="circle-chart3" id="circle-chart3" >
					<!--  style="width:1200px;height:1000px;margin-left:100px;" -->
					 
					
					</div>
				</li>
				<li>
					<h1 class="title_tj">投资规模（个）</h1>
					<div class="circle-chart4" id="circle-chart4">
					
					</div>
				</li>
				<!-- <li>
					<h1 class="title_tj">代办项目土地来源（项）</h1>
					<div class="circle-chart4" id="circle-chart4">
					
					</div>
				</li>
				<li>
					<h1 class="title_tj">代办重大项目（项）</h1>
					<div class="circle-chart5" id="circle-chart5">
					
					</div>
				</li> -->
			</ul>
		</div>
	</div>
	
	
</body>
</html>