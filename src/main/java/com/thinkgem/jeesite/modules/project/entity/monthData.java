package com.thinkgem.jeesite.modules.project.entity;

import java.io.Serializable;
import java.util.ArrayList;

public class monthData implements Serializable{
	private static final long serialVersionUID = 1L;
	private String january;
	private String february;
	private String march;
	private String april;
	private String may;
	private String june;
	private String july;
	private String august;
	private String september;
	private String october;
	private String november;
	private String december;
	public String getJanuary() {
		return january;
	}
	public void setJanuary(String january) {
		this.january = january;
	}
	public String getFebruary() {
		return february;
	}
	public void setFebruary(String february) {
		this.february = february;
	}
	public String getMarch() {
		return march;
	}
	public void setMarch(String march) {
		this.march = march;
	}
	public String getApril() {
		return april;
	}
	public void setApril(String april) {
		this.april = april;
	}
	public String getMay() {
		return may;
	}
	public void setMay(String may) {
		this.may = may;
	}
	public String getJune() {
		return june;
	}
	public void setJune(String june) {
		this.june = june;
	}
	public String getJuly() {
		return july;
	}
	public void setJuly(String july) {
		this.july = july;
	}
	public String getAugust() {
		return august;
	}
	public void setAugust(String august) {
		this.august = august;
	}
	public String getSeptember() {
		return september;
	}
	public void setSeptember(String september) {
		this.september = september;
	}
	public String getOctober() {
		return october;
	}
	public void setOctober(String october) {
		this.october = october;
	}
	public String getNovember() {
		return november;
	}
	public void setNovember(String november) {
		this.november = november;
	}
	public String getDecember() {
		return december;
	}
	public void setDecember(String december) {
		this.december = december;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ArrayList<String> changetoList(){
		ArrayList<String> list = new ArrayList<String>();
		list.add(january);
		list.add(february);
		list.add(march);
		list.add(april);
		list.add(may);
		list.add(june);
		list.add(july);
		list.add(august);
		list.add(september);
		list.add(october);
		list.add(november);
		list.add(december);
		return list;
	}
	
	

}
