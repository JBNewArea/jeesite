/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test_resource.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.test_resource.entity.TestResource;
import com.thinkgem.jeesite.modules.test_resource.dao.TestResourceDao;

/**
 * 仓库资源的数量管理Service
 * @author freedom
 * @version 2018-03-22
 */
@Service
@Transactional(readOnly = true)
public class TestResourceService extends CrudService<TestResourceDao, TestResource> {

	public TestResource get(String id) {
		return super.get(id);
	}
	
	public List<TestResource> findList(TestResource testResource) {
		return super.findList(testResource);
	}
	
	public Page<TestResource> findPage(Page<TestResource> page, TestResource testResource) {
		return super.findPage(page, testResource);
	}
	
	@Transactional(readOnly = false)
	public void save(TestResource testResource) {
		super.save(testResource);
	}
	
	@Transactional(readOnly = false)
	public void delete(TestResource testResource) {
		super.delete(testResource);
	}
	
}