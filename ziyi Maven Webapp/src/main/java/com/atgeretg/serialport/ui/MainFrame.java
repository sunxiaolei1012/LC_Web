/*
 * MainFrame.java
 *
 * Created on 2016.8.19
 */

package com.atgeretg.serialport.ui;

import java.awt.Color;
import java.awt.GraphicsEnvironment;
import java.awt.Point;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.Style;
import javax.swing.text.StyleConstants;

import com.atgeretg.serialport.exception.NoSuchPort;
import com.atgeretg.serialport.exception.NotASerialPort;
import com.atgeretg.serialport.exception.PortInUse;
import com.atgeretg.serialport.exception.SendDataToSerialPortFailure;
import com.atgeretg.serialport.exception.SerialPortOutputStreamCloseFailure;
import com.atgeretg.serialport.exception.SerialPortParameterFailure;
import com.atgeretg.serialport.exception.TooManyListeners;
import com.atgeretg.serialport.manage.SerialPortManager;
import com.atgeretg.serialport.utils.DialogShowUtils;
import com.atgeretg.serialport.utils.MyUtils;

import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;

/**
 * 主界面
 * 
 * @author atgeretg
 */
public class MainFrame extends JFrame implements ActionListener {

	/**
	 * 程序界面宽度
	 */
	public static final int WIDTH = 500;

	/**
	 * 程序界面高度
	 */
	public static final int HEIGHT = 360;

	private JTextPane dataView = new JTextPane();
	private JScrollPane scrollDataView = new JScrollPane(dataView);

	// 串口设置面板
	private JPanel serialPortPanel = new JPanel();
	private JLabel serialPortLabel = new JLabel("串口");
	private JLabel baudrateLabel = new JLabel("波特率");
	private JComboBox commChoice = new JComboBox();
	private JComboBox baudrateChoice = new JComboBox();

	// 操作面板
	private JPanel operatePanel = new JPanel();
	private JTextArea dataInput = new JTextArea();
	private JButton serialPortOpenBtn = new JButton("打开串口");
	private JButton sendDataBtn = new JButton("发送数据");
	private JButton openCmdButton = new JButton("打开射频");
	private JButton closeCmdButton = new JButton("关闭射频");

	/**
	 * 正常的风格
	 */
	private final String STYLE_NORMAL = "normal";
	/**
	 * 字体为红色
	 */
	private final String STYLE_RED = "red";

	private List<String> commList = null;
	private SerialPort serialport;

	public MainFrame() {
		initView();
		initComponents();
		initData();
	}

	private void initView() {
		// 关闭程序
		setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
		// 禁止窗口最大化
		setResizable(false);

		// 设置程序窗口居中显示
		Point p = GraphicsEnvironment.getLocalGraphicsEnvironment().getCenterPoint();
		setBounds(p.x - WIDTH / 2, p.y - HEIGHT / 2, 499, 455);
		getContentPane().setLayout(null);

		setTitle("串口通讯");
	}

	private void initComponents() {
		// 数据显示
		dataView.setFocusable(false);
		scrollDataView.setBounds(10, 10, 475, 200);
		/* 数据区域的风格 */
		Style def = dataView.getStyledDocument().addStyle(null, null);
		StyleConstants.setFontFamily(def, "verdana");
		StyleConstants.setFontSize(def, 12);
		Style normal = dataView.addStyle(STYLE_NORMAL, def);
		Style s = dataView.addStyle(STYLE_RED, normal);
		StyleConstants.setForeground(s, Color.RED);
		dataView.setParagraphAttributes(normal, true);

		getContentPane().add(scrollDataView);

		// 串口设置
		serialPortPanel.setBorder(BorderFactory.createTitledBorder("串口设置"));
		serialPortPanel.setBounds(10, 220, 170, 188);
		serialPortPanel.setLayout(null);
		getContentPane().add(serialPortPanel);

		serialPortLabel.setForeground(Color.gray);
		serialPortLabel.setBounds(10, 25, 40, 20);
		serialPortPanel.add(serialPortLabel);

		commChoice.setFocusable(false);
		commChoice.setBounds(60, 25, 100, 20);
		serialPortPanel.add(commChoice);

		baudrateLabel.setForeground(Color.gray);
		baudrateLabel.setBounds(10, 60, 40, 20);
		serialPortPanel.add(baudrateLabel);

		baudrateChoice.setFocusable(false);
		baudrateChoice.setBounds(60, 60, 100, 20);
		serialPortPanel.add(baudrateChoice);

		// 操作
		operatePanel.setBorder(BorderFactory.createTitledBorder("操作"));
		operatePanel.setBounds(200, 220, 285, 188);
		operatePanel.setLayout(null);
		getContentPane().add(operatePanel);

		dataInput.setBounds(25, 25, 235, 63);
		operatePanel.add(dataInput);

		serialPortOpenBtn.setFocusable(false);
		serialPortOpenBtn.setBounds(45, 98, 90, 20);
		serialPortOpenBtn.addActionListener(this);
		operatePanel.add(serialPortOpenBtn);

		sendDataBtn.setFocusable(false);
		sendDataBtn.setBounds(155, 98, 90, 20);
		sendDataBtn.addActionListener(this);
		operatePanel.add(sendDataBtn);

		openCmdButton.setBounds(45, 128, 90, 20);
		openCmdButton.addActionListener(this);
		operatePanel.add(openCmdButton);

		closeCmdButton.setBounds(155, 128, 90, 20);
		closeCmdButton.addActionListener(this);
		operatePanel.add(closeCmdButton);

		JButton btnNewButton = new JButton("clear");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dataView.setText("");
			}
		});
		btnNewButton.setBounds(45, 158, 90, 20);
		operatePanel.add(btnNewButton);

	}
	@SuppressWarnings("unchecked")
	private void initData() {
		commList = SerialPortManager.findPort();
		// 检查是否有可用串口，有则加入选项中
		if (commList == null || commList.size() < 1) {
			DialogShowUtils.warningMessage("没有搜索到有效串口！");
		} else {
			for (String s : commList) {
				commChoice.addItem(s);
			}
		}

		baudrateChoice.addItem("9600");
		baudrateChoice.addItem("19200");
		baudrateChoice.addItem("38400");
		baudrateChoice.addItem("57600");
		baudrateChoice.addItem("115200");
	}


	/**
	 * 打开串口
	 * 
	 */
	private void openSerialPort() {


		// 获取串口名称
		String commName = (String) commChoice.getSelectedItem();
		// 获取波特率
		int baudrate = 9600;
		String bps = (String) baudrateChoice.getSelectedItem();
		baudrate = Integer.parseInt(bps);

		// 检查串口名称是否获取正确
		if (commName == null || commName.equals("")) {
			DialogShowUtils.warningMessage("没有搜索到有效串口！");
		} else {
			try {
				serialport = SerialPortManager.openPort(commName, baudrate);
				if (serialport != null) {
					dataShow("串口已打开",STYLE_RED);
					serialPortOpenBtn.setText("关闭串口");
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
		}

		try {
			SerialPortManager.addListener(serialport, new SerialListener());
		} catch (TooManyListeners e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 关闭串口
	 * 
	 */
	private void closeSerialPort() {
		SerialPortManager.closePort(serialport);
		dataShow("已经关闭串口",STYLE_RED);
		serialPortOpenBtn.setText("打开串口");
		serialport = null;
	}
	
	/**
	 * 打印数据到面板上
	 * 
	 */
	private void dataShow(String text,String style) {
		StringBuilder builderData = new StringBuilder();
		builderData.setLength(0);
		builderData.append(MyUtils.formatDateStr_ss()).append("\r\n").append(text).append("\r\n");
		try {
			Document document = dataView.getDocument();
			if(STYLE_RED.equals(style))
			dataView.getDocument().insertString(document.getLength(), builderData.toString(),
					dataView.getStyle(style));
			else
				dataView.getDocument().insertString(document.getLength(), builderData.toString(),
						dataView.getStyle(STYLE_NORMAL));
			dataView.setCaretPosition(document.getLength());
		} catch (BadLocationException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 发送指定数据
	 * 
	 */
	void sendDatas() {
		try {
			 byte[] by = new byte[]{-86, -71, 0, 5, -128, 0, 0, 0, 0, -106};
			SerialPortManager.sendToPort(serialport, by);
		} catch (SendDataToSerialPortFailure e) {
			e.printStackTrace();
		} catch (SerialPortOutputStreamCloseFailure e) {
			e.printStackTrace();
		} 
	}

	/**
	 * 发送指定数据
	 * 
	 */
	private void sendData(String data) {
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
			 by = new byte[]{(byte) 0xAA,(byte) 0x60,(byte) 0x00,(byte) 0x95,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x20,(byte) 0x11,(byte) 0x22,(byte) 0x33,(byte) 0x44,(byte) 0x55,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xE8};
		else if(data.equals("15"))//部分写入
			 by = new byte[]{(byte) 0xAA,(byte) 0x60,(byte) 0x00,(byte) 0x09,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x78,(byte) 0x11,(byte) 0x22,(byte) 0x33,(byte) 0x44,(byte) 0x86};
		
		
		
		if(by == null)
			by = new byte[]{55,00,00,01,01,55};
		try {
			
			SerialPortManager.sendToPort(serialport, by);
//			SerialPortManager.sendToPort(serialport, MyUtils.HexString2Bytes(data));
			
			dataShow(data,STYLE_RED);
		} catch (SendDataToSerialPortFailure e) {
			e.printStackTrace();
		} catch (SerialPortOutputStreamCloseFailure e) {
			e.printStackTrace();
		} 
	}

	private class SerialListener implements SerialPortEventListener {
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
						// 读取串口数据
						byte[] by = new byte[]{-86, -71, 0, 5, -128, 0, 0, 0, 0, -106};
						byte[] by1 = new byte[]{(byte) 0xAA,0x61,0x00,0x07,0x79,0x00,0x00,0x00,0x00,0x00,(byte) 0x90,0x25};
						byte[] by2 = new byte[]{(byte) 0xAA,(byte) 0xB5,0x00,0x08,(byte) 0x80,0x00,0x00,0x01,(byte) 0x82,0x11,0x11,0x11,0x05};
						byte[] by3 =  new byte[]{(byte) 0xAA, 0x61 ,0x00 ,0x07, 0x79, 0x00, 0x00,0x00, (byte) 0x90,0x00 ,0x70, 0x55};
						//全写
						byte[] by4 =  new byte[]{(byte) 0xAA,(byte) 0x60,(byte) 0x00,(byte) 0x95,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x20,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xE8};
						
						//读密码
						byte[] by5 =  new byte[]{(byte) 0xAA,(byte) 0x65,(byte) 0x00,(byte) 0x07,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x04,(byte) 0xB5};
						//读计数器
						byte[] by6 =  new byte[]{(byte) 0xAA,(byte) 0x67,(byte) 0x00,(byte) 0x07,(byte) 0x79,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x04,(byte) 0xB7};
						
						
						
						
						data = SerialPortManager.readFromPort(serialport);
						
						if(Arrays.equals(by , data))
						{
							System.out.println(1);
							byte[] bys = new byte[]{0X55,0X00,0X00,0X01,0X01,0X55};
							SerialPortManager.sendToPort(serialport, bys);
						}
						else if(Arrays.equals(by1 , data))
						{
							System.out.println(2);
							byte[] bys = new byte[]{0x55,(byte) 0x00,(byte) 0x00,(byte) 0x90,(byte) 0xA2,(byte) 0x13,(byte) 0x10,(byte) 0x91,(byte) 0xFF,(byte) 0xFF,(byte) 0x81,(byte) 0x15,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xD2,(byte) 0x76,(byte) 0x00,(byte) 0x00,(byte) 0x04,(byte) 0x00,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF};
							SerialPortManager.sendToPort(serialport, bys);
							byte[] bys1 = new byte[]{(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF};
							SerialPortManager.sendToPort(serialport, bys1);
							byte[] bys2 = new byte[]{(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x2F};
							SerialPortManager.sendToPort(serialport, bys2);
						}
						else if(Arrays.equals(by2 , data))
						{
							System.out.println(3);
							byte[] bys = new byte[]{0X55,0X00,0X00,0X00,0X55};
							SerialPortManager.sendToPort(serialport, bys);
						}
						else if(Arrays.equals(by3 , data))
						{
							System.out.println(4);
							byte[] bys = new byte[]{0x55,(byte) 0x00,(byte) 0x00,(byte) 0x70,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x11,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF};
							SerialPortManager.sendToPort(serialport, bys);
							byte[] bys1 = new byte[]{(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0x25};
							SerialPortManager.sendToPort(serialport, bys1);
						}
						else if(Arrays.equals(by4 , data))
						{
							System.out.println(5);
							byte[] bys = new byte[]{0x55,(byte) 0x8A,(byte) 0x00,(byte) 0x00,(byte) 0xDF};
							SerialPortManager.sendToPort(serialport, bys);
						}
						else if(Arrays.equals(by5 , data))
						{
							System.out.println(6);
							byte[] bys = new byte[]{0x55,(byte) 0x00,(byte) 0x00,(byte) 0x04,(byte) 0x07,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xA9};
							SerialPortManager.sendToPort(serialport, bys);
						}
						else if(Arrays.equals(by6 , data))
						{
							System.out.println(7);
							byte[] bys = new byte[]{0x55,(byte) 0x00,(byte) 0x00,(byte) 0x04,(byte) 0x07,(byte) 0xFF,(byte) 0xFF,(byte) 0xFF,(byte) 0xA9};
							SerialPortManager.sendToPort(serialport, bys);
						}
						System.out.println(MyUtils.byteArray2HexString_int(data, data.length, true));
						System.out.println(MyUtils.byteArray2HexString(data, data.length, true));
						System.out.println(MyUtils.byteArray2HexString_char(data, data.length, true));
						System.out.println("data:"+data.length);
						dataShow(MyUtils.byteArray2HexString(data, data.length, true), STYLE_NORMAL);
					}
				} catch (Exception e) {
					DialogShowUtils.errorMessage(e.toString());
					// 发生读取错误时显示错误信息后退出系统
					System.exit(0);
				}
				break;
			}
		}
	}

	public static void main(String args[]) {
		java.awt.EventQueue.invokeLater(new Runnable() {
			public void run() {
				new MainFrame().setVisible(true);
			}
		});
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == serialPortOpenBtn) {
			if (serialport == null) {
				openSerialPort();
			} else {
				closeSerialPort();
			}
		} else if (e.getSource() == sendDataBtn) {
			String data = dataInput.getText().toString();
			if(MyUtils.isEmpty(data))
				return;
			sendData(data);
		} else if (e.getSource() == openCmdButton) {
			// 0x02 0x05 0x01 0xaa 0x03 --> "0x02 0x05 0x01 0x06 0x03"
			String data = "020501aa03";
			sendData(data);

		} else if (e.getSource() == closeCmdButton) {
			// 0x02 0x05 0x02 0xaa 0x03 --> "0x02 0x05 0x02 0x05 0x03"
			String data = "020502aa03";
			sendData(data);
		}
	}



}