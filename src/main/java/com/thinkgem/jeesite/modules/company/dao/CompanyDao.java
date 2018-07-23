/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.company.dao;

import java.util.ArrayList;
import java.util.Map;
import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.company.entity.Company;
import com.thinkgem.jeesite.modules.company.entity.echartsData;
import com.thinkgem.jeesite.modules.company.entity.moneyCount;
import com.thinkgem.jeesite.modules.company.entity.personCount;
import com.thinkgem.jeesite.modules.project.entity.monthData;

/**
 * 项目库建设DAO接口
 * @author freedomtaojie
 * @version 2018-04-11
 */
@MyBatisDao
public interface CompanyDao extends CrudDao<Company> {
	monthData getzhexianData(Map map);
	int getAllCount(Company company);
	int getzaiye(Company company);
	ArrayList<Company> gethangye(Company company);
	double getzhuce(Company company);
	personCount distinctCongye();
	moneyCount distinctzhuce();
	ArrayList<echartsData> getAllType();
	monthData getzhexianhangyeData(Map map);
	ArrayList<Company> analyze_credit();
	ArrayList<Company> sel_industry();
	
}