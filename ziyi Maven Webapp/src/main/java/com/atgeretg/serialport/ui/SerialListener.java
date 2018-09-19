package com.atgeretg.serialport.ui;

import java.util.Date;

import com.atgeretg.serialport.manage.SerialPortManager;
import com.atgeretg.serialport.utils.DialogShowUtils;
import com.atgeretg.serialport.utils.MyUtils;
import com.cyb.util.config;

import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;

public class SerialListener implements SerialPortEventListener {
	
	private SerialPort serialport;
	
	public SerialListener(SerialPort serialport)
	{
		this.serialport = serialport;
	}
	
	/**
	 * 处理监控到的串口事件
	 */
	public void serialEvent(SerialPortEvent serialPortEvent) {

		switch (serialPortEvent.getEventType()) {

		case SerialPortEvent.BI: // 10 通讯中断
			DialogShowUtils.errorMessage("与串口设备通讯中断");
			break;

		case SerialPortEvent.OE: // 7 溢位（溢出）错误

		case SerialPortEvent.FE: // 9 帧错误

		case SerialPortEvent.PE: // 8 奇偶校验错误

		case SerialPortEvent.CD: // 6 载波检测

		case SerialPortEvent.CTS: // 3 清除待发送数据

		case SerialPortEvent.DSR: // 4 待发送数据准备好了

		case SerialPortEvent.RI: // 5 振铃指示

		case SerialPortEvent.OUTPUT_BUFFER_EMPTY: // 2 输出缓冲区已清空
			break;

		case SerialPortEvent.DATA_AVAILABLE: // 1 串口存在可用数据
			byte[] data = null;
			try {
				if (serialport == null) {
					DialogShowUtils.errorMessage("串口对象为空！监听失败！");
				} else {
					data = SerialPortManager.readFromPort(serialport);
					System.out.println(MyUtils.byteArray2HexString(data, data.length, true));
					if(data.length == 62 || data.length == 25)
					{
						Read_Card rc = new Read_Card();
						rc.setDate(new Date());
						rc.setRead(data);
						if(data[0]==85 && data[1] == 0 && data[2] == 0 && data[3] == -112)
							config.READ_CARD_MAP.put(1, rc);
						else if(data.length == 25)
							config.READ_CARD_MAP.put(3, rc);
						else
							config.READ_CARD_MAP.put(2, rc);
						
					}
				}
			} catch (Exception e) {
				DialogShowUtils.errorMessage(e.toString());
				// 发生读取错误时显示错误信息后退出系统
//				System.exit(0);
			}
			break;
		}
	}
}