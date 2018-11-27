package com.ziyi.control.cmd;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.cyb.util.Common;
import com.cyb.util.Util;
import com.cyb.util.config;
import com.opensymphony.xwork2.ActionContext;
import com.ziyi.pojo.Card;
import com.ziyi.pojo.Selling_list;
import com.ziyi.pojo.Selling_type;
import com.ziyi.pojo.Users;

/**
 * 商品管理
 * 
 * @author 陈玉博
 * @date 2018年9月16日下午3:48:53
 */
public class SellingControl {
	/**
	 * 获取会员卡信息 //不分页
	 * 
	 * @return
	 */
	public String get_sellings() {
		List<Selling_list> list = Common.SLD.select_selling_list_pages();
		ActionContext.getContext().put("selling", list);
		ActionContext.getContext().getSession().put("typeid", Common.STYPE.select_selling_type());
		return "get_selling";
	}

	/**
	 * 获取会员卡信息 //分页
	 * 
	 * @return
	 */
	public String get_selling(String page) {
		// 1、获取到要取第几页内容
		int new_page = 0;
		if (page != null)
			new_page = new Integer(page);
		// 2、查询总共有多少条数据
		int a = Util.sqlCount("select COUNT(sellingid) from t_selling_list");
		if (a != 0) {
			int zong = a / config.PAGE_CARD_SHOW_NUMBER;
			// 判断总共有多少页，
			if (a % config.PAGE_CARD_SHOW_NUMBER != 0)
				zong += 1;

			if (new_page <= 0 || new_page > zong)
				new_page = 1;

			List<Selling_list> list = Common.SLD.select_selling_list_page(new_page, config.PAGE_CARD_SHOW_NUMBER);

			ActionContext.getContext().put("selling", list);
			ActionContext.getContext().put("zong", zong);
			ActionContext.getContext().put("page", new_page);
			ActionContext.getContext().getSession().put("typeid", Common.STYPE.select_selling_type());
		}

		return "get_selling";
	}

	/**
	 * 添加会员卡信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String add_selling(String name, String price, String unit, String rebate, String proportion, String typeid,
			String xiangxi, String number, List<File> file, List<String> fileFileName, List<String> fileContentType)
			throws IOException {
		Users user = (Users) ActionContext.getContext().getSession().get("user");
		Selling_list sell = new Selling_list();
		sell.setName(name);
		sell.setNumber(new Integer(number));
		sell.setPrice(new Double(price));
		sell.setProportion(new Double(proportion));
		sell.setPycode("cs");
		sell.setRebate(new Integer(rebate));
		sell.setTypeid(new Integer(typeid));
		sell.setUnit(unit);
		sell.setUserid(user.getUserid());
		sell.setXiangxi(xiangxi);
		System.out.println(file);
		int bool = Common.SLD.insert_Selling_list(sell);
		if (file != null) {
			String path = ServletActionContext.getRequest().getRealPath("/upload");
			for (int i = 0; i < file.size(); i++) {
				String file_name = Common.TOOLS.getRandomFileName() + "." + Common.TOOLS.ext(fileFileName.get(i));
				OutputStream os = new FileOutputStream(new File(path, file_name));
				System.out.println(fileContentType.get(i));
				InputStream is = new FileInputStream(file.get(i));

				byte[] buf = new byte[1024];
				int length = 0;

				while (-1 != (length = is.read(buf))) {
					os.write(buf, 0, length);
				}
				is.close();
				os.close();
				// 添加图片信息
				Common.SID.insert_selling_image(bool, file_name);
			}
		}
		Common.TOOLS.return_map_object(bool > 0 ? true : false, config.ADD_USER_RIGHT_MSG, config.ADD_ERROR_MSG);
		return "json";
	}

	/**
	 * 根据商品ID 获取商品信息
	 */
	public String get_selling_id(String id) {
		// 查询商品信息
		Selling_list sl = Common.SLD.selecct_id_list(new Integer(id));
		// 根据商品查询图片信息
		// List<Selling_Image> si = Common.SID.select_selling_image(new
		// Integer(id));

		List<Selling_type> st = Common.STYPE.select_selling_type();
		ActionContext.getContext().put("sl", sl);
		ActionContext.getContext().put("ty", st);
		// ActionContext.getContext().put("si", si);
		return "update_selling";
	}

	/**
	 * 根据会员卡类型ID 修改会员卡信息
	 */
	public String xiu_card(String id, String number, String ctid, String name, String phone, String address,
			String idcard, String price, String spend, String remain) {
		Card card = new Card();
		card.setAddress(address);
		card.setCardid(new Integer(id));
		card.setCtid(new Integer(ctid));
		card.setIdcard(idcard);
		card.setName(name);
		card.setNumber(number);
		card.setPhone(new Integer(phone));
		card.setPrice(new Double(price));
		card.setRemain(new Double(remain));
		card.setSpend(new Double(spend));
		boolean bool = Common.CARDDAO.update_card(card);
		Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		return "json";
	}

	/**
	 * 修改商品信息
	 */
	public String xiu_selling(String id, String name, String price, String unit, String rebate, String proportion,
			String userid, String pycode, String typeid, String xiangxi, String number) {
		Selling_list se = new Selling_list();
		se.setSellingid(new Integer(id));
		se.setName(name);
		se.setNumber(new Integer(number));
		se.setPrice(new Double(price));
		se.setProportion(new Double(proportion));
		se.setPycode(pycode);
		se.setRebate(new Integer(rebate));
		se.setTypeid(new Integer(typeid));
		se.setUnit(unit);
		se.setUserid(new Integer(userid));
		se.setXiangxi(xiangxi);
		boolean bool = Common.SLD.update_selling_list(se);
		Common.TOOLS.return_map_object(bool, config.XIU_USER_RIGHT_MSG, config.XIU_USER_ERROR_MSG);
		return "json";
	}

	/**
	 * 根据ID 删除会员卡
	 * 
	 * @param id
	 * @return
	 */
	public String del_selling(String id) {
		Common.SLD.del_selling_list(new Integer(id));
		return "del_selling";
	}
}
