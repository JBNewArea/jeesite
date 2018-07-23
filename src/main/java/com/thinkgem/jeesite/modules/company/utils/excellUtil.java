//package com.thinkgem.jeesite.modules.company.utils;
//
//import java.io.InputStream;
//import java.lang.reflect.Field;
//import java.lang.reflect.Method;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.Comparator;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//
//import org.apache.commons.lang3.StringUtils;
//import org.apache.poi.hssf.usermodel.HSSFWorkbook;
//import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.DateUtil;
//import org.apache.poi.ss.usermodel.Row;
//import org.apache.poi.ss.usermodel.Sheet;
//import org.apache.poi.ss.usermodel.Workbook;
//import org.apache.poi.ss.util.CellRangeAddress;
//import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//
//import com.google.common.collect.Lists;
//import com.thinkgem.jeesite.common.utils.Reflections;
//import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;
//import com.thinkgem.jeesite.modules.project.entity.ProjectDeclare;
//import com.thinkgem.jeesite.modules.project.entity.ProjectHandle;
//import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
//
//public class excellUtil {
//	public HashMap<String,Object> importProject(Long userId,InputStream inputStream,String fileName)    throws Exception
////            , BusinessException
//	{  
//		HashMap<String,Object> returnMap = new HashMap<String,Object>();
//        String message = "Import success";  
//        returnMap.put("message",  message);
//        boolean isE2007 = false;    //判断是否是excel2007格式    
//        if(fileName.endsWith("xlsx")){  
//            isE2007 = true;  
//        }  
//          
//        int rowIndex = 0;  
//        int columnIndex = 0;  
//        try {  
//            InputStream input = inputStream;  //建立输入流    
//            Workbook wb  = null;    
//            //根据文件格式(2003或者2007)来初始化    
//            if(isE2007){   
//                wb = new XSSFWorkbook(input);  
//            }else{    
//                wb = new HSSFWorkbook(input);  
//            }  
//            Sheet sheet = wb.getSheetAt(0);    //获得第一个表单    
//              
//            //System.out.println("总行数:"+sheet.getLastRowNum());  
//              
//            List<CellRangeAddress> cras = getCombineCell(sheet);  
//            //isMergedRegion(Sheet sheet,int row ,int column);判断是不是合并单元格\  
//            int count = sheet.getLastRowNum()+1;//总行数  
//            
//            List<ProjectDeclare> irs = new ArrayList<ProjectDeclare>();  
//            for(int i = 1; i < count;i++){  
//                rowIndex = i;  
//                Row row = sheet.getRow(i);  
//                ProjectDeclare ir = new ProjectDeclare();  
//                  
////                ir.setReportName(getCellValue(row.getCell(0)));  
////                ir.setShift(Double.valueOf(getCellValue(row.getCell(1))).intValue());  
////                ir.setLine(getCellValue(row.getCell(2)));  
////                ir.setStationCode(getCellValue(row.getCell(3)));  
////                ir.setArea(Double.valueOf(getCellValue(row.getCell(4))).intValue());  
////                ir.setReportStatus(Double.valueOf(getCellValue(row.getCell(5))).intValue());  
//                
//                  
//                List<ProjectHandle> items = new ArrayList<ProjectHandle>();  
//                if(isMergedRegion(sheet,i,0)){  
//                    int lastRow = getRowNum(cras,sheet.getRow(i).getCell(0),sheet);  
//                      
//                    for(;i<=lastRow;i++){  
//                        row = sheet.getRow(i);  
//                        ProjectHandle item = new ProjectHandle();  
////                        item.setItem(getCellValue(row.getCell(6)));  
////                        item.setMethod(getCellValue(row.getCell(7)));  
////                        item.setMode(getCellValue(row.getCell(8)));  
////                        item.setStandardValue(getCellValue(row.getCell(9)));  
////                        item.setDeviationValue(getCellValue(row.getCell(10)));  
////                        String pinci = getCellValue(row.getCell(11));  
////                        Double d = Double.valueOf(pinci);  
////                        item.setFrequency(d.intValue());  
//                        items.add(item);  
//                    }  
//                    i--;  
//                }else{  
//                    row = sheet.getRow(i);  
//                    ProjectHandle item = new ProjectHandle();  
////                    item.setItem(getCellValue(row.getCell(6)));  
////                    item.setMethod(getCellValue(row.getCell(7)));  
////                    item.setMode(getCellValue(row.getCell(8)));  
////                    item.setStandardValue(getCellValue(row.getCell(9)));  
////                    item.setDeviationValue(getCellValue(row.getCell(10)));  
////                    String pinci = getCellValue(row.getCell(11));  
////                    Double d = Double.valueOf(pinci);  
////                    item.setFrequency(d.intValue());  
//                    items.add(item);  
//                }  
//                ir.setProjectHandleList(items);  
//                irs.add(ir);  
//                  
//            }  
//            returnMap.put("entity", irs);
//            return returnMap;
//              
//           /*JSONArray js= new JSONArray(); 
//           js.addAll(irs); 
//           System.out.println(js.toJSONString());*/  
//  
//        } catch (Exception ex) {    
//            //xr.setMessage("Import failed, please check the data in "+rowIndex+" rows "+columnIndex+" columns ");  
//            message =  "Import failed, please check the data in "+rowIndex+" rows "; 
//            returnMap.put("message",  message);
//            returnMap.put("entity", null);
//        }  
//        return returnMap;  
//    } 
//	
//	/*
//	*//**
//	 * 获取导入数据列表
//	 * @param cls 导入对象类型
//	 * @param groups 导入分组
//	 *//*
//	public <E> List<E> getDataList(Class<E> cls, int... groups) throws InstantiationException, IllegalAccessException{
//		List<Object[]> annotationList = Lists.newArrayList();
//		// Get annotation field 
//		Field[] fs = cls.getDeclaredFields();
//		for (Field f : fs){
//			ExcelField ef = f.getAnnotation(ExcelField.class);
//			if (ef != null && (ef.type()==0 || ef.type()==2)){
//				if (groups!=null && groups.length>0){
//					boolean inGroup = false;
//					for (int g : groups){
//						if (inGroup){
//							break;
//						}
//						for (int efg : ef.groups()){
//							if (g == efg){
//								inGroup = true;
//								annotationList.add(new Object[]{ef, f});
//								break;
//							}
//						}
//					}
//				}else{
//					annotationList.add(new Object[]{ef, f});
//				}
//			}
//		}
//		// Get annotation method
//		Method[] ms = cls.getDeclaredMethods();
//		for (Method m : ms){
//			ExcelField ef = m.getAnnotation(ExcelField.class);
//			if (ef != null && (ef.type()==0 || ef.type()==2)){
//				if (groups!=null && groups.length>0){
//					boolean inGroup = false;
//					for (int g : groups){
//						if (inGroup){
//							break;
//						}
//						for (int efg : ef.groups()){
//							if (g == efg){
//								inGroup = true;
//								annotationList.add(new Object[]{ef, m});
//								break;
//							}
//						}
//					}
//				}else{
//					annotationList.add(new Object[]{ef, m});
//				}
//			}
//		}
//		// Field sorting
//		Collections.sort(annotationList, new Comparator<Object[]>() {
//			public int compare(Object[] o1, Object[] o2) {
//				return new Integer(((ExcelField)o1[0]).sort()).compareTo(
//						new Integer(((ExcelField)o2[0]).sort()));
//			};
//		});
//		//log.debug("Import column count:"+annotationList.size());
//		// Get excel data
//		List<E> dataList = Lists.newArrayList();
//		for (int i = this.getDataRowNum(); i < this.getLastDataRowNum(); i++) {
//			E e = (E)cls.newInstance();
//			int column = 0;
//			Row row = this.getRow(i);
//			StringBuilder sb = new StringBuilder();
//			for (Object[] os : annotationList){
//				Object val = this.getCellValue(row, column++);
//				if (val != null){
//					ExcelField ef = (ExcelField)os[0];
//					// If is dict type, get dict value
//					if (StringUtils.isNotBlank(ef.dictType())){
//						val = DictUtils.getDictValue(val.toString(), ef.dictType(), "");
//						//log.debug("Dictionary type value: ["+i+","+colunm+"] " + val);
//					}
//					// Get param type and type cast
//					Class<?> valType = Class.class;
//					if (os[1] instanceof Field){
//						valType = ((Field)os[1]).getType();
//					}else if (os[1] instanceof Method){
//						Method method = ((Method)os[1]);
//						if ("get".equals(method.getName().substring(0, 3))){
//							valType = method.getReturnType();
//						}else if("set".equals(method.getName().substring(0, 3))){
//							valType = ((Method)os[1]).getParameterTypes()[0];
//						}
//					}
//					//log.debug("Import value type: ["+i+","+column+"] " + valType);
//					try {
//						if (valType == String.class){
//							String s = String.valueOf(val.toString());
//							if(StringUtils.endsWith(s, ".0")){
//								val = StringUtils.substringBefore(s, ".0");
//							}else{
//								val = String.valueOf(val.toString());
//							}
//						}else if (valType == Integer.class){
//							val = Double.valueOf(val.toString()).intValue();
//						}else if (valType == Long.class){
//							val = Double.valueOf(val.toString()).longValue();
//						}else if (valType == Double.class){
//							val = Double.valueOf(val.toString());
//						}else if (valType == Float.class){
//							val = Float.valueOf(val.toString());
//						}else if (valType == Date.class){
//							val = DateUtil.getJavaDate((Double)val);
//						}else{
//							if (ef.fieldType() != Class.class){
//								val = ef.fieldType().getMethod("getValue", String.class).invoke(null, val.toString());
//							}else{
//								val = Class.forName(this.getClass().getName().replaceAll(this.getClass().getSimpleName(), 
//										"fieldtype."+valType.getSimpleName()+"Type")).getMethod("getValue", String.class).invoke(null, val.toString());
//							}
//						}
//					} catch (Exception ex) {
//						log.info("Get cell value ["+i+","+column+"] error: " + ex.toString());
//						val = null;
//					}
//					// set entity value
//					if (os[1] instanceof Field){
//						Reflections.invokeSetter(e, ((Field)os[1]).getName(), val);
//					}else if (os[1] instanceof Method){
//						String mthodName = ((Method)os[1]).getName();
//						if ("get".equals(mthodName.substring(0, 3))){
//							mthodName = "set"+StringUtils.substringAfter(mthodName, "get");
//						}
//						Reflections.invokeMethod(e, mthodName, new Class[] {valType}, new Object[] {val});
//					}
//				}
//				sb.append(val+", ");
//			}
//			dataList.add(e);
//			log.debug("Read success: ["+i+"] "+sb.toString());
//		}
//		return dataList;
//	}*/
//	
//	
//	
//	/**    
//	    * 获取单元格的值    
//	    * @param cell    
//	    * @return    
//	    */      
//	    public String getCellValue(Cell cell){      
//	        if(cell == null) return "";      
//	        if(cell.getCellType() == Cell.CELL_TYPE_STRING){      
//	            return cell.getStringCellValue();      
//	        }else if(cell.getCellType() == Cell.CELL_TYPE_BOOLEAN){      
//	            return String.valueOf(cell.getBooleanCellValue());      
//	        }else if(cell.getCellType() == Cell.CELL_TYPE_FORMULA){      
//	            return cell.getCellFormula() ;      
//	        }else if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){      
//	            return String.valueOf(cell.getNumericCellValue());      
//	        }  
//	        return "";      
//	    }
//	    /**  
//	    * 合并单元格处理,获取合并行  
//	    * @param sheet  
//	    * @return List<CellRangeAddress>  
//	    */    
//	    public static List<CellRangeAddress> getCombineCell(Sheet sheet)    
//	    {    
//	        List<CellRangeAddress> list = new ArrayList<CellRangeAddress>();    
//	        //获得一个 sheet 中合并单元格的数量    
//	        int sheetmergerCount = sheet.getNumMergedRegions();    
//	        //遍历所有的合并单元格    
//	        for(int i = 0; i<sheetmergerCount;i++)     
//	        {    
//	            //获得合并单元格保存进list中    
//	            CellRangeAddress ca = sheet.getMergedRegion(i);    
//	            list.add(ca);    
//	        }    
//	        return list;    
//	    }  
//	      
//	    private int getRowNum(List<CellRangeAddress> listCombineCell,Cell cell,Sheet sheet){  
//	        int xr = 0;  
//	        int firstC = 0;    
//	        int lastC = 0;    
//	        int firstR = 0;    
//	        int lastR = 0;    
//	        for(CellRangeAddress ca:listCombineCell)    
//	        {  
//	            //获得合并单元格的起始行, 结束行, 起始列, 结束列    
//	            firstC = ca.getFirstColumn();    
//	            lastC = ca.getLastColumn();    
//	            firstR = ca.getFirstRow();    
//	            lastR = ca.getLastRow();    
//	            if(cell.getRowIndex() >= firstR && cell.getRowIndex() <= lastR)     
//	            {    
//	                if(cell.getColumnIndex() >= firstC && cell.getColumnIndex() <= lastC)     
//	                {    
//	                    xr = lastR;  
//	                }   
//	            }    
//	              
//	        }  
//	        return xr;  
//	          
//	    }  
//	    /**  
//	     * 判断单元格是否为合并单元格，是的话则将单元格的值返回  
//	     * @param listCombineCell 存放合并单元格的list  
//	     * @param cell 需要判断的单元格  
//	     * @param sheet sheet  
//	     * @return  
//	     */   
//	     public String isCombineCell(List<CellRangeAddress> listCombineCell,Cell cell,Sheet sheet)  
//	     throws Exception{   
//	         int firstC = 0;    
//	         int lastC = 0;    
//	         int firstR = 0;    
//	         int lastR = 0;    
//	         String cellValue = null;    
//	         for(CellRangeAddress ca:listCombineCell)    
//	         {  
//	             //获得合并单元格的起始行, 结束行, 起始列, 结束列    
//	             firstC = ca.getFirstColumn();    
//	             lastC = ca.getLastColumn();    
//	             firstR = ca.getFirstRow();    
//	             lastR = ca.getLastRow();    
//	             if(cell.getRowIndex() >= firstR && cell.getRowIndex() <= lastR)     
//	             {    
//	                 if(cell.getColumnIndex() >= firstC && cell.getColumnIndex() <= lastC)     
//	                 {    
//	                     Row fRow = sheet.getRow(firstR);    
//	                     Cell fCell = fRow.getCell(firstC);    
//	                     cellValue = getCellValue(fCell);    
//	                     break;    
//	                 }   
//	             }    
//	             else    
//	             {    
//	                 cellValue = "";    
//	             }    
//	         }    
//	         return cellValue;    
//	     }  
//	      
//	    /**    
//	    * 获取合并单元格的值    
//	    * @param sheet    
//	    * @param row    
//	    * @param column    
//	    * @return    
//	    */      
//	    public String getMergedRegionValue(Sheet sheet ,int row , int column){      
//	        int sheetMergeCount = sheet.getNumMergedRegions();      
//	              
//	        for(int i = 0 ; i < sheetMergeCount ; i++){      
//	            CellRangeAddress ca = sheet.getMergedRegion(i);      
//	            int firstColumn = ca.getFirstColumn();      
//	            int lastColumn = ca.getLastColumn();      
//	            int firstRow = ca.getFirstRow();      
//	            int lastRow = ca.getLastRow();      
//	                  
//	            if(row >= firstRow && row <= lastRow){      
//	                if(column >= firstColumn && column <= lastColumn){      
//	                    Row fRow = sheet.getRow(firstRow);      
//	                    Cell fCell = fRow.getCell(firstColumn);      
//	                    return getCellValue(fCell) ;      
//	                }      
//	            }      
//	        }      
//	              
//	        return null ;      
//	    }  
//	      
//	      
//	    /**   
//	    * 判断指定的单元格是否是合并单元格   
//	    * @param sheet    
//	    * @param row 行下标   
//	    * @param column 列下标   
//	    * @return   
//	    */    
//	    private boolean isMergedRegion(Sheet sheet,int row ,int column) {    
//	      int sheetMergeCount = sheet.getNumMergedRegions();    
//	      for (int i = 0; i < sheetMergeCount; i++) {    
//	        CellRangeAddress range = sheet.getMergedRegion(i);    
//	        int firstColumn = range.getFirstColumn();    
//	        int lastColumn = range.getLastColumn();    
//	        int firstRow = range.getFirstRow();    
//	        int lastRow = range.getLastRow();    
//	        if(row >= firstRow && row <= lastRow){    
//	            if(column >= firstColumn && column <= lastColumn){    
//	                return true;    
//	            }    
//	        }  
//	      }    
//	      return false;    
//	    }
//}
