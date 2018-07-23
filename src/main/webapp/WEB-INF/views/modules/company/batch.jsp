<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出用户数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/sys/user/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"导入数据", buttons:{"关闭":true}, 
					bottomText:"导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！"});
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/sys/user/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	 <ul class="nav nav-tabs">
		<li><a href="${ctx}/company/company/">企业库列表</a></li>
		<li><a href="${ctx}/company/company/form?id=${company.id}">企业信息<shiro:hasPermission name="company:company:edit">${not empty company.id?'修改':'手动添加'}</shiro:hasPermission><shiro:lacksPermission name="company:company:edit">查看</shiro:lacksPermission></a></li>
		<shiro:hasPermission name="company:company:edit"><li class="active"><a href="${ctx}/company/company/batch">企业信息批量录入</a></li></shiro:hasPermission>
	</ul><br/>
	<div id="importBox">
		<form id="importForm" action="${ctx}/company/company/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('正在导入，请稍等...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>　　
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   导    入   "/>
			<a href="${ctx}/company/company/import/template">下载模板</a>
		</form> 
	</div>
	
	
	<table id="dataGrid"></table>
    <div class="pagination" id="dataGridPage"></div>
	<link href="${ctxStatic}/jqGrid/4.6/css/ui.jqgrid.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jqGrid/4.7/js/jquery.jqGrid.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jqGrid/4.7/js/jquery.jqGrid.extend.js" type="text/javascript"></script>
	<script type="text/javascript">
	</script>
</body>
</html>