package org.bgrimm.uitls;

public class JsonMsg {
	private boolean success = true;
	private String msg = "操作成功";
	private Object obj = null;
	private static JsonMsg SUCCESS=new JsonMsg();
	public boolean isSuccess() {
		return success;
	}
	public static JsonMsg simpleSuccessJson(){
		return SUCCESS;
	}
	public static JsonMsg createJsonMsg(boolean success,String msg,Object obj){
		JsonMsg jm=new JsonMsg();
		jm.setSuccess(success);
		jm.setMsg(msg);
		jm.setObj(obj);
		return jm;
	}
	
	public JsonMsg() {
		
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
}
