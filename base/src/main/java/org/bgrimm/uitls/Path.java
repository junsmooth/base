package org.bgrimm.uitls;
public class Path {
	private String d;
	private String fillrule;
	private String fill;
	private String id;
	private String strokewidth;
	private String stroke;

	public String getD() {
		return d;
	}

	public void setD(String d) {
		this.d = d;
	}

	public String getFillrule() {
		return fillrule;
	}

	public void setFillrule(String fillrule) {
		this.fillrule = fillrule;
	}

	public String getFill() {
		return fill;
	}

	public void setFill(String fill) {
		this.fill = fill;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStrokewidth() {
		return strokewidth;
	}

	public void setStrokewidth(String strokewidth) {
		this.strokewidth = strokewidth;
	}

	public String getStroke() {
		return stroke;
	}

	public void setStroke(String stroke) {
		this.stroke = stroke;
	}

	public static void main(String[] args) {
		Path p = new Path();
		p.setD("M299.717 80.245C300.345 80.426 302.551 81.55 303.801 83.2C303.801 83.2 310.601 94 305.401 75.6C305.401 75.6 296.201 46.8 305.001 58C305.001 58 311.001 65.2 307.801 51.6C303.936 35.173 301.401 28.8 301.401 28.8C301.401 28.8 313.001 33.6 286.201 -6L295.001 -2.4C295.001 -2.4 275.401 -42 253.801 -47.2L245.801 -53.2C245.801 -53.2 284.201 -91.2 271.401 -128C271.401 -128 264.601 -133.2 255.001 -124C255.001 -124 248.601 -119.2 242.601 -120.8C242.601 -120.8 211.801 -119.6 209.801 -119.6C207.801 -119.6 173.001 -156.8 107.401 -139.2C107.401 -139.2 102.201 -137.2 97.801 -138.4C97.801 -138.4 79.4 -154.4 30.6 -131.6C30.6 -131.6 20.6 -129.6 19 -129.6C17.4 -129.6 14.6 -129.6 6.6 -123.2C-1.4 -116.8 -1.8 -116 -3.8 -114.4C-3.8 -114.4 -20.2 -103.2 -25 -102.4C-25 -102.4 -36.6 -96 -41 -86L-44.6 -84.8C-44.6 -84.8 -46.2 -77.6 -46.6 -76.4C-46.6 -76.4 -51.4 -72.8 -52.2 -67.2C-52.2 -67.2 -61 -61.2 -60.6 -56.8C-60.6 -56.8 -62.2 -51.6 -63 -46.8C-63 -46.8 -70.2 -42 -69.4 -39.2C-69.4 -39.2 -77 -25.2 -75.8 -18.4C-75.8 -18.4 -82.2 -18.8 -85 -16.4C-85 -16.4 -85.8 -11.6 -87.4 -11.2C-87.4 -11.2 -90.2 -10 -87.8 -6C-87.8 -6 -89.4 -3.2 -89.8 -1.6C-89.8 -1.6 -89 1.2 -93.4 6.8C-93.4 6.8 -99.8 25.6 -97.8 30.8C-97.8 30.8 -97.4 35.6 -100.2 37.2C-100.2 37.2 -103.8 36.8 -95.4 48.8C-95.4 48.8 -94.6 50 -97.8 52.4C-97.8 52.4 -115 56 -117.4 72.4C-117.4 72.4 -131 87.2 -131 92.4C-131 94.705 -130.729 97.852 -130.03 102.465C-130.03 102.465 -130.6 110.801 -103 111.601C-75.4 112.401 299.717 80.245 299.717 80.245z");
		p.setStroke("#000");
		p.setFill("#cc7226");
		System.out.println(p);

	}

	@Override
	public String toString() {
		String result = "{type:\"path\"," + "path:\"" + getD() + "\",";
		if (!"".equals(getFill())) {
			result += "fill:\"" + getFill() + "\",";
		}
		if (getStroke()!=null&&!"".equals(getStroke())) {
			result += "stroke:\"" + getStroke() + "\",";
		}
		if (getStrokewidth()!=null&&!"".equals(getStrokewidth())) {
			result += "\"stroke-width\":" + getStrokewidth() + ",";
		}
		result=result.substring(0, result.lastIndexOf(','));
		result+="}";
		return result;
	}

}
