/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import model.DB;
import model.Token;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author pratha
 */
@Controller
@ComponentScan
public class LoginController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	@ResponseBody
	public Object login(@RequestParam String loginId, @RequestParam String password) {
		Map map = new HashMap();
		try {

			String sql = "SELECT USER AS userCode, PASS AS dbPassword, MD5('" + password + "') AS userPass"
					+ " " + "FROM users WHERE USER ='" + loginId + "';";

			DB db = new DB();
			List list = db.getRecord(sql);

			if (list.isEmpty()) {
				map.put("error", "Invalid login id");
				return map;
			}

			map = (Map) list.get(0);

			String userCode = map.get("userCode").toString();
			String dbPassword = map.get("dbPassword").toString();
			String userPass = map.get("userPass").toString();

			if (dbPassword.equalsIgnoreCase(userPass)) {
				map = new HashMap();
				map.put("userCode", userCode);
				map.put("msg", "Success");

				Token td = new Token();
				String token = td.get(userCode, userCode, "ADM");

				map.put("token", token);
				return map;
			}
			map.put("error", "invalid CREDENTIALS");
		} catch (Exception e) {
			System.out.println(e);
		}
		return map;
	}
}
