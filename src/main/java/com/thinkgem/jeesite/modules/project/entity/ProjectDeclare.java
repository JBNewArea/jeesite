/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import java.util.List;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 项目入库Entity
 * @author freedom_taojie
 * @version 2018-04-10
 */
public class ProjectDeclare extends DataEntity<ProjectDeclare> {
	
	private static final long serialVersionUID = 1L;
	private Date declareDate;		// 申报时间
	private String projectCode;		// 项目代码
	private String projectType;		// 项目类型
	private String projectAttribute;		// 项目属性
	private String projectName;		// 项目名称
	private String projectUnit;		// 申报单位
	private String legalUnitInfo;		// 法人单位信息
	private double money;		// 项目投资额
	private String guobiao;		// 国标行业
	private String guanli;		// 管理行业
	private String buildPlace;		// 建设地点
	private String buildDetailPlace;		// 建设详细地址
	private String scaleandinfo;		// 建设规模及内容
	private String name;		// 姓名
	private String phone;		// 联系方式
	
	private String nameFirst;	//名称
	private String statusFirst;	//办理状态
	private String wenhaoFirst;	//办结文号
	private Date riqiFirst;	//日期
	private String bumenFirst;	//部门
	private Date caozuodateFirst;	//实际操作时间
	private List<ProjectHandle> projectHandleList = Lists.newArrayList();		// 子表列表
	
	private String bihao;//编号，用于填充excel
	private String beizhu; //用于读取备注填充remarks
	
	private Date dateStart;
	private Date dateEnd;
	
	private String dateYear;
	
	public String getDateYear() {
		return dateYear;
	}

	public void setDateYear(String dateYear) {
		this.dateYear = dateYear;
	}

	public ProjectDeclare() {
		super();
	}

	public ProjectDeclare(String id){
		super(id);
	}
	
												
	@ExcelField(title="编号", align=2, sort=15)
	public String getBihao() {
		return bihao;
	}

	public void setBihao(String bihao) {
		this.bihao = bihao;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="申报时间不能为空")
	@ExcelField(title="申报日期", align=2, sort=20)
	public Date getDeclareDate() {
		return declareDate;
	}

	public void setDeclareDate(Date declareDate) {
		this.declareDate = declareDate;
	}
	
	@Length(min=0, max=64, message="项目代码长度必须介于 1 和 64 之间")
	@ExcelField(title="项目代码", align=2, sort=25)
	public String getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}
	
	@Length(min=0, max=64, message="项目类型长度必须介于 1 和 64 之间")
	@ExcelField(title="项目类型", align=2, sort=30)
	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	
	@Length(min=0, max=64, message="项目属性长度必须介于 1 和 64 之间")
	@ExcelField(title="项目属性", align=2, sort=35)
	public String getProjectAttribute() {
		return projectAttribute;
	}

	public void setProjectAttribute(String projectAttribute) {
		this.projectAttribute = projectAttribute;
	}
	
	@Length(min=0, max=64, message="项目名称长度必须介于 1 和 64 之间")
	@ExcelField(title="项目名称", align=2, sort=40)
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	@Length(min=0, max=64, message="申报单位长度必须介于 1 和 64 之间")
	@ExcelField(title="申报单位", align=2, sort=45)
	public String getProjectUnit() {
		return projectUnit;
	}

	public void setProjectUnit(String projectUnit) {
		this.projectUnit = projectUnit;
	}
	
	@Length(min=0, max=64, message="法人单位信息长度必须介于 1 和 64 之间")
	@ExcelField(title="法人单位信息", align=2, sort=50)
	public String getLegalUnitInfo() {
		return legalUnitInfo;
	}

	public void setLegalUnitInfo(String legalUnitInfo) {
		this.legalUnitInfo = legalUnitInfo;
	}
	
	@Length(min=0, max=64, message="项目投资额长度必须介于 1 和 64 之间")
	@ExcelField(title="项目投资额(万元)", align=2, sort=55)
	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}
	
	@Length(min=0, max=64, message="国标行业长度必须介于 1 和 64 之间")
	@ExcelField(title="国标行业", align=2, sort=60)
	public String getGuobiao() {
		return guobiao;
	}

	public void setGuobiao(String guobiao) {
		this.guobiao = guobiao;
	}
	
	@Length(min=0, max=64, message="管理行业长度必须介于 1 和 64 之间")
	@ExcelField(title="管理行业", align=2, sort=65)
	public String getGuanli() {
		return guanli;
	}

	public void setGuanli(String guanli) {
		this.guanli = guanli;
	}
	
	@Length(min=0, max=64, message="建设地点长度必须介于 1 和 64 之间")
	@ExcelField(title="建设地点", align=2, sort=70)
	public String getBuildPlace() {
		return buildPlace;
	}

	public void setBuildPlace(String buildPlace) {
		this.buildPlace = buildPlace;
	}
	
	@Length(min=0, max=64, message="建设详细地址长度必须介于 1 和 64 之间")
	@ExcelField(title="建设详细地址", align=2, sort=75)
	public String getBuildDetailPlace() {
		return buildDetailPlace;
	}

	public void setBuildDetailPlace(String buildDetailPlace) {
		this.buildDetailPlace = buildDetailPlace;
	}
	
	@Length(min=0, max=258, message="建设规模及内容长度必须介于 1 和 258 之间")
	@ExcelField(title="建设规模及内容", align=2, sort=80)
	public String getScaleandinfo() {
		return scaleandinfo;
	}

	public void setScaleandinfo(String scaleandinfo) {
		this.scaleandinfo = scaleandinfo;
	}
	
	@Length(min=0, max=64, message="姓名长度必须介于 1 和 64 之间")
	@ExcelField(title="姓名", align=2, sort=85)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="联系方式长度必须介于 1 和 64 之间")
	@ExcelField(title="联系电话", align=2, sort=90)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=0, max=64, message="名称长度必须介于 1 和 64 之间")
	@ExcelField(title="名称", align=2, sort=95)
	public String getNameFirst() {
		return nameFirst;
	}

	public void setNameFirst(String nameFirst) {
		this.nameFirst = nameFirst;
	}
	
	@Length(min=0, max=64, message="办理状态长度必须介于 1 和 64 之间")
	@ExcelField(title="办理状态", align=2, sort=100)
	public String getStatusFirst() {
		return statusFirst;
	}

	public void setStatusFirst(String statusFirst) {
		this.statusFirst = statusFirst;
	}

	@Length(min=0, max=64, message="办结文号长度必须介于 1 和 64 之间")
	@ExcelField(title="办结文号", align=2, sort=105)
	public String getWenhaoFirst() {
		return wenhaoFirst;
	}

	public void setWenhaoFirst(String wenhaoFirst) {
		this.wenhaoFirst = wenhaoFirst;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="日期", align=2, sort=110)
	public Date getRiqiFirst() {
		return riqiFirst;
	}

	public void setRiqiFirst(Date riqiFirst) {
		this.riqiFirst = riqiFirst;
	}

	@Length(min=0, max=64, message="部门长度必须介于 1 和 64 之间")
	@ExcelField(title="部门", align=2, sort=115)
	public String getBumenFirst() {
		return bumenFirst;
	}

	public void setBumenFirst(String bumenFirst) {
		this.bumenFirst = bumenFirst;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="实际操作时间", align=2, sort=120)
	public Date getCaozuodateFirst() {
		return caozuodateFirst;
	}

	public void setCaozuodateFirst(Date caozuodateFirst) {
		this.caozuodateFirst = caozuodateFirst;
	}
	
	
	@Length(min=0, max=255, message="备注长度必须介于 1 和 64 之间")
	@ExcelField(title="备注", align=2, sort=125)
	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
		super.setRemarks(beizhu);
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<ProjectHandle> getProjectHandleList() {
		return projectHandleList;
	}

	public void setProjectHandleList(List<ProjectHandle> projectHandleList) {
		this.projectHandleList = projectHandleList;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	 
	
	
	
}