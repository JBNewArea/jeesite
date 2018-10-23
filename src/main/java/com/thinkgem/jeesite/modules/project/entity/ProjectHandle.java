/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 项目入库Entity
 * @author freedom_taojie
 * @version 2018-04-10
 */
public class ProjectHandle extends DataEntity<ProjectHandle> {
	
	private static final long serialVersionUID = 1L;
	private ProjectDeclare projectDeclare;		// 项目申报ID 父类
	private String name;		// 名称
	private String handleStatus;		// 办理状态
	private String endCode;		// 办结文号
	private Date date;		// 日期
	private String office;		// 部门
	private Date caozuoDate;		// 实际操作时间
	
	public ProjectHandle() {
		super();
	}

	public ProjectHandle(String id){
		super(id);
	}

	public ProjectHandle(ProjectDeclare projectDeclare){
		this.projectDeclare = projectDeclare;
	}

	@Length(min=0, max=64, message="项目申报ID长度必须介于 0 和 64 之间")
	public ProjectDeclare getProjectDeclare() {
		return projectDeclare;
	}

	public void setProjectDeclare(ProjectDeclare projectDeclare) {
		this.projectDeclare = projectDeclare;
	}
	
	@Length(min=1, max=64, message="名称长度必须介于 1 和 64 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=64, message="办理状态长度必须介于 1 和 64 之间")
	public String getHandleStatus() {
		return handleStatus;
	}

	public void setHandleStatus(String handleStatus) {
		this.handleStatus = handleStatus;
	}
	
	@Length(min=1, max=64, message="办结文号长度必须介于 1 和 64 之间")
	public String getEndCode() {
		return endCode;
	}

	public void setEndCode(String endCode) {
		this.endCode = endCode;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@NotNull(message="日期不能为空")
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=1, max=64, message="部门长度必须介于 1 和 64 之间")
	public String getOffice() {
		return office;
	}

	public void setOffice(String office) {
		this.office = office;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@NotNull(message="实际操作时间不能为空")
	public Date getCaozuoDate() {
		return caozuoDate;
	}

	public void setCaozuoDate(Date caozuoDate) {
		this.caozuoDate = caozuoDate;
	}
	
}