package com.ziyi.control;

import com.opensymphony.xwork2.ActionSupport;
import com.ziyi.control.cmd.CardControl;
import com.ziyi.control.cmd.CardTypeControl;
import com.ziyi.control.cmd.SellingTypeControl;
import com.ziyi.control.cmd.User_Control;
/**
 * 处理后台admin功能
 * @author 陈玉博
 * @date 2018年9月16日下午2:16:24
 */
public class cmdServlet extends ActionSupport{

	
	private String name;
	private String password;
	
	private String id;
	private String userrole;
	
	private String cardtype;
	private String rebate;
	
	
	private String number ; 
	private String ctid ; 
	private String phone;
	private String address;
	private String idcard ; 
	private String price ; 
	private String spend ;
	private String remain;
	
	private String type_name;
	
	/**
	 * 添加用户
	 * @return
	 */
	public String add_user()
	{
		return new User_Control().insert(name, password);
		
	}
	/**
	 * 获取修改用户信息
	 * @return
	 */
	public String update_user()
	{
		System.out.println(id);
		return new User_Control().update_select(id);
	}
	/**
	 * 修改用户信息
	 * @return
	 */
	public String xiu_user()
	{
		return new User_Control().xiu_user(id,name,password ,userrole);
	}
	/**
	 * 删除用户信息
	 * @return
	 */
	public String del_user()
	{
		return new User_Control().del_user(id);
	}
	
	
	
	//会员卡类型
	/**
	 * 添加会员卡
	 * @return
	 */
	public String add_cardtype()
	{
		return new CardTypeControl().add_card_type(cardtype, rebate);
	}
	/**
	 * 获取要修改的会员卡信息
	 * @return
	 */
	public String update_cardtype()
	{
		return new CardTypeControl().get_cardtype_id(id);
	}
	/**
	 * 修改会员卡类型信息
	 * @return
	 */
	public String xiu_cardtype()
	{
		return new CardTypeControl().xiu_cardtype(id , cardtype , rebate);
	}
	/**
	 * 删除会员卡类型
	 * @return
	 */
	public String del_cardtype()
	{
		return new CardTypeControl().del_cardtype(id);
	}
	
	
	//会员卡信息
	/**
	 * 查询要更新的会员卡信息
	 * @return
	 */
	public String update_card()
	{
		
		return new CardControl().get_card_id(id);
	}
	/**
	 * 修改会员卡信息
	 * @return
	 */
	public String xiu_card()
	{
		
		return new CardControl().xiu_card(id, number, ctid, name, phone, address, idcard, price, spend, remain);
		
	}
	/**
	 * 删除会员卡信息
	 * @return
	 */
	public String del_card()
	{
		return new CardControl().del_card(id);
	}
	
	
	//商品类型
	/**
	 * 添加商品类型
	 * @return
	 */
	public String add_sellingtype()
	{
		return new SellingTypeControl().add_selling_type(type_name);
	}
	/**
	 * 删除商品类型
	 * @return
	 */
	public String del_sellingtype()
	{
		return new SellingTypeControl().del_selling_type(id);
	}
	/**
	 * 获取要修改的类型信息
	 * @return
	 */
	public String update_sellingtype()
	{
		return new SellingTypeControl().get_selling_type(id);
	}
	/**
	 * 修改类别信息
	 * @return
	 */
	public String xiu_sellingtype()
	{
		return new SellingTypeControl().xiu_selling_type(id, type_name);
	}
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserrole() {
		return userrole;
	}
	public void setUserrole(String userrole) {
		this.userrole = userrole;
	}
	public String getCardtype() {
		return cardtype;
	}
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	public String getRebate() {
		return rebate;
	}
	public void setRebate(String rebate) {
		this.rebate = rebate;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getCtid() {
		return ctid;
	}
	public void setCtid(String ctid) {
		this.ctid = ctid;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSpend() {
		return spend;
	}
	public void setSpend(String spend) {
		this.spend = spend;
	}
	public String getRemain() {
		return remain;
	}
	public void setRemain(String remain) {
		this.remain = remain;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	
	
	
	
	
}

