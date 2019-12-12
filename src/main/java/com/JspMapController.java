package com;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@ComponentScan
public class JspMapController {

      @RequestMapping(value = "/DummyInfo", method = RequestMethod.GET)
      public String DummyInfo() {
            return "DummyInfo";
      }
}