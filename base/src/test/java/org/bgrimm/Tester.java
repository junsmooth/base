package org.bgrimm;

import org.apache.commons.lang3.StringUtils;

public class Tester {

	
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		String str="/";
		String[] urlsplits=StringUtils.split(str,"/");
		System.out.println(urlsplits.length);
	}

}
