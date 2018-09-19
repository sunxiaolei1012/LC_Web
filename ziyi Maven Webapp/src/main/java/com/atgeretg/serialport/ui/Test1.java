package com.atgeretg.serialport.ui;

public class Test1 {

		public static void main(String[] args) {
			byte[] by = new byte[]{(byte) 0xAA, 0x60 ,0x00 ,0x0C ,0x79, 0x00 ,0x00, 0x00, 0x20, 0x11, 0x22, 0x33, 0x44 ,0x56, 0x77, 0x22};
			try {
				byte[] s = parityOfOdd(by , 0);
				for (byte b : s) {
					System.out.print(b);
				}
				System.out.println();
				byte[] d = parityOfOdd(by ,1);
				for (byte b : d) {
					System.out.print(b);
				}
				System.out.println();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		/**
		* 奇校验
		* <ul><li>就是让原有数据序列中（包括你要加上的一位）1的个数为奇数</li>
		* <li>1000110（0）你必须添0这样原来有3个1已经是奇数了所以你添上0之后1的个数还是奇数个</li>
		* </ul>
		* @param bytes 长度为8的整数倍
		* @param parity 0:奇校验,1:偶校验
		* @return
		* @throws Exception
		*/
		public static byte[] parityOfOdd(byte[] bytes, int parity) throws Exception{
		if(bytes == null || bytes.length % 8 != 0){
		throw new Exception("数据错误!");
		}
		if(!(parity == 0 || parity == 1)){
		throw new Exception("参数错误!");
		}
		byte[] _bytes = bytes;
		String s; // 字节码转二进制字符串
		char[] cs ; // 二进制字符串转字符数组
		int count; // 为1的总个数
		boolean lastIsOne; // 最后一位是否为1
		for(int i=0;i<_bytes.length;i++){
		// 初始化参数
		s = Integer.toBinaryString((int)_bytes[i]); // 字节码转二进制字符串
		cs = s.toCharArray();// 二进制字符串转字符数组
		count = 0;// 为1的总个数
		lastIsOne = false;// 最后一位是否为1
		for(int j=0;j<s.length();j++){
		if(cs[j] == '1'){
		count++;
		}
		if(j == (cs.length -1)){ // 判断最后一位是否为1
		if(cs[j] == '1'){
		lastIsOne = true;
		} else {
		lastIsOne = false;
		}
		}
		}
		// 偶数个1时
		if(count % 2 == parity){
		// 最后一位为1,变为0
		if(lastIsOne){
		_bytes[i] = (byte) (_bytes[i] - 0x01);
		} else {
		// 最后一位为0,变为1
		_bytes[i] = (byte) (_bytes[i] + 0x01);
		}
		}
		}
		return _bytes;
		}
	
}
