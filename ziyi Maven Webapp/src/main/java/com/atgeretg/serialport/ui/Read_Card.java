package com.atgeretg.serialport.ui;

import java.util.Date;

/**
 * 读卡类
 * @author 陈玉博
 * @date 2018年9月18日上午9:04:07
 */
public class Read_Card {

	private Date date;
	private byte[] read;
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public byte[] getRead() {
		return read;
	}
	public void setRead(byte[] read) {
		this.read = read;
	}
	
	
	
	
}
