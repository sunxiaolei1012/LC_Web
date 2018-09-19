package com.port.main;

import com.atgeretg.serialport.exception.NoSuchPort;
import com.atgeretg.serialport.exception.NotASerialPort;
import com.atgeretg.serialport.exception.PortInUse;
import com.atgeretg.serialport.exception.SendDataToSerialPortFailure;
import com.atgeretg.serialport.exception.SerialPortOutputStreamCloseFailure;
import com.atgeretg.serialport.exception.SerialPortParameterFailure;
import com.atgeretg.serialport.exception.TooManyListeners;
import com.atgeretg.serialport.manage.SerialPortManager;
import com.atgeretg.serialport.ui.SerialListener;
import com.atgeretg.serialport.utils.DialogShowUtils;

import gnu.io.SerialPort;

public class Main {

	public static SerialPort serialport = null;
	public static void chen()
	{
		sendData("1");
		try {
			Thread.sleep(300);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		sendData("3");
		try {
			Thread.sleep(300);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
	public static void openSerialPort(String com) {
		// 获取波特率
		int baudrate = 9600;
			try {
				serialport = SerialPortManager.openPort(com, baudrate);
				if (serialport != null) {
				}
			} catch (SerialPortParameterFailure e) {
				e.printStackTrace();
			} catch (NotASerialPort e) {
				e.printStackTrace();
			} catch (NoSuchPort e) {
				e.printStackTrace();
			} catch (PortInUse e) {
				e.printStackTrace();
				DialogShowUtils.warningMessage("串口已被占用！");
			}
		try {
			SerialPortManager.addListener(serialport, new SerialListener(serialport));
		} catch (TooManyListeners e) {
			e.printStackTrace();
		}
	}
	/**
	 * 发送指定数据
	 * 
	 */
	public static void sendData(String data) {
		byte[] by = null;
		if(data.equals("1"))//认证连接
			 by = new byte[]{(byte) 0xAA,(byte) 0xB9,0x00,0x05,(byte) 0x80,0x00,0x00,0x00,0x00,(byte) 0x96};
		else if(data.equals("2"))//读出密码
			 by = new byte[]{(byte) 0xAA,(byte) 0xB7,0x00,0x07,(byte) 0x80,0x00,0x00,0x01,(byte) 0x82,0x00,0x03,0x1A};
		else if(data.equals("3"))//密码比较
			 by = new byte[]{(byte) 0xAA,(byte) 0xB5,0x00,0x08,(byte) 0x80,0x00,0x00,0x01,(byte) 0x82,0x11,0x11,0x11,0x05};
		else if(data.equals("4"))//更改密码
			 by = new byte[]{(byte) 0xAA,(byte) 0xB6,0x00,0x08,(byte) 0x80,0x00,0x00,0x01,(byte) 0x82,0x11,0x11,0x11,0x06};
		else if(data.equals("5"))//蜂鸣
			 by = new byte[]{(byte) 0xAA,(byte) 0xB4,0x00,0x07,(byte) 0x80,0x00,0x00,0x00,0x00,0x00,0x14,(byte) 0x8D};
		else if(data.equals("6"))//读出备注
			 by = new byte[]{(byte) 0xAA,(byte) 0xB7,0x00,0x07,(byte) 0x80,0x00,0x00,0x00,0x00,0x00,(byte) 0x90,0x0A};
		else if(data.equals("9"))//读卡
			 by = new byte[]{(byte) 0xAA,0x61,0x00,0x07,0x79,0x00,0x00,0x00,0x00,0x00,(byte) 0x90,0x25};
		else if(data.equals("10"))//核对密码
			 by = new byte[]{(byte) 0xAA,0x64,0x00,0x08,0x79,0x00,0x00,0x00,0x00,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,0x40 };
		else if(data.equals("11"))//校验
			 by = new byte[]{(byte) 0xAA, 0x61 ,0x00 ,0x07, 0x79, 0x00, 0x00,0x00, (byte) 0x90,0x00 ,0x70, 0x55};
		else if(data.equals("12"))//读密码
			 by = new byte[]{(byte) 0xAA,(byte) 0x65,(byte) 0x00,(byte) 0x07,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x04,(byte) 0xB5};
		else if(data.equals("13"))//读计数器
			 by = new byte[]{(byte) 0xAA,(byte) 0x67,(byte) 0x00,(byte) 0x07,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x04,(byte) 0xB7};
		else if(data.equals("14"))//全写
			 by = new byte[]{(byte) 0xAA,(byte) 0x60,(byte) 0x00,(byte) 0x95,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x20,(byte) 0x65,(byte) 0x77,(byte) 0x33,(byte) 0x44,(byte) 0x55,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xE8};
		else if(data.equals("15"))//部分写入
			 by = new byte[]{(byte) 0xAA,(byte) 0x60,(byte) 0x00,(byte) 0x09,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x78,(byte) 0x11,(byte) 0x22,(byte) 0x33,(byte) 0x44,(byte) 0x86};
		
		if(by == null)
			by = new byte[]{55,00,00,01,01,55};
		try {
			
			SerialPortManager.sendToPort(serialport, by);
//			SerialPortManager.sendToPort(serialport, MyUtils.HexString2Bytes(data));
		} catch (SendDataToSerialPortFailure e) {
			e.printStackTrace();
		} catch (SerialPortOutputStreamCloseFailure e) {
			e.printStackTrace();
		} 
	}
	
}
