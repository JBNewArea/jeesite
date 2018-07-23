<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库资源管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test_resource/testResource/">仓库资源管理列表</a></li>
		<shiro:hasPermission name="test_resource:testResource:edit"><li><a href="${ctx}/test_resource/testResource/form">仓库资源管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testResource" action="${ctx}/test_resource/testResource/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>物品类型：</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('type_resource')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>物品名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>物品类型</th>
				<th>物品名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="test_resource:testResource:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="testResource">
			<tr>
				<td><a href="${ctx}/test_resource/testResource/form?id=${testResource.id}">
					${fns:getDictLabel(testResource.type, 'type_resource', '')}
				</a></td>
				<td>
					${testResource.name}
				</td>
				<td>
					<fmt:formatDate value="${testResource.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${testResource.remarks}
				</td>
				<shiro:hasPermission name="test_resource:testResource:edit"><td>
    				<a href="${ctx}/test_resource/testResource/form?id=${testResource.id}">修改</a>
					<a href="${ctx}/test_resource/testResource/delete?id=${testResource.id}" onclick="return confirmx('确认要删除该仓库资源管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>