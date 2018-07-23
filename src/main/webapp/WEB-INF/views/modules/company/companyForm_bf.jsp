<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>企业库管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/company/company/">企业库列表</a></li>
		<li class="active"><a href="${ctx}/company/company/form?id=${company.id}">企业信息<shiro:hasPermission name="company:company:edit">${not empty company.id?'修改':'手动添加'}</shiro:hasPermission><shiro:lacksPermission name="company:company:edit">查看</shiro:lacksPermission></a></li>
		<shiro:hasPermission name="company:company:edit"><li><a href="${ctx}/company/company/batch">企业信息批量录入</a></li></shiro:hasPermission>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="company" action="${ctx}/company/company/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">企业信用代码：</label>
			<div class="controls">
				<form:input path="companyCreditcode" htmlEscape="false" maxlength="18" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">营业执照状态：</label>
			<div class="controls">
				<%-- <form:select path="companyCreditcodeState" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dic_company_creditcode_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
				<form:input path="companyCreditcodeState" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">旧注册代码：</label>
			<div class="controls">
				<form:input path="oldRegisternumber" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业信用等级：</label>
			<div class="controls">
				<%-- <form:select path="companyQualityrating" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dic_company_qualityrating')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
				<form:input path="companyQualityrating" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称核准号：</label>
			<div class="controls">
				<form:input path="permitnumber" htmlEscape="false" maxlength="15" class="input-xlarge "/>
			</div>
		</div> 
		<div class="control-group">
			<label class="control-label">企业名称：</label>
			<div class="controls">
				<form:input path="companyname" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业状态：</label>
			<div class="controls">
				<%-- <form:select path="companyState" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dic_company_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
				<form:input path="companyState" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">住所：</label>
			<div class="controls">
				<form:input path="companydomicile" htmlEscape="false" maxlength="1000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">住所行政区划：</label>
			<div class="controls">
				<form:input path="domicileAdministrativedivision" htmlEscape="false" maxlength="200" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">住所产权：</label>
			<div class="controls">
				<form:input path="domicileEquities" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">住所截止日期：</label>
			<div class="controls">
				<input name="domicileExpirationdate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.domicileExpirationdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法定代表人身份证号：</label>
			<div class="controls">
				<form:input path="legalIdentitycard" htmlEscape="false" maxlength="18" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法定代表人姓名：</label>
			<div class="controls">
				<form:input path="legalName" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属行业：</label>
			<div class="controls">
				<%-- <form:select path="industryInvolved" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dic_industry_involved')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
				<form:input path="industryInvolved" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">企业类型：</label>
			<div class="controls">
				<%-- <form:select path="companyType" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('dic_company_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select> --%>
				<form:input path="companyType" htmlEscape="false" maxlength="20" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">注册资本：</label>
			<div class="controls">
				<form:input path="registeredCapital" htmlEscape="false" maxlength="100" class="input-xlarge "/>万元
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">登记机关：</label>
			<div class="controls">
				<form:input path="registrationAuthority" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属管区：</label>
			<div class="controls">
				<form:input path="popedom" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">被委托机关：</label>
			<div class="controls">
				<form:input path="entrustedAgency" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">城乡标志：</label>
			<div class="controls">
				<form:input path="urbanandrural" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">设立时间：</label>
			<div class="controls">
				<input name="establishment" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.establishment}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">年检日期：</label>
			<div class="controls">
				<input name="annualInspection" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.annualInspection}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">许可经营项目：</label>
			<div class="controls">
				<form:input path="licensedProject" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">一般经营项目：</label>
			<div class="controls">
				<form:input path="generalBusinessProject" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">经营范围：</label>
			<div class="controls">
				<form:input path="scopeOfOperation" htmlEscape="false" maxlength="5000" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">营业时间 开始：</label>
			<div class="controls">
				<input name="businessHoursStart" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.businessHoursStart}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">营业时间 截止：</label>
			<div class="controls">
				<input name="businessHoursEnd" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.businessHoursEnd}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发照日期：</label>
			<div class="controls">
				<input name="licensingDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.licensingDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">核准日期：</label>
			<div class="controls">
				<input name="approvalDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.approvalDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">副本份数：</label>
			<div class="controls">
				<%-- <input name="copyNumber" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${company.copyNumber}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> --%>
				<form:input path="copyNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">从业人数：</label>
			<div class="controls">
				<form:input path="practitionersNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下岗人数：</label>
			<div class="controls">
				<form:input path="belaidOffNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">投资者人数：</label>
			<div class="controls">
				<form:input path="investorNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">投资者中下岗职工人数：</label>
			<div class="controls">
				<form:input path="investorLaidOffNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">雇工人数：</label>
			<div class="controls">
				<form:input path="employeeNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">雇工中下岗职工人数：</label>
			<div class="controls">
				<form:input path="employeeLaidOffNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">安置下岗职工人数：</label>
			<div class="controls">
				<form:input path="placeLaidOffNumber" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">邮政编码：</label>
			<div class="controls">
				<form:input path="postalCode" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="contactNumber" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">传真：</label>
			<div class="controls">
				<form:input path="fax" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电子邮件：</label>
			<div class="controls">
				<form:input path="email" htmlEscape="false" maxlength="100" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">网址：</label>
			<div class="controls">
				<form:input path="website" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">转型登记标识：</label>
			<div class="controls">
				<form:input path="transformationRegisterMark" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">一般新设：</label>
			<div class="controls">
				<form:input path="cubeStyle" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="company:company:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>