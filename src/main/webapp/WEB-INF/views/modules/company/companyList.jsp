<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>企业库管理</title>
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
		<li class="active"><a href="${ctx}/company/company/">企业库列表</a></li>
		<shiro:hasPermission name="company:company:edit"><li><a href="${ctx}/company/company/form">企业库手动添加</a></li></shiro:hasPermission>
		<shiro:hasPermission name="company:company:edit"><li><a href="${ctx}/company/company/batch">企业信息批量录入</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="company" action="${ctx}/company/company/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>企业名称：</label>
				<form:input path="companyname" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>法定代表人：</label>
				<form:input path="legalName" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>信用代码：</label>
				<form:input path="companyCreditcode" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>所属行业：</label>
				<form:input path="industryInvolved" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th style="width:193.01px;">企业信用代码</th>
				<th style="width:83.01px;">企业信用等级</th>
				<th style="width:257.01px;">企业名称</th>
				<th style="width:96.01px;">法定代表人姓名</th>
				<th style="width:309.01px;">住所</th>
				<th style="width:131.01px;">所属行业</th>
				<!-- <th>许可经营项目</th> -->
				<th style="width:127.01px;">企业类型</th>
				<!-- <th>营业时间 截止</th> -->
				<th style="width:61.01px;">更新时间</th>
				<!-- <th>备注信息</th> -->
				<shiro:hasPermission name="company:company:edit"><th style="width:64.01px;">操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="company">
			<tr>
				<td><a href="${ctx}/company/company/form?id=${company.id}">
					${company.companyCreditcode}
				</a></td>
				<td>
					<%-- ${fns:getDictLabel(company.companyQualityrating, 'dic_company_qualityrating', '')} --%>
					${company.companyQualityrating}
				</td>
				<td title="${company.companyname}" style="text-align:left!important;">
					${company.companyname}
				</td>
				<td title="${company.legalName}">
					${company.legalName}
				</td>
				<td title="${company.companydomicile}" style="text-align:left!important;">
					${company.companydomicile}
				</td>
				<td title="${company.industryInvolved}" style="text-align:left!important;">
					<%-- ${fns:getDictLabel(company.industryInvolved, 'dic_industry_involved', '')} --%>
					${company.industryInvolved}
				</td>
				<%-- <td>
					${company.licensedProject}
				</td> --%>
				<td>
					${company.companyType}
					<%-- <fmt:formatDate value="${company.companyType}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
				</td>
				<%-- <td>
					<fmt:formatDate value="${company.businessHoursEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td> --%>
				<td>
					<fmt:formatDate value="${company.updateDate}" pattern="yyyy-MM-dd"/>
				</td>
				<%-- <td>
					${company.remarks}
				</td> --%>
				<shiro:hasPermission name="company:company:edit"><td>
    				<a href="${ctx}/company/company/form?id=${company.id}">修改</a>
					<a href="${ctx}/company/company/delete?id=${company.id}" onclick="return confirmx('确认要删除该项目库吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>