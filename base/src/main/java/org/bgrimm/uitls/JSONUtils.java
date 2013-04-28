package org.bgrimm.uitls;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class JSONUtils {
	/**
	 * Create Simple JSON of format
	 * 
	 * <pre>
	 * { "success":true, // note this is Boolean, not string
	 *   "msg":"Consignment updated" }
	 * </pre>
	 * 
	 * 
	 * @param b
	 * @param msg
	 * @return
	 * @throws JsonGenerationException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	public static String simpleJSON(boolean b, String msg)
			throws JsonGenerationException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper();
		Map m = new HashMap();
		m.put("success", b);
		m.put("msg", msg);
		return mapper.writeValueAsString(m);

	}
	public static Map resultJsonMap(Object obj,boolean b){
		Map m=new HashMap();
		m.put("success", b);
		m.put("data", obj);
		return m;
	}
}
