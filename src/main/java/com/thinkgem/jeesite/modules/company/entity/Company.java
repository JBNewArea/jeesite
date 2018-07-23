/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.company.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 企业库建设Entity
 * @author freedomtaojie
 * @version 2018-04-11
 */
public class Company extends DataEntity<Company> {
	
	private static final long serialVersionUID = 1L;
	private String companyCreditcode;		// 企业信用代码
	private String companyCreditcodeState;		// 营业执照状态
	private String oldRegisternumber;		// 旧注册代码
	private String companyQualityrating;		// 企业信用等级
	private String permitnumber;		// 名称核准号
	private String companyname;		// 企业名称
	private String companyState;		// 企业状态
	private String companydomicile;		// 住所
	private String domicileAdministrativedivision;		// 住所行政区划
	private String domicileEquities;		// 住所产权
	private Date domicileExpirationdate;		// 住所截止日期
	private String legalIdentitycard;		// 法定代表人身份证号
	private String legalName;		// 法定代表人姓名
	private String industryInvolved;		// 所属行业
	private String companyType;		// 企业类型
	private String registeredCapital;		// 注册资本
	private String registrationAuthority;		// 登记机关
	private String popedom;		// 所属管区
	private String entrustedAgency;		// 被委托机关
	private String urbanandrural;		// 城乡标志
	private Date establishment;		// 设立时间
	private Date annualInspection;		// 年检日期
	private String licensedProject;		// 许可经营项目
	private String generalBusinessProject;		// 一般经营项目
	private String scopeOfOperation;		// 经营范围
	private Date businessHoursStart;		// 营业时间 开始
	private Date businessHoursEnd;		// 营业时间 截止
	private Date licensingDate;		// 发照日期
	private Date approvalDate;		// 核准日期
	private String copyNumber;		// 副本份数
	private String practitionersNumber;		// 从业人数
	private String belaidOffNumber;		// 下岗人数
	private String investorNumber;		// 投资者人数
	private String investorLaidOffNumber;		// 投资者中下岗职工人数
	private String employeeNumber;		// 雇工人数
	private String employeeLaidOffNumber;		// 雇工中下岗职工人数
	private String placeLaidOffNumber;		// 安置下岗 职工人数
	private String postalCode;		// 邮政编码
	private String contactNumber;		// 联系电话
	private String fax;		// 传真
	private String email;		// 电子邮件
	private String website;		// 网址
	private String transformationRegisterMark;		// 转型登记标识
	private String cubeStyle;		// 一般新设
	private String companyPlace;	//经营地址
	private String xunchazu;	//巡查组
	
	private String transstreet;//所属街道
	private String transterrace;//所属平台
	
	
	private Date dateStart;//用于筛选
	private Date dateEnd;//用于筛选
	
	private String dateYear;//用于筛选
	
	private String creditNum;
	
	private String industryNun;
	
	public Company() {
		super();
	}

	public Company(String id){
		super(id);
	}

	@Length(min=0, max=15, message="名称核准号长度必须介于 0 和 15 之间")
	@ExcelField(title="名称核准号", align=2, sort=20)
	public String getPermitnumber() {
		return permitnumber;
	}

	public void setPermitnumber(String permitnumber) {
		this.permitnumber = permitnumber;
	}


	@Length(min=1, max=18, message="注册号/企业信用代码长度必须介于 1 和 18 之间")
	@ExcelField(title="注册号/企业信用代码", align=2, sort=25)
	public String getCompanyCreditcode() {
		return companyCreditcode;
	}

	public void setCompanyCreditcode(String companyCreditcode) {
		this.companyCreditcode = companyCreditcode;
	}


@Length(min=0, max=500, message="企业名称长度必须介于 0 和 500 之间")
	@ExcelField(title="企业名称", align=2, sort=30)
	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

@Length(min=0, max=100, message="法定代表人姓名长度必须介于 0 和 100 之间")
	@ExcelField(title="法定代表人姓名", align=2, sort=35)
	public String getLegalName() {
		return legalName;
	}

	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}

@Length(min=0, max=5000, message="经营范围长度必须介于 0 和 5000 之间")
	@ExcelField(title="经营范围", align=2, sort=40)
	public String getScopeOfOperation() {
		return scopeOfOperation;
	}

	public void setScopeOfOperation(String scopeOfOperation) {
		this.scopeOfOperation = scopeOfOperation;
	}
@Length(min=0, max=255, message="经营地址长度必须介于 0 和 50 之间")
	@ExcelField(title="经营地址", align=2, sort=45)
	public String getCompanyPlace() {
		return companyPlace;
	}

	public void setCompanyPlace(String companyPlace) {
		this.companyPlace = companyPlace;
	}
@Length(min=0, max=100, message="注册资本长度必须介于 0 和 100 之间")
	@ExcelField(title="注册资本", align=2, sort=50)
	public String getRegisteredCapital() {
		return registeredCapital;
	}

	public void setRegisteredCapital(String registeredCapital) {
		this.registeredCapital = registeredCapital;
	}
@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="营业时间 开始", align=2, sort=55)
	public Date getBusinessHoursStart() {
		return businessHoursStart;
	}

	public void setBusinessHoursStart(Date businessHoursStart) {
		this.businessHoursStart = businessHoursStart;
	}
@Length(min=0, max=100, message="企业类型长度必须介于 0 和 100 之间")
	@ExcelField(title="企业类型", align=2, sort=60)
	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}
@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="核准日期", align=2, sort=65)
	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
@Length(min=0, max=500, message="所属行业长度必须介于 0 和 500 之间")
	@ExcelField(title="所属行业", align=2, sort=70)
	public String getIndustryInvolved() {
		return industryInvolved;
	}

	public void setIndustryInvolved(String industryInvolved) {
		this.industryInvolved = industryInvolved;
	}
@Length(min=0, max=100, message="登记机关长度必须介于 0 和 100 之间")
	@ExcelField(title="登记机关", align=2, sort=75)
	public String getRegistrationAuthority() {
		return registrationAuthority;
	}

	public void setRegistrationAuthority(String registrationAuthority) {
		this.registrationAuthority = registrationAuthority;
	}
@Length(min=0, max=100, message="所属管区长度必须介于 0 和 100 之间")
	@ExcelField(title="所属管区", align=2, sort=80)
	public String getPopedom() {
		return popedom;
	}

	public void setPopedom(String popedom) {
		this.popedom = popedom;
	}
@Length(min=0, max=1000, message="住所长度必须介于 0 和 1000 之间")
	@ExcelField(title="住所", align=2, sort=85)
	public String getCompanydomicile() {
		return companydomicile;
	}

	public void setCompanydomicile(String companydomicile) {
		this.companydomicile = companydomicile;
	}
@Length(min=0, max=50, message="企业状态长度必须介于 0 和 50 之间")
	@ExcelField(title="企业状态", align=2, sort=90)
	public String getCompanyState() {
		return companyState;
	}

	public void setCompanyState(String companyState) {
		this.companyState = companyState;
	}
@Length(min=0, max=255, message="企业信用等级长度必须介于 0 和255 之间")
	@ExcelField(title="企业信用等级", align=2, sort=95)
	public String getCompanyQualityrating() {
		return companyQualityrating;
	}

	public void setCompanyQualityrating(String companyQualityrating) {
		this.companyQualityrating = companyQualityrating;
	}
@Length(min=0, max=20, message="旧注册代码长度必须介于 0 和 20 之间")
	@ExcelField(title="旧注册代码", align=2, sort=100)
	public String getOldRegisternumber() {
		return oldRegisternumber;
	}

	public void setOldRegisternumber(String oldRegisternumber) {
		this.oldRegisternumber = oldRegisternumber;
	}
@Length(min=0, max=100, message="从业人数长度必须介于 0 和 100 之间")
	@ExcelField(title="从业人数", align=2, sort=105)
	public String getPractitionersNumber() {
		return practitionersNumber;
	}

	public void setPractitionersNumber(String practitionersNumber) {
		this.practitionersNumber = practitionersNumber;
	}
@Length(min=0, max=100, message="下岗人数长度必须介于 0 和 100 之间")
	@ExcelField(title="下岗人数", align=2, sort=110)
	public String getBelaidOffNumber() {
		return belaidOffNumber;
	}

	public void setBelaidOffNumber(String belaidOffNumber) {
		this.belaidOffNumber = belaidOffNumber;
	}
@Length(min=0, max=11, message="联系电话长度必须介于 0 和 20 之间")
	@ExcelField(title="联系电话", align=2, sort=115)
	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
@Length(min=0, max=100, message="邮政编码长度必须介于 0 和 100 之间")
	@ExcelField(title="邮政编码", align=2, sort=120)
	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
@Length(min=0, max=500, message="许可经营项目长度必须介于 0 和 500 之间")
	@ExcelField(title="许可经营项目", align=2, sort=125)
	public String getLicensedProject() {
		return licensedProject;
	}

	public void setLicensedProject(String licensedProject) {
		this.licensedProject = licensedProject;
	}
@Length(min=0, max=500, message="一般经营项目长度必须介于 0 和 500 之间")
	@ExcelField(title="一般经营项目", align=2, sort=130)
	public String getGeneralBusinessProject() {
		return generalBusinessProject;
	}

	public void setGeneralBusinessProject(String generalBusinessProject) {
		this.generalBusinessProject = generalBusinessProject;
	}
@Length(min=0, max=255, message="巡查组长度必须介于 0 和 50 之间")
	@ExcelField(title="巡查组", align=2, sort=135)
	public String getXunchazu() {
		return xunchazu;
	}

	public void setXunchazu(String xunchazu) {
		this.xunchazu = xunchazu;
	}
@Length(min=0, max=50, message="营业执照状态长度必须介于 0 和 50 之间")
	@ExcelField(title="营业执照状态", align=2, sort=140)
	public String getCompanyCreditcodeState() {
		return companyCreditcodeState;
	}

	public void setCompanyCreditcodeState(String companyCreditcodeState) {
		this.companyCreditcodeState = companyCreditcodeState;
	}

	public String getDomicileAdministrativedivision() {
		return domicileAdministrativedivision;
	}

	public void setDomicileAdministrativedivision(
			String domicileAdministrativedivision) {
		this.domicileAdministrativedivision = domicileAdministrativedivision;
	}

	public String getDomicileEquities() {
		return domicileEquities;
	}

	public void setDomicileEquities(String domicileEquities) {
		this.domicileEquities = domicileEquities;
	}

	public Date getDomicileExpirationdate() {
		return domicileExpirationdate;
	}

	public void setDomicileExpirationdate(Date domicileExpirationdate) {
		this.domicileExpirationdate = domicileExpirationdate;
	}

	public String getLegalIdentitycard() {
		return legalIdentitycard;
	}

	public void setLegalIdentitycard(String legalIdentitycard) {
		this.legalIdentitycard = legalIdentitycard;
	}

	public String getEntrustedAgency() {
		return entrustedAgency;
	}

	public void setEntrustedAgency(String entrustedAgency) {
		this.entrustedAgency = entrustedAgency;
	}

	public String getUrbanandrural() {
		return urbanandrural;
	}

	public void setUrbanandrural(String urbanandrural) {
		this.urbanandrural = urbanandrural;
	}

	public Date getEstablishment() {
		return establishment;
	}

	public void setEstablishment(Date establishment) {
		this.establishment = establishment;
	}

	public Date getAnnualInspection() {
		return annualInspection;
	}

	public void setAnnualInspection(Date annualInspection) {
		this.annualInspection = annualInspection;
	}

	public Date getBusinessHoursEnd() {
		return businessHoursEnd;
	}

	public void setBusinessHoursEnd(Date businessHoursEnd) {
		this.businessHoursEnd = businessHoursEnd;
	}

	public Date getLicensingDate() {
		return licensingDate;
	}

	public void setLicensingDate(Date licensingDate) {
		this.licensingDate = licensingDate;
	}

	public String getCopyNumber() {
		return copyNumber;
	}

	public void setCopyNumber(String copyNumber) {
		this.copyNumber = copyNumber;
	}

	public String getInvestorNumber() {
		return investorNumber;
	}

	public void setInvestorNumber(String investorNumber) {
		this.investorNumber = investorNumber;
	}

	public String getInvestorLaidOffNumber() {
		return investorLaidOffNumber;
	}

	public void setInvestorLaidOffNumber(String investorLaidOffNumber) {
		this.investorLaidOffNumber = investorLaidOffNumber;
	}

	public String getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getEmployeeLaidOffNumber() {
		return employeeLaidOffNumber;
	}

	public void setEmployeeLaidOffNumber(String employeeLaidOffNumber) {
		this.employeeLaidOffNumber = employeeLaidOffNumber;
	}

	public String getPlaceLaidOffNumber() {
		return placeLaidOffNumber;
	}

	public void setPlaceLaidOffNumber(String placeLaidOffNumber) {
		this.placeLaidOffNumber = placeLaidOffNumber;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getTransformationRegisterMark() {
		return transformationRegisterMark;
	}

	public void setTransformationRegisterMark(String transformationRegisterMark) {
		this.transformationRegisterMark = transformationRegisterMark;
	}

	public String getCubeStyle() {
		return cubeStyle;
	}

	public void setCubeStyle(String cubeStyle) {
		this.cubeStyle = cubeStyle;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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

	public String getDateYear() {
		return dateYear;
	}

	public void setDateYear(String dateYear) {
		this.dateYear = dateYear;
	}

	public String getCreditNum() {
		return creditNum;
	}

	public void setCreditNum(String creditNum) {
		this.creditNum = creditNum;
	}

	public String getIndustryNun() {
		return industryNun;
	}

	public void setIndustryNun(String industryNun) {
		this.industryNun = industryNun;
	}

	public String getTransstreet() {
		return transstreet;
	}

	public void setTransstreet(String transstreet) {
		this.transstreet = transstreet;
	}

	public String getTransterrace() {
		return transterrace;
	}

	public void setTransterrace(String transterrace) {
		this.transterrace = transterrace;
	}
	
}