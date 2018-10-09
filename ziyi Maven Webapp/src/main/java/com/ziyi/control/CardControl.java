package com.ziyi.control;

import com.cyb.util.Common;
import com.cyb.util.config;
import com.opensymphony.xwork2.ActionSupport;

public class CardControl extends ActionSupport{

	public 	String chen()
	{
//		System.out.println("-------------");
////		config.READ_CARD.delete(0, config.READ_CARD.length());
//		System.out.println(Common.TOOLS.read_card());
////		config.READ_CARD.delete(0, config.READ_CARD.length());
		System.out.println("-------+------");
		
		Common.TOOLS.white_card();
		return "json";
	}
	
	public void yu()
	{
		try {
			Common.TOOLS.return_object(Common.TOOLS.read_card_two());
			config.BOOL=false;
			config.READ_CARD.clear();
		} catch (InterruptedException e) {
			Common.TOOLS.return_object("error");
		}
	}
}
