package com.thinkgem.jeesite.modules.company.entity;

import java.io.Serializable;
import java.util.HashMap;

public class personCount implements Serializable{
	private static final long serialVersionUID = 1L;
	private String low;//0-50
	private String middle;//50-100
	private String bigmiddle;//100-500
	private String big;//500以上
	private echartsData low_kv;
	private echartsData middle_kv;
	private echartsData bigmiddle_kv;
	private echartsData big_kv;
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getMiddle() {
		return middle;
	}
	public void setMiddle(String middle) {
		this.middle = middle;
	}
	public String getBigmiddle() {
		return bigmiddle;
	}
	public void setBigmiddle(String bigmiddle) {
		this.bigmiddle = bigmiddle;
	}
	public String getBig() {
		return big;
	}
	public void setBig(String big) {
		this.big = big;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public echartsData getLow_kv() {
		return low_kv;
	}
	public void setLow_kv(echartsData low_kv) {
		low_kv.setName("50人以下");
		this.low_kv = low_kv;
	}
	public echartsData getMiddle_kv() {
		return middle_kv;
	}
	public void setMiddle_kv(echartsData middle_kv) {
		middle_kv.setName("50-100人");
		this.middle_kv = middle_kv;
	}
	public echartsData getBigmiddle_kv() {
		return bigmiddle_kv;
	}
	public void setBigmiddle_kv(echartsData bigmiddle_kv) {
		bigmiddle_kv.setName("100-500人");
		this.bigmiddle_kv = bigmiddle_kv;
	}
	public echartsData getBig_kv() {
		return big_kv;
	}
	public void setBig_kv(echartsData big_kv) {
		big_kv.setName("500人以上");
		this.big_kv = big_kv;
	}
	

}
