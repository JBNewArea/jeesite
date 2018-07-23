/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.company.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.activiti.engine.impl.util.json.JSONArray;
import org.activiti.engine.impl.util.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.omg.CORBA.portable.ApplicationException;
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

import com.google.common.collect.Lists;
import com.mysql.fabric.xmlrpc.base.Array;
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.ObjectUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.company.entity.Company;
import com.thinkgem.jeesite.modules.company.entity.echartsData;
import com.thinkgem.jeesite.modules.company.entity.moneyCount;
import com.thinkgem.jeesite.modules.company.entity.personCount;
import com.thinkgem.jeesite.modules.company.service.CompanyService;
import com.thinkgem.jeesite.modules.project.entity.monthData;

/**
 * 项目库建设Controller
 * @author freedomtaojie
 * @version 2018-04-11
 */
@Controller
@RequestMapping(value = "${adminPath}/company/company")
public class CompanyController extends BaseController {

	@Autowired
	private CompanyService companyService;
	
	@ModelAttribute
	public Company get(@RequestParam(required=false) String id) {
		Company entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = companyService.get(id);
		}
		if (entity == null){
			entity = new Company();
		}
		return entity;
	}
	
	@RequiresPermissions("company:company:view")
	@RequestMapping(value = {"list", ""})
	public String list(Company company, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Company> page = companyService.findPage(new Page<Company>(request, response), company); 
		model.addAttribute("page", page);
		return "modules/company/companyList";
	}

	@RequiresPermissions("company:company:view")
	@RequestMapping(value = "form")
	public String form(Company company, Model model) {
		model.addAttribute("company", company);
		return "modules/company/companyForm";
	}

	@RequiresPermissions("company:company:edit")
	@RequestMapping(value = "save")
	public String save(Company company, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, company)){
			return form(company, model);
		}
		companyService.save(company);
		addMessage(redirectAttributes, "保存项目库成功");
		return "redirect:"+Global.getAdminPath()+"/company/company/?repage";
	}
	
	@RequiresPermissions("company:company:edit")
	@RequestMapping(value = "delete")
	public String delete(Company company, RedirectAttributes redirectAttributes) {
		companyService.delete(company);
		addMessage(redirectAttributes, "删除项目库成功");
		return "redirect:"+Global.getAdminPath()+"/company/company/?repage";
	}
	
	@RequiresPermissions("company:company:view")
	@RequestMapping(value="batch")
	public String batch(){
		return "modules/company/batch";
	}
	
	/**
	 * 下载导入企业数据模板
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("company:company:edit")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "企业数据导入模板.xlsx";
            Company company = new Company();
            company.setId("1");
    		List<Company> list = Lists.newArrayList(); list.add(companyService.get(company));
    		new ExportExcel("企业数据", Company.class, 2).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败hahaha！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/company/company/list?repage";
    }
	
	/**
	 * 导入企业信息数据
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("company:company:edit")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/company/company/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			int chongfuNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<Company> list = ei.getDataList(Company.class);
			for (Company company : list){
				try{
					/*if ("true".equals(checkLoginName("", user.getLoginName()))){
						user.setPassword(SystemService.entryptPassword("123456"));
						BeanValidators.validateWithException(validator, user);
						systemService.saveUser(user);
						successNum++;
					}else{
						failureMsg.append("<br/>登录名 "+user.getLoginName()+" 已存在; ");
						failureNum++;
					}*/
					
					try{
						company.setRemarks("1");
						companyService.save(company);
						successNum++;
					}catch(Exception e){
						chongfuNum++;
						failureMsg.append("<br/>企业信用代码为 "+company.getCompanyCreditcode()+" 的数据重复，已过滤,法人姓名是："+company.getLegalName());
					}
				}catch(ConstraintViolationException ex){
					failureMsg.append("<br/>企业信用代码为 "+company.getCompanyCreditcode()+" 的数据导入失败：法人姓名是："+company.getLegalName());
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch (Exception ex) {
					failureMsg.append("<br/>企业信用代码为 "+company.getCompanyCreditcode()+" 的数据导入失败：");
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条企业信息，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条企业信息"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入企业信息失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/company/company/list?repage";
    }
	
	@RequiresPermissions("company:company:view")
	@RequestMapping(value = "zhexian")
	@ResponseBody
	public HashMap<String,Object>  zhexian(HttpServletRequest request) throws ApplicationException{
		String year = request.getParameter("year");
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		HashMap<String,Object> param = new HashMap<String,Object>();
		param.put("year", year);
		param.put("dateStart", request.getParameter("dateStart"));
		param.put("dateEnd", request.getParameter("dateEnd"));
		Date date = new Date();
		Calendar date2 = Calendar.getInstance();
		ArrayList<String> monthList = null;
		ArrayList<String> returnlist = null;
		ArrayList<String> monthList2 = null;
		ArrayList<String> returnlist2 = null;
		monthData monthData = companyService.getzhexianData(param);
		monthData monthData_hangye = companyService.getzhexianhangyeData(param);
        String year2 = String.valueOf(date2.get(Calendar.YEAR));
        int month = date.getMonth();
		monthList = monthData!=null?monthData.changetoList():initList();
		if(!monthList.isEmpty()){
			returnlist = new ArrayList<String>();
			for(int i=0;i<monthList.size();i++){
				if(year2.equals(year)&&month<i){
					break;
				}else{
					returnlist.add(monthList.get(i));
				}
			}
		}
		monthList2 = monthData_hangye!=null?monthData_hangye.changetoList():initList();
		if(!monthList2.isEmpty()){
			returnlist2 = new ArrayList<String>();
			for(int i=0;i<monthList2.size();i++){
				if(year2.equals(year)&&month<i){
					break;
				}else{
					returnlist2.add(monthList2.get(i));
				}
			}
		}
		returnMap.put("company", returnlist);
		returnMap.put("hangye",returnlist2);
		return returnMap;
	}
	
	public static ArrayList<String> initList(){
		ArrayList<String> list = new ArrayList<String>();
		for(int i=0;i<12;i++){
			list.add("0");
		}
		return list;
	}
	
	@RequiresPermissions("company:company:view")
	@RequestMapping(value = "show")
	public String show( RedirectAttributes redirectAttributes,Model model,Company company) {
		//方块区数据
		int qiye = companyService.getAllCount(company);
//		Company company = new Company();
		company.setCompanyState("在业");
		int zaiye = companyService.getzaiye(company);
		ArrayList<Company> list = companyService.gethangye(company);
		int hangye = list.size();
		double zhuce = companyService.getzhuce(company)/10000;
		String s1 = String.format("%.2f", zhuce);
		model.addAttribute("qiye",qiye);
		model.addAttribute("zaiye",zaiye);
		model.addAttribute("hangye", hangye);
		model.addAttribute("zhuce",s1);
		return "modules/company/companyshow";
	}
	
	@RequestMapping(value="tongji_left")
	@ResponseBody
	public HashMap<String,Object> tongji_left(Company company,HttpServletRequest request){
		HashMap<String,Object> model = new HashMap<String,Object>();
		//方块区数据
		int qiye = companyService.getAllCount(company);
//				Company company = new Company();
		company.setCompanyState("在业");
		int zaiye = companyService.getzaiye(company);
		ArrayList<Company> list = companyService.gethangye(company);
		int hangye = list.size();
		double zhuce = companyService.getzhuce(company)/10000;
		String s1 = String.format("%.2f", zhuce);
		model.put("qiye",qiye);
		model.put("zaiye",zaiye);
		model.put("hangye", hangye);
		model.put("zhuce",s1);
		return model;
	}
	
	
	
	@RequiresPermissions("company:company:view")
	@RequestMapping(value = "echarts")
	@ResponseBody
	public HashMap<String,Object>  echarts(HttpServletRequest request){
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		personCount personCount = companyService.distinctCongye();
		moneyCount moneyCount = companyService.distinctzhuce();
		ArrayList<echartsData> typeList = companyService.getAllType();
		ArrayList<Company> creditList = companyService.analyze_credit();
		ArrayList<String> nameList = new ArrayList<String>();
		for(echartsData data : typeList){
			nameList.add(data.getName());
		}
		
		ArrayList<Map<String,String>> newcreditList = null;
		if(!creditList.isEmpty()){
			Map<String,String> map = null;
			newcreditList = new ArrayList<>();
			for (Company company : creditList) {
				 map = new HashMap<>();
				 map.put("name", company.getCompanyQualityrating());
				 map.put("value", company.getCreditNum());
				 newcreditList.add(map);
			}
		}
		returnMap.put("congye", personCount);
		returnMap.put("zhuce", moneyCount);
		returnMap.put("type_kv", typeList);
		returnMap.put("type_name", nameList);
		returnMap.put("newcreditList", newcreditList);
		return returnMap;
	}
	
	@RequiresPermissions("company:company:view")
	@RequestMapping(value = "echarts_two")
	@ResponseBody
	public HashMap<String,Object>  echarts_two(HttpServletRequest request){
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		String year = request.getParameter("year");
		HashMap<String,Object> param = new HashMap<String,Object>();
		param.put("year", year);
		Date date = new Date();
		Calendar date2 = Calendar.getInstance();
        String year2 = String.valueOf(date2.get(Calendar.YEAR));
        int month = date.getMonth();
        monthData monthData = companyService.getzhexianData(param);
		ArrayList<String> monthList = monthData.changetoList();
		Iterator<String> listIt = monthList.iterator();
		while(listIt.hasNext()){
			if(year2.equals(year)&&month<=indexOf(monthList,listIt.next())){
				listIt.remove();
			}else{
				listIt.next();
			}
		}
		returnMap.put("company", monthData);
		return returnMap;
	}
	

	public static String getRandColor() {
		  String r, g, b;
		  Random random = new Random();
		  r = Integer.toHexString(random.nextInt(256)).toUpperCase();
		  g = Integer.toHexString(random.nextInt(256)).toUpperCase();
		  b = Integer.toHexString(random.nextInt(256)).toUpperCase();

		  r = r.length() == 1 ? "0" + r : r;
		  g = g.length() == 1 ? "0" + g : g;
		  b = b.length() == 1 ? "0" + b : b;
		  return "#" + r + g + b;
		 }
	
	public static void main(String[] args) {
		monthData monthData = new monthData();
		monthData.setApril("8");
		monthData.setAugust("4");
		monthData.setDecember("12");
		monthData.setFebruary("2");
		monthData.setJanuary("1");
		monthData.setJuly("7");
		monthData.setJune("6");
		monthData.setMarch("3");
		monthData.setMay("5");
		monthData.setNovember("11");
		monthData.setOctober("10");
		monthData.setSeptember("9");
		ArrayList<String> monthList = monthData.changetoList();
		Iterator<String> listIt = monthList.iterator();
		Date date = new Date();
		String year = "2018";
		int month = date.getMonth();
		Calendar date2 = Calendar.getInstance();
        String year2 = String.valueOf(date2.get(Calendar.YEAR));
		while(listIt.hasNext()){
			if(year2.equals(year)&&month<=indexOf(monthList,listIt.next())){
				listIt.remove();
			}else{
				listIt.next();
			}
			
		}
		for(String s : monthList){
			System.out.println(s);
		}
	}
	//返回将要检查的元素的索引
    public static int indexOf(List<String> list, String str) {
        for(ListIterator<String> it = list.listIterator(); it.hasNext();) {
            if(str == null ? it.next() == null : str.equals(it.next())) {
                return it.previousIndex();        //这点不明白
            }
        }
        return -1;        //没找到
    }
}