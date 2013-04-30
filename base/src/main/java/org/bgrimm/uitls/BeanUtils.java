package org.bgrimm.uitls;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Transfer pojo to HashMap<br>
 * pojo field must be camelcased<br>
 * and the field to populate to map must have getMethod
 * 
 * @author Administrator
 * 
 */
public class BeanUtils {
	public static Map pojo2Map(Object obj) {
		Map map = null;
		try {
			Class c = obj.getClass();
			map = transferCls(obj, c, map);
		} catch (Throwable e) {
			System.err.println(e);
		}
		return map;
	}

	private static Map transferCls(Object obj, Class c, Map map)
			throws Exception, IllegalAccessException, InvocationTargetException {
		if (map == null) {
			map = new HashMap();
		}
		Class parent = c.getSuperclass();
		if (parent != Object.class) {
			transferCls(obj, parent, map);
		}
		Method m[] = c.getDeclaredMethods();
		for (int i = 0; i < m.length; i++) {
			if (m[i].getName().indexOf("get") == 0) {
				String name = m[i].getName();
				StringBuffer sb = new StringBuffer();
				sb.append(name.substring(3, 4).toLowerCase());
				sb.append(name.substring(4));
				map.put(sb.toString(), m[i].invoke(obj, new Object[0]));
			}
		}
		return map;
	}
}