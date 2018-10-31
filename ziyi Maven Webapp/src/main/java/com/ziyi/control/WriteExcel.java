//package com.ziyi.control;
//
//import java.io.*;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//
//public class WriteExcel {
//
//	 public final static int NUM=1000000;
//
//
//	public static void export(String fileName, String[] headers,
//		 	String[] fields, List<Map<String, String>> datas,String markkey
//			) throws IOException {
//		try {
//			// 验证参数 
//			verifyParams(fileName, headers, fields, datas);
//
//			// 创建工作薄
//			SXSSFWorkbook workbook = createWorkbook(headers, fields, datas,markkey);
//			// 导出EXCEL
//			export(fileName, workbook);
//		} catch (IOException e) {
//			e.printStackTrace();
//			throw e;
//		}
//	}
//
//	public static FileInputStream generateFile(String fileName, String[] headers,
//			String[] fields, List<Map<String, String>> datas,String markkey
//			) throws IOException {
//		try {
//			// 验证参数
//			verifyParams(fileName, headers, fields, datas);
//
//			// 创建工作薄
//			SXSSFWorkbook workbook = createWorkbook(headers, fields, datas,markkey);
//			// 导出EXCEL
//			export(fileName, workbook);
//		} catch (IOException e) {
//			e.printStackTrace();
//			throw e;
//		}
//		return new FileInputStream(fileName);
//	}
//
//	public static void export(String fileName,
//			SXSSFWorkbook workbook) throws FileNotFoundException, IOException,
//			UnsupportedEncodingException {
//		//File file = null;
//		FileOutputStream os = null;
////		InputStream is = null;
//		try {
//			os = new FileOutputStream(fileName);
//			// 将workbook写入输出流
//			workbook.write(os);
//
//		} finally {
//			// 关闭输出流
//			if (os != null) {
//				os.flush();
//				os.close();
//			}
//
//		}
//	}
//
//	private static SXSSFWorkbook createWorkbook(String[] headers,
//			String[] fields, List<Map<String, String>> datas,String markkey) {
//		// 创建工作薄
//		SXSSFWorkbook workbook = new SXSSFWorkbook();
//
//		setSZContentStyle(workbook);
//
//		int x = datas.size() / WriteExcel.NUM+1;
//		for (int i = 0; i < x; i++) {
//			int s = i * WriteExcel.NUM;
//			int e = 0;
//			if (i == (x - 1)) {
//				e = datas.size();
//			} else {
//				e = s + WriteExcel.NUM;
//
//			}
//			List<Map<String, String>> data = new ArrayList();
//			data.addAll(datas.subList(s, e));
//			if(markkey!=null){
//				buildSheet(workbook, markkey+i, headers, fields, data);
//			}else{
//			buildSheet(workbook, "sheet" + i, headers, fields, data);
//			}
//		}
//
//		// 创建表格
//
//		return workbook;
//	}
//
//
//
//	public static void buildSheet(SXSSFWorkbook workbook,String sheetName,String[] headers,
//			String[] fields,List<Map<String, String>> datas){
//
//
//		Sheet sheet = workbook.createSheet(sheetName);
//		// 创建标题行
//		Row header = sheet.createRow(0);
//		for (int i = 0; i < headers.length; i++) {
//			Cell cell = header.createCell(i);
//			cell.setCellValue(headers[i]);
//		}
//
//		// 创建数据行
//		for (int i = 0; i < datas.size(); i++) {
//			Row row = sheet.createRow(i + 1);
//			Map<String, String> data = datas.get(i);
//			for (int j = 0; j < fields.length; j++) {
//				Cell cell = row.createCell(j);
//				setCellValue(cell,StringUtil.getString(data.get(fields[j])));
//			}
//		}
//
//
//	}
//
//	public static void setCellValue(Cell cell,String data){
//
//
//		cell.setCellType(Cell.CELL_TYPE_STRING);
//		cell.setCellValue(data);
//
////		 Boolean isNum = false;//data是否为数值型
////         Boolean isInteger=false;//data是否为整数
////         Boolean isPercent=false;//data是否为百分数
////
////         if (data != null || "".equals(data)) {
////             //判断data是否为数值型
////             isNum = data.toString().matches("^(-?\\d+)(\\.\\d+)?$");
////             //判断data是否为整数（小数部分是否为0）
////             isInteger=data.toString().matches("^[-\\+]?[\\d]*$");
////             //判断data是否为百分数（是否包含“%”）
////             isPercent=data.toString().contains("%");
////         }
////		if(isNum){
////			//cell.setCellStyle(szcontentStyle);
////			//cell.setCellValue(Double.parseDouble(subZeroAndDot(data)));
////			double n = 100000000000l;
////			if(Double.parseDouble(subZeroAndDot(data))<n){
////				cell.setCellValue(Double.parseDouble(subZeroAndDot(data)));
////			}else {
////				cell.setCellValue(subZeroAndDot(data));
////			}
////		}else{
////			cell.setCellValue(subZeroAndDot(data));
////		}
//
//	}
//
//	 public static String subZeroAndDot(String s){
//	        if(s.indexOf(".") > 0){
//	            s = s.replaceAll("0+?$", "");//去掉多余的0
//	            s = s.replaceAll("[.]$", "");//如最后一位是.则去掉
//	        }
//	        return s;
//	    }
//
//	public  static CellStyle szcontentStyle=null;
//	public  static void setSZContentStyle (SXSSFWorkbook workbook) {
//	     szcontentStyle = workbook.createCellStyle(); //设置内容行格式
//	     DataFormat df = workbook.createDataFormat(); // 此处设置数据格
//	     szcontentStyle.setDataFormat(df.getFormat("#,#0"));//数据格式只显示整数
//
//	}
//
//
//	private static void verifyParams(String fileName, String[] headers,
//			String[] fields, List<Map<String, String>> datas
//			) {
//		if (fileName == null) {
//			throw new IllegalArgumentException("参数：fileName为空！");
//		}
//
//		if (headers == null || headers.length <= 0) {
//			throw new IllegalArgumentException("参数：headers为空！");
//		}
//
//		if (fields == null || fields.length <= 0) {
//			throw new IllegalArgumentException("参数：fields为空！");
//		}
//
//		if (datas == null) {
//			throw new IllegalArgumentException("参数：datas为空！");
//		}
//
//
//
//	}
//	public static void main(String[] args) throws FileNotFoundException, FileFormatException {
//
//		//Map map1 = IcsSupplieData.buildIcsSupplieData("E:/ics2015.xlsx");
//		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("code", "斐迪南塞i'd'su'ai");
//		map.put("name", "发的核算");
//		map.put("province", "士大夫欧萨");
//		map.put("companycity", "就手动啊的");
//		Map<String, String> map1 = new HashMap<String, String>();
//		map1.put("code", "到安徽饭店");
//		map1.put("name", "抖擞回复第四");
//		map1.put("province", "数据佛寺");
//		map1.put("companycity", "发的苏范德萨");
//		Map<String, String> map2 = new HashMap<String, String>();
//		map2.put("code", "反搜安静地方撒");
//		map2.put("name", "风刀霜剑阿凡达");
//		map2.put("province", "但是富婆阿范德萨");
//		map2.put("companycity", "发多少卡京东方");
//		Map<String, String> map3 = new HashMap<String, String>();
//		map3.put("code", "第三方鉴定书");
//		map3.put("name", "第三方");
//		map3.put("province", "风刀霜剑阿凡达");
//		map3.put("companycity", "的首付是多少");
//		String[] headers = {"投保公司代码","投保公司简称","省份","城市"} ;
//		String[] fields = {"code", "name", "province", "companycity"} ;
//		list.add(map);
//		list.add(map1);
//		list.add(map2);
//		list.add(map3);
//		try {
//			WriteExcel.export("E://tmp//teewst.xlsx",headers,fields,list,null);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//}
