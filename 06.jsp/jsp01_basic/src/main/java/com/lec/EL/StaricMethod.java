package com.lec.EL;

import java.text.DecimalFormat;

public class StaricMethod {
	
	public static String staticMethod(long num, String pattern) {
		DecimalFormat ptrn =  new DecimalFormat(pattern);
		return ptrn.format(num);
		
	}
}
