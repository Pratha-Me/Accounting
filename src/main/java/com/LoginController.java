/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.HashMap;
import java.util.Map;
import java.util.List;
import javax.servlet.http.HttpSession;
import model.DB;
import model.Token;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping(value = "Logout", method = RequestMethod.GET)
    public String Logout() {
        return "Logout";
    }

    @RequestMapping(value = "/Login/Verify", method = RequestMethod.GET)
    public String Login() {
        return "/login/Verify";
    }
	
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "home";
    }

    @RequestMapping(value = "/Login/{token}", method = RequestMethod.GET)
    public String index(HttpSession session, @PathVariable String token) {
        session.setAttribute("token", "Bearer " + token);
        return "home";
    }

    @RequestMapping(value = "/Login", method = RequestMethod.GET)
    @ResponseBody
    public Object login(@RequestParam String loginId, @RequestParam String password) {
        Map map = new HashMap();
        try {
            
            String sql = "SELECT user AS userCode, pass AS dbPassword FROM test WHERE user ='" + loginId + "'";
            
            DB db = new DB();
            List list = db.getRecord(sql);
	    /*	    for(int i = 0; i < list.size(); i++){
	    System.out.println(list.get(i));
	    }
	    */
		
	    if (list.isEmpty()) {
                map.put("error", "Invalid login id");
                return map;
            }

            map = (Map) list.get(0);
//	    map.forEach((key, value) -> System.out.println(key + " : " + value));

            String userCode = map.get("userCode").toString();
            String dbPassword = map.get("dbPassword").toString();
//            System.out.println(dbPassword +" "+ userPassword +" "+ userCode);

            if (dbPassword.equalsIgnoreCase(password)) {
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
