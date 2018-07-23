/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.webServer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.company.entity.Company;
import com.thinkgem.jeesite.modules.company.entity.echartsData;
import com.thinkgem.jeesite.modules.company.entity.moneyCount;
import com.thinkgem.jeesite.modules.company.entity.personCount;
import com.thinkgem.jeesite.modules.project.entity.ProjectDeclare;
import com.thinkgem.jeesite.modules.project.entity.monthData;
import com.thinkgem.jeesite.modules.project.service.ProjectDeclareService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 项目入库Controller
 * @author freedom_taojie
 * @version 2018-04-10
 */
@Controller
@RequestMapping(value = "rpc/project/projectDeclare")
public class webController extends BaseController {

	@Autowired
	private ProjectDeclareService projectDeclareService;
	
	/**
	 * 供外部系统调用------项目入库
	 * @param projectDeclare
	 * @param model
	 * @param redirectAttributes
	 * @return
	 */
	@RequestMapping(value = "addProject",method = RequestMethod.POST)
	@ResponseBody
	public ResponseWrapper addProject(ProjectDeclare projectDeclare, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, projectDeclare)){
			return ResponseWrapper.markParamError();
		}
		try{
			User user = new User("1");
			projectDeclare.setCreateBy(user);//外部系统接入可以免登陆，入库用户为空用户
			projectDeclare.setUpdateBy(user);//外部系统接入可以免登陆，入库用户为空用户
			projectDeclareService.save(projectDeclare);
			return ResponseWrapper.saveSuccess();
		}catch(Exception e){
			e.printStackTrace();
			return ResponseWrapper.saveError();
		}
	}
	
	@RequestMapping(value = "zhexian")
	@ResponseBody
	public HashMap<String,Object>  zhexian(HttpServletRequest request){
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		String year = request.getParameter("year");
		HashMap<String,Object> param = new HashMap<String,Object>();
		param.put("year", year);
		monthData declare = projectDeclareService.getzhexianData(param);
		monthData handle = projectDeclareService.getzhexianhandleData(param);
		returnMap.put("declare", declare);
		returnMap.put("handle", handle);
		return returnMap;
	}
	
	

}