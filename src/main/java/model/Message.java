/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Map;
import java.util.List;

/**
 *
 * @author pratha
 */
public class Message {

	public Map map;
	public List list;
	public DB db = new DB();

	public String[] jsonDataToStringArray(String jsonData) {
		String val[] = new String[2];
		int arrayStart = jsonData.indexOf("[");
		int arrayEnd = jsonData.indexOf("]") + 1;
		int len = jsonData.length();
		String array = jsonData.substring(arrayStart, arrayEnd);
		String jsconStart = jsonData.substring(0, arrayStart);
		String jsconEnd = jsonData.substring(arrayEnd, len);
		val[1] = (array);
		val[0] = (jsconStart + "0" + jsconEnd);
		return val;
	}
		
	public static String exceptionMsg(Exception e) {
		try {
			return e.getCause().getMessage();
		} catch (Exception ex) {
		}
		return e.getMessage();
	}

	public String respondWithError(String message) {
		return "{\"error\":{\"message\":\"" + message + "\"}}";
	}

	public String respondWithMessage(String message) {
		return "{\"message\":\"" + message + "\"}";
	}

}