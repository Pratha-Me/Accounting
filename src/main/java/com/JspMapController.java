package com;

import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@ComponentScan
public class JspMapController {
	
	@RequestMapping(value = "Logout", method = RequestMethod.GET)
	public String Logout() {
		return "Logout";
	}
	
	@RequestMapping(value = "/Login/{token}", method = RequestMethod.GET)
	public String index(HttpSession session, @PathVariable String token) {
		session.setAttribute("token", "Bearer " + token);
		return "redirect:../home";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value = "/Fiscal", method = RequestMethod.GET)
	public String Fiscal() {
		return "Fiscal";
	}
	
	@RequestMapping(value = "/DummyInfo", method = RequestMethod.GET)
	public String DummyInfo() {
		return "DummyInfo";
	}
}