/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.project.web;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.thinkgem.jeesite.common.beanvalidator.BeanValidators;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ImportExcel;
import com.thinkgem.jeesite.modules.company.entity.echartsData;
import com.thinkgem.jeesite.modules.company.entity.moneyCount;
import com.thinkgem.jeesite.modules.project.entity.ProjectDeclare;
import com.thinkgem.jeesite.modules.project.entity.monthData;
import com.thinkgem.jeesite.modules.project.service.ProjectDeclareService;
import net.sf.json.JSONArray;


/**
 * 项目入库Controller
 * @author freedom_taojie
 * @version 2018-04-10
 */
@Controller
@RequestMapping(value = "${adminPath}/project/projectDeclare")
public class ProjectDeclareController extends BaseController {

	@Autowired
	private ProjectDeclareService projectDeclareService;
	
	@ModelAttribute
	public ProjectDeclare get(@RequestParam(required=false) String id) {
		ProjectDeclare entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = projectDeclareService.get(id);
		}
		if (entity == null){
			entity = new ProjectDeclare();
		}
		return entity;
	}
	
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = {"list", ""})
	public String list(ProjectDeclare projectDeclare, HttpServletRequest request, HttpServletResponse response, Model model) {
		assemble(projectDeclare);//装配参数，用于方块跳转
		Page<ProjectDeclare> page0 = new Page<ProjectDeclare>(request, response);
		page0.setOrderBy("a.money asc");
		Page<ProjectDeclare> page = projectDeclareService.findPage(page0, projectDeclare); 
		model.addAttribute("page", page);
		return "modules/project/projectDeclareList";
	}

	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = "form")
	public String form(ProjectDeclare projectDeclare, Model model) {
		model.addAttribute("projectDeclare", projectDeclare);
		return "modules/project/projectDeclareForm";
	}

	@RequiresPermissions("project:projectDeclare:edit")
	@RequestMapping(value = "save")
	public String save(ProjectDeclare projectDeclare, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, projectDeclare)){
			return form(projectDeclare, model);
		}
		projectDeclareService.save(projectDeclare);
		addMessage(redirectAttributes, "保存项目入库成功");
		return "redirect:"+Global.getAdminPath()+"/project/projectDeclare/?repage";
	}
	
	@RequiresPermissions("project:projectDeclare:edit")
	@RequestMapping(value = "delete")
	public String delete(ProjectDeclare projectDeclare, RedirectAttributes redirectAttributes) {
		projectDeclareService.delete(projectDeclare);
		addMessage(redirectAttributes, "删除项目入库成功");
		return "redirect:"+Global.getAdminPath()+"/project/projectDeclare/?repage";
	}
	
	
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = "mapPic")
	public String showMapPic(RedirectAttributes redirectAttributes,Model model){
		//组装参数
				ProjectDeclare projectDeclareDto = new ProjectDeclare();
				ArrayList<ProjectDeclare> list  = projectDeclareService.queryProject(projectDeclareDto);
				List<Map<String,Object>> list_1 = new ArrayList<>();
				Map<String,Object> _tempMap = null;
				if(!list.isEmpty()){
					for (ProjectDeclare _projectDeclare : list) {
						_tempMap = new HashMap();
						_tempMap.put("longitude",_projectDeclare.getLongitude());
						_tempMap.put("latitude", _projectDeclare.getLatitude());
						_tempMap.put("projectName",_projectDeclare.getProjectName());
						_tempMap.put("buildDetailPlace", _projectDeclare.getBuildDetailPlace());
						list_1.add(_tempMap);
					}
				}
				model.addAttribute("declareList", JSONArray.fromObject(list_1));
		return "modules/map/mapPic";
	}
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = "showMap")
	public String showMap(RedirectAttributes redirectAttributes,Model model,String longitude,String latitude,String buildDetailPlace,String projectName){
		model.addAttribute("longitude", longitude);
		model.addAttribute("latitude", latitude);
		model.addAttribute("buildDetailPlace",buildDetailPlace);
		model.addAttribute("projectName",projectName);
		return "modules/map/map";
	}
   
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = "mapChart")
	public String showMapChart(RedirectAttributes redirectAttributes,Model model,String code,String name,String type,String attribute){
		//组装参数
		ProjectDeclare projectDeclareDto = new ProjectDeclare();
		projectDeclareDto.setProjectCode(code);
		projectDeclareDto.setProjectName(name);
		projectDeclareDto.setProjectType(type);
		projectDeclareDto.setProjectAttribute(attribute);
		ArrayList<ProjectDeclare> list  = projectDeclareService.queryProject(projectDeclareDto);
		List<Map<String,Object>> list_1 = new ArrayList<>();
		Map<String,Object> _tempMap = null;
		if(!list.isEmpty()){
			for (ProjectDeclare _projectDeclare : list) {
				_tempMap = new HashMap();
				_tempMap.put("longitude",_projectDeclare.getLongitude());
				_tempMap.put("latitude", _projectDeclare.getLatitude());
				_tempMap.put("projectName",_projectDeclare.getProjectName());
				_tempMap.put("buildDetailPlace", _projectDeclare.getBuildDetailPlace());
				list_1.add(_tempMap);
			}
		}
		model.addAttribute("declareList", JSONArray.fromObject(list_1));
		model.addAttribute("url","/a/project/projectDeclare/mapChart");
		model.addAttribute("ProjectDeclare",projectDeclareDto);
		model.addAttribute("chartType","project");
		return "modules/map/mapChart";
	}
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = "show")
	public String show( RedirectAttributes redirectAttributes,Model model,ProjectDeclare projectDeclare) {
		int declare = projectDeclareService.getAccount(projectDeclare);
//		int handle = projectDeclareService.getChildAccount();
		ProjectDeclare temp = new ProjectDeclare();
		temp.setProjectType("核准");
		int hezhun = projectDeclareService.getAccountByType(temp);//查出核准的数量
		model.addAttribute("declare", declare);
//		model.addAttribute("handle",handle);
		model.addAttribute("hezhun",hezhun);
		projectDeclare.setProjectType("备案");
		int ba = projectDeclareService.getAccountByType(projectDeclare);
		projectDeclare.setProjectType("审批");
		int sp = projectDeclareService.getAccountByType(projectDeclare);
		model.addAttribute("ba",ba);
		model.addAttribute("sp",sp);
		return "modules/project/projectDeclareshow";
	}
	
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = "zhexian")
	@ResponseBody
	public HashMap<String,Object>  zhexian(HttpServletRequest request){
		String year = request.getParameter("year");
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		HashMap<String,Object> param = new HashMap<String,Object>();
		Date date = new Date();
		Calendar date2 = Calendar.getInstance();
		ArrayList<String> monthList1  = null;
		ArrayList<String> returnlist1 = null;
		ArrayList<String> monthList2  = null;
		ArrayList<String> returnlist2  = null;
		param.put("year", year);
		param.put("dateStart", request.getParameter("dateStart"));
		param.put("dateEnd", request.getParameter("dateEnd"));
		monthData declare = projectDeclareService.getzhexianData(param);
		monthData handle = projectDeclareService.getzhexianhandleData(param);
        String year2 = String.valueOf(date2.get(Calendar.YEAR));
        int month = date.getMonth();
        monthList1 = declare!=null?declare.changetoList():initList();
		if(!monthList1.isEmpty()){
			returnlist1 = new ArrayList<String>();
			for(int i=0;i<monthList1.size();i++){
				if(year2.equals(year)&&month<i){
					break;
				}else{
					returnlist1.add(monthList1.get(i));
				}
			}
		}
		monthList2 = handle!=null?handle.changetoList():initList();
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
		returnMap.put("declare", returnlist1);
		returnMap.put("handle", returnlist2);
		return returnMap;
	}
	
	@RequestMapping(value="tongji_left")
	@ResponseBody
	public HashMap<String,Object> tongji_left(ProjectDeclare projectDeclare,HttpServletRequest request){
		HashMap<String,Object> model = new HashMap<String,Object>();
		int declare = projectDeclareService.getAccount(projectDeclare);
//		int handle = projectDeclareService.getChildAccount();
		projectDeclare.setProjectType("核准");
		int hezhun = projectDeclareService.getAccountByType(projectDeclare);//查出核准的数量
		model.put("declare", declare);
//		model.addAttribute("handle",handle);
		model.put("hezhun",hezhun);
		projectDeclare.setProjectType("备案");
		int ba = projectDeclareService.getAccountByType(projectDeclare);
		projectDeclare.setProjectType("审批");
		int sp = projectDeclareService.getAccountByType(projectDeclare);
		model.put("ba",ba);
		model.put("sp",sp);
		return model;
	}
	
	public static ArrayList<String> initList(){
		ArrayList<String> list = new ArrayList<String>();
		for(int i=0;i<12;i++){
			list.add("0");
		}
		return list;
	}
	
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value = "echarts")
	@ResponseBody
	public HashMap<String,Object>  echarts(HttpServletRequest request){
		HashMap<String,Object> returnMap = new HashMap<String,Object>();
		ArrayList<echartsData> projectAttribute = projectDeclareService.getAttribute();
		ArrayList<echartsData> projectType = projectDeclareService.getType();
		ArrayList<echartsData> guobiao = projectDeclareService.getguobiao();
		moneyCount money = projectDeclareService.getMoney();
		ArrayList<String> AttributeList = new ArrayList<String>();
		ArrayList<String> TypeList = new ArrayList<String>();
		ArrayList<String> guobiaoList = new ArrayList<String>();
		for(echartsData data : projectAttribute){
			AttributeList.add(data.getName());
		}
		for(echartsData data : projectType){
			TypeList.add(data.getName());
		}
		for(echartsData data : guobiao){
			guobiaoList.add(data.getName());
		}
		returnMap.put("projectAttribute", projectAttribute);
		returnMap.put("projectType", projectType);
		returnMap.put("guobiao", guobiao);
		returnMap.put("money", money);
		returnMap.put("guobiao_name", guobiaoList);
		returnMap.put("projectType_name", TypeList);
		returnMap.put("projectAttribute_name", AttributeList);
		return returnMap;
	}
	
	@RequiresPermissions("project:projectDeclare:view")
	@RequestMapping(value="batch")
	public String batch(){
		return "modules/project/batch";
	}
	
	/**
	 * 导入企业信息数据
	 * @param file
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("project:projectDeclare:edit")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			addMessage(redirectAttributes, "演示模式，不允许操作！");
			return "redirect:" + adminPath + "/project/projectDeclare/list?repage";
		}
		try {
			int successNum = 0;
			int failureNum = 0;
			int chongfuNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
		    List<ProjectDeclare> list = ei.getDataList(ProjectDeclare.class);
			for (ProjectDeclare projectDeclare : list){
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
						projectDeclareService.save(projectDeclare);
						successNum++;
					}catch(Exception e){
						chongfuNum++;
						failureMsg.append("<br/>项目编码为 "+projectDeclare.getProjectCode()+" 的数据重复，已过滤,项目名称是："+projectDeclare.getProjectName());
					}
				}catch(ConstraintViolationException ex){
					failureMsg.append("<br/>项目编码为 "+projectDeclare.getProjectCode()+" 的数据导入失败,项目名称是："+projectDeclare.getProjectName());
					List<String> messageList = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
					for (String message : messageList){
						failureMsg.append(message+"; ");
						failureNum++;
					}
				}catch (Exception ex) {
					failureMsg.append("<br/>项目编码为  "+projectDeclare.getProjectCode()+" 的数据导入失败：");
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条项目信息，导入信息如下：");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条项目信息"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入项目信息失败！失败信息："+e.getMessage());
		}
		return "redirect:" + adminPath + "/project/projectDeclare/list?repage";
    }
	
	/**
	 * 装配项目类型参数,相当于字典转换
	 */
	public static void assemble(ProjectDeclare projectDeclare){
		String projectType = projectDeclare.getProjectType();
		if("0".equals(projectType)){
			projectDeclare.setProjectType("");
		}else if("1".equals(projectType)){//备案
			projectDeclare.setProjectType("备案");
		}else if("2".equals(projectType)){//审批
			projectDeclare.setProjectType("审批");
		}else if("3".equals(projectType)){//核准
			projectDeclare.setProjectType("核准");
		}
	}
}