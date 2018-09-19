package com.atgeretg.serialport.ui;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.Buffer;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.TooManyListenersException;


import gnu.io.CommDriver;
import gnu.io.CommPortIdentifier;
import gnu.io.PortInUseException;
import gnu.io.SerialPort;
import gnu.io.SerialPortEvent;
import gnu.io.SerialPortEventListener;
import gnu.io.UnsupportedCommOperationException;

//import com.apple.dnssd.*;
//import com.sun.org.apache.bcel.internal.generic.I2C;
//import com.sun.org.apache.bcel.internal.generic.NEW;


public class ReadCom implements SerialPortEventListener {
    //枚举类型
    Enumeration<CommPortIdentifier> portList;
    // 检测系统可用端口
    private CommPortIdentifier portIdentifier;
    // 端口
    private SerialPort port;
    // 输入/输出流
    private InputStream inputStream;
    private OutputStream outputStream;

    public void getPortList() {
        // 获得系统支持的所有端口（串口，并口）
        portList = CommPortIdentifier.getPortIdentifiers();

        while(portList.hasMoreElements()) {
            portIdentifier = (CommPortIdentifier)portList.nextElement();
            // CommPortIdentifier.PORT_SERIAL :串口
            // CommPortIdentifier.PORT_PARALLEL :并口
            // CommPortIdentifier.PORT_RS485 :RS485
            // CommPortIdentifier.PORT_I2C :I2C
            // CommPortIdentifier.PORT_RAW 

            if (portIdentifier.getPortType() == CommPortIdentifier.PORT_SERIAL) {
//                System.out.println(portIdentifier.getName());
                if (portIdentifier.getName().equals("COM2")) {
                try {
                    // open:打开串口，第一个参数应用程序名称 字符串可随意填写，第二个参数阻塞时等待多少毫秒
                    port = (SerialPort)portIdentifier.open("ReadCom888", 2000);
                    // 串口设置监听
                    port.addEventListener(this);
                    // 设置可监听
                    port.notifyOnDataAvailable(true);
                    // 设置串口通信参数
                    // 波特率，数据位，停止位，校验方式
                    port.setSerialPortParams(9600, 
                            SerialPort.DATABITS_8, 
                            SerialPort.STOPBITS_1,
                            SerialPort.PARITY_NONE);
                    outputStream = port.getOutputStream();
                    inputStream = port.getInputStream();

                } catch (PortInUseException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (TooManyListenersException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (UnsupportedCommOperationException e) { 
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }

    }

    public void serialEvent(SerialPortEvent event) {
        // TODO Auto-generated method stub
        // TODO Auto-generated method stub
         /* 
        *  SerialPortEvent.BI:/*Break interrupt,通讯中断 
        *  SerialPortEvent.OE:/*Overrun error，溢位错误 
        *  SerialPortEvent.FE:/*Framing error，传帧错误 
        *  SerialPortEvent.PE:/*Parity error，校验错误 
        *  SerialPortEvent.CD:/*Carrier detect，载波检测  
        *  SerialPortEvent.CTS:/*Clear to send，清除发送  
        *  SerialPortEvent.DSR:/*Data set ready，数据设备就绪 
        *  SerialPortEvent.RI:/*Ring indicator，响铃指示 
        *  SerialPortEvent.OUTPUT_BUFFER_EMPTY:/*Output buffer is empty，输出缓冲区清空 
        *  SerialPortEvent.DATA_AVAILABLE:
        */  
        switch (event.getEventType()) {
            case SerialPortEvent.BI:
            case SerialPortEvent.OE:
            case SerialPortEvent.FE:
            case SerialPortEvent.PE:
            case SerialPortEvent.CD:
            case SerialPortEvent.CTS:
            case SerialPortEvent.DSR:
            case SerialPortEvent.RI:
            case SerialPortEvent.OUTPUT_BUFFER_EMPTY:
                break;
            case SerialPortEvent.DATA_AVAILABLE: // 
                readData();
                break;

            default:
                break;
        }   
    }


    public void readData() {
        byte[] rbuff = new byte[1024];
        byte[] by = new byte[]{55,00,00,01,01,55};
        int hasRead = 0;
        try {
            while((hasRead=inputStream.read(rbuff)) > 0) {
//                System.out.println(new String(rbuff, 0, hasRead));
//            	System.out.println(rbuff.toString());
//            	System.out.println(Arrays.toString(rbuff));
            	sendData_byte(by);
                break;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    
    /**
     * 16进制转换成为string类型字符串
     * @param s
     * @return
     */
    public static String hexStringToString(String s) {
        if (s == null || s.equals("")) {
            return null;
        }
        s = s.replace(" ", "");
        byte[] baKeyword = new byte[s.length() / 2];
        for (int i = 0; i < baKeyword.length; i++) {
            try {
                baKeyword[i] = (byte) (0xff & Integer.parseInt(s.substring(i * 2, i * 2 + 2), 16));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            s = new String(baKeyword, "UTF-8");
            new String();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return s;
    }

    public void sendData_byte(byte[] rbuff) {
        try {
            outputStream.write(rbuff);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void sendData(String data) {
        try {
            outputStream.write(data.getBytes());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        new ReadCom().getPortList();
    }


}