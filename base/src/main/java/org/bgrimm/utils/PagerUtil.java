package org.bgrimm.utils;

import org.apache.commons.lang3.StringUtils;

public class PagerUtil {
	public PagerUtil() {

	}

	// 将字符串转换为Integer类型的数组
	public static Integer[] strToArray(String str) {
		if (StringUtils.isNotEmpty(str)) {
			String[] s = str.split(",");
			Integer[] arr = new Integer[s.length];
			for (int i = 0; i < s.length; i++) {
				arr[i] = Integer.parseInt(s[i]);
			}
			return arr;
		}
		return null;
	}

	public static int getOffset(int rowCounts, int curPageNO, int pageSize) {
		int offset = 0;
		try {
			if (curPageNO > (int) Math.ceil((double) rowCounts / pageSize))
				curPageNO = (int) Math.ceil((double) rowCounts / pageSize);
			// 得到第几页
			if (curPageNO <= 1)
				curPageNO = 1;
			// 得到offset
			offset = (curPageNO - 1) * pageSize;
		} catch (Exception e) {
			System.out.println("getOffset出错!");
		}
		return offset;
	}

	public static int getcurPageNo(int rowCounts, int curPageNO, int pageSize) {
		try {
			// 得到第几页
			if (curPageNO > (int) Math.ceil((double) rowCounts / pageSize))
				curPageNO = (int) Math.ceil((double) rowCounts / pageSize);
			if (curPageNO <= 1)
				curPageNO = 1;
		} catch (Exception e) {
			System.out.println("getOffset出错!");
		}
		return curPageNO;
	}
}