<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目入库管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/colResizable-1.6.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#contentTable').colResizable();
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	<style>
		table  td{
			white-space:nowrap;
			text-align:center!important;
		}
		table  th{
			white-space:nowrap;
			text-align:center!important;
		}
	</style>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/project/projectDeclare/">项目入库列表</a></li>
		<shiro:hasPermission name="project:projectDeclare:edit"><li><a href="${ctx}/project/projectDeclare/form">项目手动录入</a></li></shiro:hasPermission>
		<shiro:hasPermission name="project:projectDeclare:edit"><li>
			<a href="${ctx}/project/projectDeclare/batch">项目批量导入</a>
			<!-- <a href="" onclick="alert('该功能暂未开放');">项目批量导入</a> -->
		</li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="projectDeclare" action="${ctx}/project/projectDeclare/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>项目代码：</label>
				<form:input path="projectCode" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>项目名称：</label>
				<form:input path="projectName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
		<%-- 	<li><label>姓名：</label>
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li> --%>
			<li><label>项目类型：</label>
				<form:input path="projectType" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>管理行业：</label>
				<form:input path="guanli" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				
				<th style="width:228px;">项目代码</th>
				<th style="width:255px;">项目名称</th>
				<th style="width:72px;">项目类型</th>
				<th style="width:96px;">项目属性</th>
				<th style="width:233px;">申报单位</th>
				<th style="width:336px;">建设详细地址</th>
				<th style="width:77px;">姓名</th>
				<th style="width:96px;">管理行业</th>
				<th style="width:103px;">项目投资额(万元)</th>
				<shiro:hasPermission name="project:projectDeclare:edit"><th style="width:90px;">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="projectDeclare">
			<tr>
				<td>
					<a href="${ctx}/project/projectDeclare/form?id=${projectDeclare.id}">
						${projectDeclare.projectCode}
					</a>
				</td>
				<td title="${projectDeclare.projectName}" style="text-align:left!important;">
					${projectDeclare.projectName}
				</td>
				<td title="${projectDeclare.projectType}">
					${projectDeclare.projectType}
				</td>
				<td title="${projectDeclare.projectAttribute}">
					${projectDeclare.projectAttribute}
				</td>
				<td title="${projectDeclare.projectUnit}" style="text-align:left!important;">
					${projectDeclare.projectUnit}
				</td>
				<td title="${projectDeclare.buildDetailPlace}" style="text-align:left!important;">
					${projectDeclare.buildDetailPlace}
				</td>
				<td title="${projectDeclare.name}">
					${projectDeclare.name}
				</td>
				<td title="${projectDeclare.guanli}">
					${projectDeclare.guanli}
					<%-- <fmt:formatDate value="${projectDeclare.guanli}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
				</td>
				<td>
					${projectDeclare.money}
				</td>
				<%-- <td>
					${projectDeclare.remarks}
				</td> --%>
				<shiro:hasPermission name="project:projectDeclare:edit"><td>
    				<a href="${ctx}/project/projectDeclare/form?id=${projectDeclare.id}">修改</a>
					<a href="${ctx}/project/projectDeclare/delete?id=${projectDeclare.id}" onclick="return confirmx('确认要删除该项目入库吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>