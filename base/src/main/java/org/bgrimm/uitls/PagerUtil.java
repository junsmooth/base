package org.bgrimm.uitls;

public class PagerUtil {
	public PagerUtil() {

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