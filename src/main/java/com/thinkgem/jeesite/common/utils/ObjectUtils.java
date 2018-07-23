/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.common.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;

import org.apache.commons.lang3.StringUtils;
import org.omg.CORBA.portable.ApplicationException;

/**
 * 对象操作工具类, 继承org.apache.commons.lang3.ObjectUtils类
 * @author ThinkGem
 * @version 2014-6-29
 */
public class ObjectUtils extends org.apache.commons.lang3.ObjectUtils {

	/**
	 * 注解到对象复制，只复制能匹配上的方法。
	 * @param annotation
	 * @param object
	 */
	public static void annotationToObject(Object annotation, Object object){
		if (annotation != null){
			Class<?> annotationClass = annotation.getClass();
			Class<?> objectClass = object.getClass();
			for (Method m : objectClass.getMethods()){
				if (StringUtils.startsWith(m.getName(), "set")){
					try {
						String s = StringUtils.uncapitalize(StringUtils.substring(m.getName(), 3));
						Object obj = annotationClass.getMethod(s).invoke(annotation);
						if (obj != null && !"".equals(obj.toString())){
							if (object == null){
								object = objectClass.newInstance();
							}
							m.invoke(object, obj);
						}
					} catch (Exception e) {
						// 忽略所有设置失败方法
					}
				}
			}
		}
	}
	
	/**
	 * 序列化对象
	 * @param object
	 * @return
	 */
	public static byte[] serialize(Object object) {
		ObjectOutputStream oos = null;
		ByteArrayOutputStream baos = null;
		try {
			if (object != null){
				baos = new ByteArrayOutputStream();
				oos = new ObjectOutputStream(baos);
				oos.writeObject(object);
				return baos.toByteArray();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 反序列化对象
	 * @param bytes
	 * @return
	 */
	public static Object unserialize(byte[] bytes) {
		ByteArrayInputStream bais = null;
		try {
			if (bytes != null && bytes.length > 0){
				bais = new ByteArrayInputStream(bytes);
				ObjectInputStream ois = new ObjectInputStream(bais);
				return ois.readObject();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/** 
	* 把 VO 中所有属性为 null 的转为 "" 
	* 
	* @throws ApplicationException 
	*/ 
	public static void nullConverNullString(Object obj) throws ApplicationException { 
	if (obj != null) { 

	Class classz = obj.getClass(); 
	// 获取所有该对象的属性值 
	Field fields[] = classz.getDeclaredFields(); 

	// 遍历属性值，取得所有属性为 null 值的 
	for (Field field : fields) { 
	try { 
	Type t = field.getGenericType(); 
	if (!t.toString().equals("boolean")) { 
	Method m = classz.getMethod("get" 
	+ change(field.getName())); 
	Object name = m.invoke(obj);// 调用该字段的get方法 
	if ("0".equals(name)) { 

	Method mtd = classz.getMethod("set" 
	+ change(field.getName()), 
	new Class[] { String.class });// 取得所需类的方法对象 
	mtd.invoke(obj, new Object[] {null});// 执行相应赋值方法 
	} 
	} 

	} catch (Exception e) { 
	e.printStackTrace(); 
	/*throw new ApplicationException( 
	"PAYMENTS", 
	"nullConverNullString error: null conver null String error .", 
	e);*/ 
	} 
	} 
	} 
	} 

	/** 
	* @param src 
	*            源字符串 
	* @return 字符串，将src的第一个字母转换为大写，src为空时返回null 
	*/ 
	public static String change(String src) { 
	if (src != null) { 
	StringBuffer sb = new StringBuffer(src); 
	sb.setCharAt(0, Character.toUpperCase(sb.charAt(0))); 
	return sb.toString(); 
	} else { 
	return null; 
	} 
	}
	/**
	 * 
	 */
	public static Object AllowNull(String s){
		if(s=="0"){
			return null;
		}else{
			return s;
		}
	}
}
