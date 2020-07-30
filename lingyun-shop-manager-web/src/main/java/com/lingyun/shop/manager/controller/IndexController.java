package com.lingyun.shop.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/memberrank")
    public String memberrank() {
        return "memberrank";
    }

    @RequestMapping("/addmemberrank")
    public String addmemberrank() {
        return "addmemberrank";
    }

    @RequestMapping("/addmemberrank01")
    public String addmemberrank01() {
        return "addmemberrank01";
    }

    @RequestMapping("/member")
    public String member() {
        return "member";
    }
}
