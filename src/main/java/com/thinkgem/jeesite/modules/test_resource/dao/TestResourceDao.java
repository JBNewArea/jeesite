/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test_resource.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.test_resource.entity.TestResource;

/**
 * 仓库资源的数量管理DAO接口
 * @author freedom
 * @version 2018-03-22
 */
@MyBatisDao
public interface TestResourceDao extends CrudDao<TestResource> {
	
}