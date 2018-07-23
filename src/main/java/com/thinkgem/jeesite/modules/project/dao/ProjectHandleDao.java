/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.dao;

import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.project.entity.ProjectHandle;
import com.thinkgem.jeesite.modules.project.entity.monthData;

/**
 * 项目入库DAO接口
 * @author freedom_taojie
 * @version 2018-04-10
 */
@MyBatisDao
public interface ProjectHandleDao extends CrudDao<ProjectHandle> {
	int getAccount();
	monthData getzhexianhandleData(Map map);
}