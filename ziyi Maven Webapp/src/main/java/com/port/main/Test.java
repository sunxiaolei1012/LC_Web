package com.port.main;

import com.cyb.util.Tools;
import com.cyb.util.config;

public class Test {

	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		
		config.WHITE_CARD[config.WHITE_CARD.length-1] = new Tools().getBCC(config.WHITE_CARD).getBytes()[0];
		System.out.println(config.WHITE_CARD[config.WHITE_CARD.length-1]);
	}
}
