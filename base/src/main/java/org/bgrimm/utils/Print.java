package org.bgrimm.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.commons.lang3.StringUtils;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class Print extends DefaultHandler {
	private List<Path> list = new ArrayList<Path>();

	public static String getSVGData() throws ParserConfigurationException,
			SAXException, IOException {
		SAXParserFactory factory = SAXParserFactory.newInstance();
		SAXParser parser = factory.newSAXParser();
		Print handler = new Print();
		InputStream input = handler.getClass().getClassLoader()
				.getResourceAsStream("svg.xml");
		parser.parse(input, handler);
		StringBuffer sb = new StringBuffer();
		for (Path p : handler.getList()) {
			sb.append(p + ",\n");
		}
		sb.substring(0, sb.lastIndexOf(",") - 1);
		return sb.toString();

	}

	public static List getSVGList() throws Exception, SAXException {
		SAXParserFactory factory = SAXParserFactory.newInstance();
		SAXParser parser = factory.newSAXParser();
		Print handler = new Print();
		InputStream input = handler.getClass().getClassLoader()
				.getResourceAsStream("svg.xml");
		parser.parse(input, handler);
		List list = new ArrayList();
		for (Path p : handler.getList()) {
			Map m = new HashMap();
			m.put("type", "path");
			m.put("path", p.getD());
			m.put("fill", p.getFill());
			m.put("stroke", p.getStroke());
			m.put("stroke-width", p.getStrokewidth());
			list.add(m);

		}
		return list;

	}

	public static void main(String[] args) throws Exception {
		SAXParserFactory factory = SAXParserFactory.newInstance();
		SAXParser parser = factory.newSAXParser();
		Print handler = new Print();
		InputStream input = handler.getClass().getClassLoader()
				.getResourceAsStream("svg.xml");
		parser.parse(input, handler);
		File f = new File("pathsvg");
		FileOutputStream fout = new FileOutputStream(f);
		PrintWriter pw = new PrintWriter(fout);
		for (Path p : handler.getList()) {
			pw.write(p + ",\n");
		}
		pw.close();
	}

	public List<Path> getList() {
		return list;
	}

	public void setList(List<Path> list) {
		this.list = list;
	}

	@Override
	public void startElement(String uri, String localName, String qName,
			Attributes attributes) throws SAXException {
		if (qName.equals("path")) {
			Path p = new Path();
			p.setD(attributes.getValue("d"));
			p.setFill(attributes.getValue("fill"));
			p.setStroke(attributes.getValue("stroke"));
			p.setStrokewidth(attributes.getValue("stroke-width"));
			String style = attributes.getValue("style");
			if (style != null && !"".equals(style)) {
				String[] strs = StringUtils.split(style, ";");
				for (String str : strs) {
					if (str.contains("fill:")) {
						p.setFill(str.substring(str.indexOf(':') + 1));
					}
					if (str.contains("stroke")) {
						p.setStroke(str.substring(str.indexOf(':') + 1));
					}

					if (str.contains("stroke-width")) {
						p.setStrokewidth(str.substring(str.indexOf(':') + 1));
					}
				}

			}

			list.add(p);
		}
	}

	@Override
	public void endElement(String uri, String localName, String qName)
			throws SAXException {
	}

}
