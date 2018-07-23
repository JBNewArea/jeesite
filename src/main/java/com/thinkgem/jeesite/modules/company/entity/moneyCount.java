package com.thinkgem.jeesite.modules.company.entity;

import java.io.Serializable;

public class moneyCount implements Serializable{
	private static final long serialVersionUID = 1L;
	private String low;//100万
	private String middle;//100-500
	private String bigmiddle;//500-1000
	private String big;//10000
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
	

}
