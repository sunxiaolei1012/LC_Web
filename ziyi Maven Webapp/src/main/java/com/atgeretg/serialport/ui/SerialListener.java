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
	 * 澶勭悊鐩戞帶鍒扮殑涓插彛浜嬩欢
	 */
	@SuppressWarnings("restriction")
	public void serialEvent(SerialPortEvent serialPortEvent) {

		switch (serialPortEvent.getEventType()) {

		case SerialPortEvent.BI: // 10 閫氳涓柇
			DialogShowUtils.errorMessage("涓庝覆鍙ｈ澶囬�氳涓柇");
			break;

		case SerialPortEvent.OE: // 7 婧綅锛堟孩鍑猴級閿欒

		case SerialPortEvent.FE: // 9 甯ч敊璇�

		case SerialPortEvent.PE: // 8 濂囧伓鏍￠獙閿欒

		case SerialPortEvent.CD: // 6 杞芥尝妫�娴�

		case SerialPortEvent.CTS: // 3 娓呴櫎寰呭彂閫佹暟鎹�

		case SerialPortEvent.DSR: // 4 寰呭彂閫佹暟鎹噯澶囧ソ浜�

		case SerialPortEvent.RI: // 5 鎸搩鎸囩ず

		case SerialPortEvent.OUTPUT_BUFFER_EMPTY: // 2 杈撳嚭缂撳啿鍖哄凡娓呯┖
			break;

		case SerialPortEvent.DATA_AVAILABLE: // 1 涓插彛瀛樺湪鍙敤鏁版嵁
			byte[] data = null;
			try {
				if (serialport == null) {
					DialogShowUtils.errorMessage("涓插彛瀵硅薄涓虹┖锛佺洃鍚け璐ワ紒");
				} else {
					data = SerialPortManager.readFromPort(serialport);
//					System.out.println(MyUtils.byteArray2HexString(data, data.length, true));
					if(data.length > 24)
					{
//						config.TIME = new Date();
						for (int i = 0; i < data.length; i++) {
							config.READ_CARD.add(data[i]);
						}
						config.BOOL=true;
						
					}
//					if(data.length == 62 || data.length == 25)
//					{
//						Read_Card rc = new Read_Card();
//						rc.setDate(new Date());
//						rc.setRead(data);
//						
//						if(data[0]==85 && data[1] == 0 && data[2] == 0 )
//						{
//							config.READ_CARD_MAP.put(1, rc);
//						}
//						else if(data.length == 25)
//						{
//							config.READ_CARD_MAP.put(3, rc);
//						}
//						else
//						{
//							config.READ_CARD_MAP.put(2, rc);
//						}
//						
//					}
				}
			} catch (Exception e) {
				DialogShowUtils.errorMessage(e.toString());
			}
			break;
		}
	}
}