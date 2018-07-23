/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.company.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.company.entity.Company;
import com.thinkgem.jeesite.modules.company.entity.echartsData;
import com.thinkgem.jeesite.modules.company.entity.moneyCount;
import com.thinkgem.jeesite.modules.company.entity.personCount;
import com.thinkgem.jeesite.modules.company.dao.CompanyDao;
import com.thinkgem.jeesite.modules.project.entity.monthData;

/**
 * 项目库建设Service
 * @author freedomtaojie
 * @version 2018-04-11
 */
@Service
@Transactional(readOnly = true)
public class CompanyService extends CrudService<CompanyDao, Company> {
	
	@Autowired
	private CompanyDao companyDao;

	public Company get(String id) {
		return super.get(id);
	}
	
	public List<Company> findList(Company company) {
		return super.findList(company);
	}
	
	public Page<Company> findPage(Page<Company> page, Company company) {
		return super.findPage(page, company);
	}
	
	@Transactional(readOnly = false)
	public  void save(Company company) {
		super.save(company);
	}
	
	@Transactional(readOnly = false)
	public void delete(Company company) {
		super.delete(company);
	}
	
	@Transactional(readOnly = false)
	public monthData  getzhexianhangyeData(Map map){
		return companyDao.getzhexianhangyeData(map);
	}
	
	@Transactional(readOnly = false)
	public monthData  getzhexianData(Map map){
		return companyDao.getzhexianData(map);
	}
	
	@Transactional(readOnly = false)
	public int getAllCount(Company company){
		return companyDao.getAllCount(company);
	}
	
	@Transactional(readOnly = false)
	public int getzaiye(Company company){
		return companyDao.getzaiye(company);
	}
	
	@Transactional(readOnly = false)
	public ArrayList<Company> gethangye(Company company){
		return companyDao.gethangye(company);
	}
	
	@Transactional(readOnly = false)
	public double getzhuce(Company company){
		return companyDao.getzhuce(company);
	}
	
	@Transactional(readOnly = false)
	public personCount distinctCongye(){
		return companyDao.distinctCongye();
	}
	
	@Transactional(readOnly = false)
	public moneyCount distinctzhuce(){
		return companyDao.distinctzhuce();
	}
	
	@Transactional(readOnly = false)
	public ArrayList<echartsData> getAllType(){
		return companyDao.getAllType();
	}
	
	@Transactional(readOnly = false)
	public ArrayList<Company> analyze_credit(){
		return companyDao.analyze_credit();
	}
	
	@Transactional(readOnly = false)
	public ArrayList<Company> sel_industry(){
		return companyDao.sel_industry();
	}
}