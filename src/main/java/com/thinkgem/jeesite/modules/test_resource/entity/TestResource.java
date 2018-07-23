/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test_resource.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 仓库资源的数量管理Entity
 * @author freedom
 * @version 2018-03-22
 */
public class TestResource extends DataEntity<TestResource> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 物品类型
	private String name;		// 物品名称
	
	public TestResource() {
		super();
	}

	public TestResource(String id){
		super(id);
	}

	@Length(min=0, max=2, message="物品类型长度必须介于 0 和 2 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=1, max=255, message="物品名称长度必须介于 1 和 255 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}