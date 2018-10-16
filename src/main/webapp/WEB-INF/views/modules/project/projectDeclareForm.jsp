<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>项目入库管理</title>
	<meta name="decorator" content="default"/>
	<link rel="stylesheet" href="${ctxStatic}/layer/theme/default/layer.css"  media="all">
	<style type="text/css">
		.textarea{
			width:260px;	
		}
		#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script src="${ctxStatic}/layer/layer.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
			$("#lct").click(function(){
				layer.open({
					title : false,
					content:'/jeesite/a/project/projectDeclare/showFlowChart',
					success:function(layero, index){},
			        title : false,
			        type : 2,
			        closeBtn:0,
			        area : [ "80%", "100%" ],
			        btn:['关闭'],
			        yes:function(index,layero){
			        	layer.close(index);
			        }
				});
			});
			$("#mapImg").click(function(){
				var longitude = '${projectDeclare.longitude}';
				var latitude = '${projectDeclare.latitude}';
				var projectName = '${projectDeclare.projectName}';
				var buildDetailPlace = '${projectDeclare.buildDetailPlace}';
				if(longitude.length > 0 && latitude.length>0){
					//在这里面输入任何合法的js语句
					layer.open({
	                    content:'/jeesite/a/project/projectDeclare/showMap?longitude='+longitude+'&latitude='+latitude+'&projectName='+projectName+'&buildDetailPlace='+buildDetailPlace,
				        success:function(layero, index){},
				        title : false,
				        type : 2,
				        closeBtn:0,
				        area : [ "800px", "700px" ],
				        btn:['关闭'],
				        yes:function(index,layero){
				        	layer.close(index);
				        }
	    			}) 
				}else{
					layer.msg('无法获取到经纬度!');
				}
			});
			$("#searchCompany").click(function(){
				var legal = $("#legalUnitInfo").val();
				var arr = legal.split('/');
				window.location.href="${pageContext.request.contextPath}/a/company/company/?companyCreditcode="+arr[2];
			});
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/project/projectDeclare/">项目入库列表</a></li>
		<li class="active"><a href="${ctx}/project/projectDeclare/form?id=${projectDeclare.id}"><shiro:hasPermission name="project:projectDeclare:edit">${not empty projectDeclare.id?'入库项目修改':'项目手动录入'}</shiro:hasPermission><shiro:lacksPermission name="project:projectDeclare:edit">查看</shiro:lacksPermission></a></li><shiro:hasPermission name="project:projectDeclare:edit">
			<li>
				<a href="${ctx}/project/projectDeclare/batch">项目批量导入</a>
				<!-- <a href="" onclick="alert('该功能暂未开放');">项目批量导入</a> -->
			</li>
		</shiro:hasPermission>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="projectDeclare" action="${ctx}/project/projectDeclare/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<div class="control-group" >
			<label class="control-label">项目代码：<font color="red">*</font> </label>
			<div class="controls">
				<form:input path="projectCode" htmlEscape="false" maxlength="64" class="input-large required"/>
				<input id="searchCompany" class="btn btn-primary" type="button" value="企业" />
			</div>
		</div>	
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:44%;">
			<label class="control-label">申报时间：</label>
			<div class="controls">
				<input name="declareDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${projectDeclare.declareDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:10%;">
			<label class="control-label">项目类型：</label>
			<div class="controls">
				<form:input path="projectType" htmlEscape="false" maxlength="2" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">项目属性：</label>
			<div class="controls">
				<form:input path="projectAttribute" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:38%;">
			<label class="control-label">项目名称：</label>
			<div class="controls">
				<form:input path="projectName" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:10%;">
			<label class="control-label">申报单位：</label>
			<div class="controls">
				<form:input path="projectUnit" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">法人单位信息：</label>
			<div class="controls">
				<form:input path="legalUnitInfo" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:38%;">
			<label class="control-label">项目投资额(万元)：</label>
			<div class="controls">
				<form:input path="money" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:10%;">
			<label class="control-label">国标行业：</label>
			<div class="controls">
				<form:input path="guobiao" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">管理行业：</label>
			<div class="controls">
				<form:input path="guanli" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:38%;">
			<label class="control-label">建设地点：</label>
			<div class="controls">
				<form:input path="buildPlace" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:10%;">
			<label class="control-label">建设详细地址：</label>
			<div class="controls">
				<form:input path="buildDetailPlace" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">建设规模及内容：</label>
			<div class="controls">
				<form:input path="scaleandinfo" htmlEscape="false" maxlength="258" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:38%;">
			<label class="control-label">姓名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:10%;">
			<label class="control-label">联系方式：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="64" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				<form:input path="nameFirst" htmlEscape="false" maxlength="64" class="input-xlarge"/>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:39%;">
			<label class="control-label">办理状态：</label>
			<div class="controls">
				<form:input path="statusFirst" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:11%;">
			<label class="control-label">办结文号：</label>
			<div class="controls">
				<form:input path="wenhaoFirst" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">日期：</label>
			<div class="controls">
				<input name="riqiFirst" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${projectDeclare.riqiFirst}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:39%;">
			<label class="control-label">部门：</label>
			<div class="controls">
				<form:input path="bumenFirst" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:17.5%;">
			<label class="control-label">实际操作时间：</label>
			<div class="controls">
				<input name="caozuodateFirst" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${projectDeclare.caozuodateFirst}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所属街道：</label>
			<div class="controls">
				<%-- <form:input path="bumenFirst" htmlEscape="false" maxlength="64" class="input-xlarge "/> --%>
				<form:select path="transstreet" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('street_dict')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:39%;">
			<label class="control-label">所属平台：</label>
			<div class="controls">
				<%-- <form:input path="bumenFirst" htmlEscape="false" maxlength="64" class="input-xlarge "/> --%>
				<form:select path="transterrace" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('tran_dict')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group" style="float:right;margin-top:-3%;margin-right:26%;">
			<label class="control-label">地图定位：</label>
			<div class="controls">
				   <img id="mapImg" alt="" src="${ctxStatic}/images/map.png" width="30" height="30">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">备注：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false"  rows="4"   maxlength="255" class="textarea"/>
			</div>
		</div>
			<div class="control-group" >
				<label class="control-label">项目办理情况：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>名称</th>
								<th>办理状态</th>
								<th>办结文号</th>
								<th>日期</th>
								<th>部门</th>
								<th>实际操作时间</th>
								<th>备注信息</th>
								<shiro:hasPermission name="project:projectDeclare:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="projectHandleList">
						</tbody>
						<shiro:hasPermission name="project:projectDeclare:edit"><tfoot>
							<tr><td colspan="9"><a href="javascript:" onclick="addRow('#projectHandleList', projectHandleRowIdx, projectHandleTpl);projectHandleRowIdx = projectHandleRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="projectHandleTpl">//<!--
						<tr id="projectHandleList{{idx}}">
							<td class="hide">
								<input id="projectHandleList{{idx}}_id" name="projectHandleList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="projectHandleList{{idx}}_delFlag" name="projectHandleList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="projectHandleList{{idx}}_name" name="projectHandleList[{{idx}}].name" type="text" value="{{row.name}}" maxlength="64" class="input-small required"/>
							</td>
							<td>
								<input id="projectHandleList{{idx}}_handleStatus" name="projectHandleList[{{idx}}].handleStatus" type="text" value="{{row.handleStatus}}" maxlength="64" class="input-small required"/>
							</td>
							<td>
								<input id="projectHandleList{{idx}}_endCode" name="projectHandleList[{{idx}}].endCode" type="text" value="{{row.endCode}}" maxlength="64" class="input-small required"/>
							</td>
							<td>
								<input id="projectHandleList{{idx}}_date" name="projectHandleList[{{idx}}].date" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
									value="{{row.date}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
							</td>
							<td>
								<input id="projectHandleList{{idx}}_office" name="projectHandleList[{{idx}}].office" type="text" value="{{row.office}}" maxlength="64" class="input-small required"/>
							</td>
							<td>
								<input id="projectHandleList{{idx}}_caozuoDate" name="projectHandleList[{{idx}}].caozuoDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
									value="{{row.caozuoDate}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
							</td>
							<td>
								<textarea id="projectHandleList{{idx}}_remarks" name="projectHandleList[{{idx}}].remarks" rows="4" maxlength="255" class="input-small ">{{row.remarks}}</textarea>
							</td>
							<shiro:hasPermission name="project:projectDeclare:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#projectHandleList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var projectHandleRowIdx = 0, projectHandleTpl = $("#projectHandleTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(projectDeclare.projectHandleList)};
							for (var i=0; i<data.length; i++){
								addRow('#projectHandleList', projectHandleRowIdx, projectHandleTpl, data[i]);
								projectHandleRowIdx = projectHandleRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<input id="lct" class="btn btn-primary" type="button" value="流程图"/>
			<shiro:hasPermission name="project:projectDeclare:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A5KDCk9IQZULG0LNauvyUMbwKLveDF3D"></script>