/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.company.entity.echartsData;
import com.thinkgem.jeesite.modules.company.entity.moneyCount;
import com.thinkgem.jeesite.modules.project.entity.ProjectDeclare;
import com.thinkgem.jeesite.modules.project.entity.monthData;
import com.thinkgem.jeesite.modules.project.dao.ProjectDeclareDao;
import com.thinkgem.jeesite.modules.project.entity.ProjectHandle;
import com.thinkgem.jeesite.modules.project.dao.ProjectHandleDao;

/**
 * 项目入库Service
 * @author freedom_taojie
 * @version 2018-04-10
 */
@Service
@Transactional(readOnly = true)
public class ProjectDeclareService extends CrudService<ProjectDeclareDao, ProjectDeclare> {

	@Autowired
	private ProjectHandleDao projectHandleDao;
	
	@Autowired
	private ProjectDeclareDao projectDeclareDao;
	
	public ProjectDeclare get(String id) {
		ProjectDeclare projectDeclare = super.get(id);
		projectDeclare.setProjectHandleList(projectHandleDao.findList(new ProjectHandle(projectDeclare)));
		return projectDeclare;
	}
	
	public List<ProjectDeclare> findList(ProjectDeclare projectDeclare) {
		return super.findList(projectDeclare);
	}
	
	public Page<ProjectDeclare> findPage(Page<ProjectDeclare> page, ProjectDeclare projectDeclare) {
		return super.findPage(page, projectDeclare);
	}
	
	@Transactional(readOnly = false)
	public void save(ProjectDeclare projectDeclare) {
		super.save(projectDeclare);
		for (ProjectHandle projectHandle : projectDeclare.getProjectHandleList()){
			if (projectHandle.getId() == null){
				continue;
			}
			if (ProjectHandle.DEL_FLAG_NORMAL.equals(projectHandle.getDelFlag())){
				if (StringUtils.isBlank(projectHandle.getId())){
					projectHandle.setProjectDeclare(projectDeclare);
					projectHandle.preInsert();
					projectHandleDao.insert(projectHandle);
				}else{
					projectHandle.preUpdate();
					projectHandleDao.update(projectHandle);
				}
			}else{
				projectHandleDao.delete(projectHandle);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(ProjectDeclare projectDeclare) {
		super.delete(projectDeclare);
		projectHandleDao.delete(new ProjectHandle(projectDeclare));
	}
	
	@Transactional(readOnly = false)
	public int getAccount(ProjectDeclare projectDeclare){
		return projectDeclareDao.getAccount(projectDeclare);
	}
	
	@Transactional(readOnly = false)
	public int getChildAccount(){
		return projectHandleDao.getAccount();
	}
	
	@Transactional(readOnly = false)
	public int getAccountByType(ProjectDeclare projectDeclare){
		return projectDeclareDao.findAccountByType(projectDeclare);
	}
	
	@Transactional(readOnly = false)
	public monthData getzhexianData(Map map){
		return projectDeclareDao.getzhexianData(map);
	}
	
	@Transactional(readOnly = false)
	public monthData getzhexianhandleData(Map map){
		return projectHandleDao.getzhexianhandleData(map);
	}
	
	@Transactional(readOnly = false)
	public ArrayList<echartsData> getAttribute(){
		return projectDeclareDao.getAttribute();
	}
	
	@Transactional(readOnly = false)
	public ArrayList<echartsData> getType(){
		return projectDeclareDao.getType();
	}
	
	@Transactional(readOnly = false)
	public ArrayList<echartsData> getguobiao(){
		return projectDeclareDao.getguobiao();
	}
	
	@Transactional(readOnly = false)
	public moneyCount getMoney(){
		return projectDeclareDao.getMoney();
	}
}