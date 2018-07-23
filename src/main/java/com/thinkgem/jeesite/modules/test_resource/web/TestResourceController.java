/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.test_resource.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.test_resource.entity.TestResource;
import com.thinkgem.jeesite.modules.test_resource.service.TestResourceService;

/**
 * 仓库资源的数量管理Controller
 * @author freedom
 * @version 2018-03-22
 */
@Controller
@RequestMapping(value = "${adminPath}/test_resource/testResource")
public class TestResourceController extends BaseController {

	@Autowired
	private TestResourceService testResourceService;
	
	@ModelAttribute
	public TestResource get(@RequestParam(required=false) String id) {
		TestResource entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = testResourceService.get(id);
		}
		if (entity == null){
			entity = new TestResource();
		}
		return entity;
	}
	
	@RequiresPermissions("test_resource:testResource:view")
	@RequestMapping(value = {"list", ""})
	public String list(TestResource testResource, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TestResource> page = testResourceService.findPage(new Page<TestResource>(request, response), testResource); 
		model.addAttribute("page", page);
		return "modules/test_resource/testResourceList";
	}

	@RequiresPermissions("test_resource:testResource:view")
	@RequestMapping(value = "form")
	public String form(TestResource testResource, Model model) {
		model.addAttribute("testResource", testResource);
		return "modules/test_resource/testResourceForm";
	}

	@RequiresPermissions("test_resource:testResource:edit")
	@RequestMapping(value = "save")
	public String save(TestResource testResource, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, testResource)){
			return form(testResource, model);
		}
		testResourceService.save(testResource);
		addMessage(redirectAttributes, "保存仓库资源管理成功");
		return "redirect:"+Global.getAdminPath()+"/test_resource/testResource/?repage";
	}
	
	@RequiresPermissions("test_resource:testResource:edit")
	@RequestMapping(value = "delete")
	public String delete(TestResource testResource, RedirectAttributes redirectAttributes) {
		testResourceService.delete(testResource);
		addMessage(redirectAttributes, "删除仓库资源管理成功");
		return "redirect:"+Global.getAdminPath()+"/test_resource/testResource/?repage";
	}

}