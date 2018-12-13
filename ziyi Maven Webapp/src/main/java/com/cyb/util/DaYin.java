package com.cyb.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.print.Book;
import java.awt.print.PageFormat;
import java.awt.print.Paper;
import java.awt.print.Printable;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DaYin implements Printable {

	private static String SHOPNAME;// 店铺名
	private static String SHOPTEL;// 店铺名
	private static String ORDERNO;// 单号
	private static String[] GOODSARRAY;

	private static String MEMNAME;// 订餐姓名
	private static String MEMMOBILE;// 订餐电话
	private static String MEMADDRESS;// 订餐地址
	
	private static boolean BOOL;
	private static String SHIFU;
	private static String PRICE;
	private static String USERNAME;
	private static String BEGAINTIME;
	private static String ENDTIME;
	
	private static String JieZhang;
	
	private static void chushihua(String begainTime,String endTime,String username,String shopname, String orderNo, String memName, String memMobile, String memAddress,
			String[] goodsArray,String price,boolean bool, String shifu , String jiezhang) {
		SHOPNAME = shopname;
		SHOPTEL = memMobile;
		ORDERNO = orderNo;
		GOODSARRAY = goodsArray;

		MEMNAME = memName;
		MEMMOBILE = memMobile;
		MEMADDRESS = memAddress;
		
		BOOL = bool;
		SHIFU = shifu;
		PRICE = price;
	   USERNAME=username;
	   BEGAINTIME=begainTime;
	   ENDTIME=endTime;
	   
	   JieZhang=jiezhang;
	}

	/**
	 * 用于将商品零售进行进行打印
	 */
	public static void printSheet(String begainTime,String endTime,String username,String shopname, String orderNo, String memName, String memMobile, String memAddress,
			String[] goodsArray,String price, boolean bool , String shifu , String jiezhang) {
		chushihua(begainTime,endTime,username,shopname, orderNo, memName, memMobile, memAddress, goodsArray,price,bool , shifu , jiezhang);
		// 通俗理解就是书、文档
		Book book = new Book();
		// 设置成竖打
		PageFormat pf = new PageFormat();
		pf.setOrientation(PageFormat.PORTRAIT); // LANDSCAPE表示竖打;PORTRAIT表示横打;REVERSE_LANDSCAPE表示打印空白
		// 通过Paper设置页面的空白边距和可打印区域。必须与实际打印纸张大小相符。
		Paper p = new Paper();
		int length = printSize(GOODSARRAY);// 加值参数为115，增加行数需要增加高度
		// System.out.println("Paper length is:" + length);
		p.setSize(165, length); // 纸张大小A4纸(595, 842),经测试58mm为165
		p.setImageableArea(5, 5, 155, length); // 设置打印区域，A4纸的默认X,Y边距是72
		// x - 用来设置此 paper 可成像区域左上角的 x 坐标
		// y - 用来设置此 paper 可成像区域左上角的 y 坐标
		// width - 用来设置此 paper 可成像区域宽度的值
		// height - 用来设置此 paper 可成像区域高度的值
		pf.setPaper(p);
		// 把 PageFormat 和 Printable 添加到书中，组成一个页面
		book.append(new DaYin(), pf);
		// 获取打印服务对象
		PrinterJob job = PrinterJob.getPrinterJob();
		// 设置打印类
		job.setPageable(book);
		try {
			// // 可以用printDialog显示打印对话框，在用户确认后打印；也可以直接打印
			// boolean a = job.printDialog();
			// if (a) {
			job.print();
			// }
		} catch (PrinterException e) {
			e.printStackTrace();
		}
	}

	public static Integer printSize(String[] goodsArray) {
		int height = 140;// 加值参数为140，增加行数需要增加高度
		if (goodsArray.length > 0) {
			height += goodsArray.length * 10;
			for (int i = 0; i < goodsArray.length; i++) {
				String[] goods = goodsArray[i].split(",");
				if (goods[0].length() > 8) {// 名称超8个字,换行
					height += 10;
				}
			}
		}
		return height;
	}

	@Override
	public int print(Graphics graphics, PageFormat pageFormat, int pageIndex) throws PrinterException {
		try {
			/**
			 * * @param Graphic指明打印的图形环境 PageFormat指明打印页格式（页面大小以点为计量单位，
			 * 1点为1英寸的1/72，1英寸为25.4毫米。A4纸大致为595×842点） *
			 * 
			 * @param pageIndex指明页号
			 **/
			// 转换成Graphics2D
			Graphics2D g2d = (Graphics2D) graphics;
			// 设置打印颜色为黑色
			g2d.setColor(Color.black);
			// 打印起点坐标
			switch (pageIndex) {
			case 0:
				String xuxian = "---------------------------";
				double x = pageFormat.getImageableX();
				double y = pageFormat.getImageableY() + 10;
				// 设置打印字体（字体名称、样式和点大小）（字体名称可以是物理或者逻辑名称）
				Font fontTitle = new Font("新宋体", Font.BOLD, 10);
				g2d.setFont(fontTitle); // 设置字体
				
				//多加一行
				y += fontTitle.getSize2D() + 2;
				
				// 打印标题
				g2d.drawString(DaYin.SHOPNAME, (float) x + 40, (float) y);

				Font fontContent = new Font("新宋体", Font.PLAIN, 8);
				g2d.setFont(fontContent); // 设置字体

				y += fontTitle.getSize2D() + 2;
				// 打印 订单号
				g2d.drawString("订单号：" + DaYin.ORDERNO, (float) x, (float) y);
				y += fontContent.getSize2D() + 2;
				g2d.drawString("桌  号：" +MEMNAME, (float) x, (float) y);
				y += fontContent.getSize2D() + 2;
				g2d.drawString("服务员:" + USERNAME, (float) x, (float) y);
				if(BOOL)
				{
					g2d.drawString("收银员：" + JieZhang, (float) x + 70, (float) y);
					
				}
			
				y += fontContent.getSize2D() + 2;
				g2d.drawString("下单时间：" + BEGAINTIME, (float) x, (float) y);
				
				if(ENDTIME.length()>0 && ENDTIME!=null) {
				y += fontContent.getSize2D() + 2;
				g2d.drawString("结账时间：" + ENDTIME, (float) x, (float) y);
				}
				y += fontContent.getSize2D() + 2;
				g2d.drawString(xuxian, (float) x, (float) y);
				y += fontContent.getSize2D() + 2;

				g2d.drawString("菜式", (float) x, (float) y);
				g2d.drawString("数量", (float) x + 70, (float) y);
				g2d.drawString("单价", (float) x + 95, (float) y);
				y += fontContent.getSize2D() + 2;
				int totalCount = 0;
//				Double totalPrice = 0.0;

				for (int i = 0; i < (GOODSARRAY.length / 3); i++) {
					String[] goods = GOODSARRAY;
					totalCount += Double.valueOf(goods[3 * i + 1]);
//					totalPrice += Double.valueOf(goods[3 * i + 1]) * Double.valueOf(goods[3 * i + 2]);
					if (goods[i * 3].length() > 8) {// 名称超8个字,换行
						int index = goods[i * 3].length() / 8 - 1;
						for (int a = 0; a <= index; a++) {
							String str = goods[i * 3];
							if (a == 0) {
								str = str.substring(0, a * 8 + 8);
								g2d.drawString((i + 1) + "." + str, (float) x, (float) y);
								g2d.drawString(goods[i * 3 + 1], (float) x + 75, (float) y);
								g2d.drawString(goods[i * 3 + 2], (float) x + 95, (float) y);
								y += fontContent.getSize2D() + 2;
							} else {
								str = str.substring(a * 8, a * 8 + 8);
								g2d.drawString(str, (float) x, (float) y);
								if (a != index)
									y += fontContent.getSize2D() + 2;
							}
						}
					} else {
						g2d.drawString((i + 1) + "." + goods[i * 3], (float) x, (float) y);
						g2d.drawString(goods[i * 3 + 1], (float) x + 75, (float) y);
						g2d.drawString(goods[i * 3 + 2], (float) x + 95, (float) y);
					}

					y += fontContent.getSize2D() + 2;
					// System.out.println(y);
				}

				g2d.drawString(xuxian, (float) x, (float) y);
				y += fontContent.getSize2D() + 2;
				g2d.drawString("数量：" + totalCount, (float) x, (float) y);
				g2d.drawString("总计：" + PRICE , (float) x + 70, (float) y);
				y += fontContent.getSize2D() + 2;
				if(BOOL)
				{
					g2d.drawString("实付：" + SHIFU, (float) x + 70, (float) y);
					y += fontContent.getSize2D() + 2;
				}
				
				g2d.drawString(xuxian, (float) x, (float) y);
				y += fontContent.getSize2D() + 2;
				g2d.drawString("地址：" + MEMADDRESS, (float) x + 10, (float) y);
				y += fontContent.getSize2D() + 2;
				g2d.drawString("联系电话：" + MEMMOBILE, (float) x + 10, (float) y);
				
				//多加一行
				y += fontTitle.getSize2D() + 2;
				return PAGE_EXISTS;
			default:
				return NO_SUCH_PAGE;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static void main(String[] args) {
//		String arr1[] = { "茶水", "2", "1001.00", "酒1水酒1水酒1水酒1水酒1水酒1水酒1水", "32", "1020.00", "酒水2", "11", "10.00", "酒1水",
//				"32", "1020.00", "酒1水", "32", "1020.00", "酒1水", "32", "1020.00", "酒1水", "33", "101" };
//		DaYin.printSheet("紫怡茶道", "564654878978", "table", "5677-7388", "广中西路768号", arr1);

	}

}
