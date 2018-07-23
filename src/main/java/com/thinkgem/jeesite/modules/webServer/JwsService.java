/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.webServer;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.xml.ws.Endpoint;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HttpService;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.io.IOUtils;

/**
* Title: ServiceHello
* Description: 基于jdk1.6以上的javax.jws 发布webservice接口
                @WebService － 它是一个注解，用在类上指定将此类发布成一个ws。
                Endpoint – 此类为端点服务类，它的方法publish用于将一个已经添加了@WebService注解
                对象绑定到一个地址的端口上。 
* Version:1.0.0  
* @author panchengming
 */
@WebService  
public class JwsService {

    /** 供客户端调用方法  该方法是非静态的，会被发布
     * @param name  传入参数
     * @return String 返回结果
     * */
	@WebMethod
    public String getValue(String name){
    	System.out.println("haha ");
        return "欢迎你！ "+name;
    }

    /**
     * 方法上加@WebMentod(exclude=true)后，此方法不被发布；
     * @param name
     * @return
     */
    @WebMethod(exclude=true)  
    public String getHello(String name){
        return "你好！ "+name;
    }

    /** 静态方法不会被发布
     * @param name
     * @return
     */
    public static String getString(String name){
        return "再见！"+name;
    }


     //通过EndPoint(端点服务)发布一个WebService
    public static void main(String[] args) throws HttpException, IOException {
     /*参数:1,本地的服务地址;
           2,提供服务的类;
      */
     Endpoint.publish("http://127.0.0.1:8080/service/test", new JwsService());
     System.out.println("发布成功!");
     //发布成功后 在浏览器输入 http://192.168.1.105:8080/Service/ServiceHello?wsdl
     
//     List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();  
//     nameValuePairs.add(new BasicNameValuePair("name", "taojie")); 
//     String url="http://127.0.0.1:8080/service/test?wsdl";
//     String result = HttpServiceUtil.post(url,nameValuePairs).toString();
//     System.out.print(result);
     
     
     String wsdl = "http://localhost:8080/service/test?wsdl";
     int timeout = 10000;
     StringBuffer sb = new StringBuffer("");
     sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
     sb.append("<soap:Envelope "
             + "xmlns:api='http://webServer.modules.jeesite.thinkgem.com/' "
             + "xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' "
             + "xmlns:xsd='http://www.w3.org/2001/XMLSchema' "
             + "xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>");
     sb.append("<soap:Body>");
     sb.append("<api:getValue>");
     sb.append("<arg0>taojie</arg0>");
     sb.append("</api:getValue>");
     sb.append("</soap:Body>");
     sb.append("</soap:Envelope>");

     
     
     // HttpClient发送SOAP请求
     System.out.println("HttpClient 发送SOAP请求");
     HttpClient client = new HttpClient();
     PostMethod postMethod = new PostMethod(wsdl);
     // 设置连接超时
     client.getHttpConnectionManager().getParams().setConnectionTimeout(timeout);
     // 设置读取时间超时
     client.getHttpConnectionManager().getParams().setSoTimeout(timeout);
     // 然后把Soap请求数据添加到PostMethod中
     RequestEntity requestEntity = new StringRequestEntity(sb.toString(), "text/xml", "UTF-8");
     //设置请求头部，否则可能会报 “no SOAPAction header” 的错误
     postMethod.setRequestHeader("SOAPAction","");
     // 设置请求体
     postMethod.setRequestEntity(requestEntity);
     int status = client.executeMethod(postMethod);
     // 打印请求状态码
     System.out.println("status:" + status);
     // 获取响应体输入流
     InputStream is = postMethod.getResponseBodyAsStream();
     // 获取请求结果字符串
     String result = IOUtils.toString(is);
     System.out.println("result: " + result);

     
     
     // HttpURLConnection 发送SOAP请求
     System.out.println("HttpURLConnection 发送SOAP请求");
     URL url = new URL(wsdl);
     HttpURLConnection conn = (HttpURLConnection) url.openConnection();

     conn.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
     conn.setRequestMethod("POST");
     conn.setUseCaches(false);
     conn.setDoInput(true);
     conn.setDoOutput(true);
     conn.setConnectTimeout(timeout);
     conn.setReadTimeout(timeout);
     
     DataOutputStream dos = new DataOutputStream(conn.getOutputStream());
     dos.write(sb.toString().getBytes("utf-8"));
     dos.flush();
     
     
     BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
     String line = null;
     StringBuffer strBuf = new StringBuffer();
     while ((line = reader.readLine()) != null) {
         strBuf.append(line);
     }
     dos.close();
     reader.close();
     
     System.out.println(strBuf.toString());

    }
}
