package com.cyb.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.port.main.Main;
import com.ziyi.dao.BannerDao;
import com.ziyi.dao.CardDao;
import com.ziyi.dao.Card_typeDao;
import com.ziyi.dao.LogDao;
import com.ziyi.dao.MonthPriceDao;
import com.ziyi.dao.Old_CardDao;
import com.ziyi.dao.OrderDao;
import com.ziyi.dao.Order_listDao;
import com.ziyi.dao.PayTypePriceDao;
import com.ziyi.dao.RoleDao;
import com.ziyi.dao.Selling_ImageDao;
import com.ziyi.dao.Selling_listDao;
import com.ziyi.dao.Selling_typeDao;
import com.ziyi.dao.SumDao;
import com.ziyi.dao.Tea_HouseDao;
import com.ziyi.dao.UsersDao;
import com.ziyi.dao.impl.BannerDaoImpl;
import com.ziyi.dao.impl.CardDaoImpl;
import com.ziyi.dao.impl.Card_typeDaoImpl;
import com.ziyi.dao.impl.LogDaoImpl;
import com.ziyi.dao.impl.MonthPriceDaoImpl;
import com.ziyi.dao.impl.Old_CardDaoImpl;
import com.ziyi.dao.impl.OrderDaoImpl;
import com.ziyi.dao.impl.Order_listDaoImpl;
import com.ziyi.dao.impl.PayTypePriceDaoImpl;
import com.ziyi.dao.impl.RoleDaoImpl;
import com.ziyi.dao.impl.Selling_ImageDaoImpl;
import com.ziyi.dao.impl.Selling_listDaoImpl;
import com.ziyi.dao.impl.Selling_typeDaoImpl;
import com.ziyi.dao.impl.SumDaoImpl;
import com.ziyi.dao.impl.Tea_HouseDaoImpl;
import com.ziyi.dao.impl.UsersDaoImpl;

/**
 *常量
 * @author cyb
 *
 */
public class Common {

	
	static Properties pros = null;   //可以帮助读取和处理资源文件中的信息
	static {   //加载JDBCUtil类的时候调用。注意这里的话，只会被加载一次。
			pros = new Properties();
	try {
		//关键的代码 
		pros.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
		
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	 static final String DRIVER=pros.getProperty("driver");
	 static final String URL=pros.getProperty("url");
	 static final String USERNAME=pros.getProperty("user");
	 static final String PASSWORD=pros.getProperty("password");
	 
	 
//	 static{
//		 Main.openSerialPort(pros.getProperty("com"));
//		 Main.chen();
//	 }
	 public static final Util UTIL = new Util();
	
	 public static final JDBC JD = new JDBC();
	 public static final Gsons gson = new Gsons();
	 public static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	 public static final SimpleDateFormat df_day = new SimpleDateFormat("yyyy-MM-dd");
	 //实例化用户接口
	 public static final UsersDao USERS = new UsersDaoImpl();
	 
	 public static final DecimalFormat double_df = new DecimalFormat("#.00");
	 
	 //用来存储用户登录
	 public static Map<Integer , String> MAP = new HashMap<Integer , String>();
	 
	 //订单接口
	 public static final OrderDao ORDER = new OrderDaoImpl();
	 public static final Selling_listDao SLD = new Selling_listDaoImpl();
	 public static final Order_listDao OLD =new Order_listDaoImpl();
	 public static final MonthPriceDao MPD=new MonthPriceDaoImpl();
	 public static final PayTypePriceDao PPD=new PayTypePriceDaoImpl();
	 
	 
	 
	 //日志
	 public static final LogDao LOG = new LogDaoImpl();
	 //工具类
	 public static final Tools TOOLS = new Tools();
	 //横幅
	 public static final BannerDao BANNER = new BannerDaoImpl();
	 //图片
	 public static final Selling_ImageDao SID =new Selling_ImageDaoImpl();
	 //茶品类别
	 public static final Selling_typeDao  STYPE = new Selling_typeDaoImpl();
	 //计算接口
	 public static final SumDao SUMDAO = new SumDaoImpl();
	 //桌子状态接口
	 public static final Tea_HouseDao HOUSE = new Tea_HouseDaoImpl();
	 //角色接口
	 public static final RoleDao ROLE = new RoleDaoImpl();
	 //老卡接口
	 public static final Old_CardDao OLDDAO = new Old_CardDaoImpl();
	 
	 /**
	  * 会员卡类型接口
	  */
	 public static final Card_typeDao CARDTYPE = new Card_typeDaoImpl();
	 
	 public static final CardDao CARDDAO = new CardDaoImpl();
	 
	 public static final int PAGE_CARD_SHOW_NUMBER = 20;
	 
	 
	 
}
