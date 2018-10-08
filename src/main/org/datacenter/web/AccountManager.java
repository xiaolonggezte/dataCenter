package org.datacenter.web;

import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author: xiaolong
 * @Date: Created in 下午4:59 18-10-8
 * @Desription:
 */
@RequestMapping("/accounts")
public class AccountManager {

    @RequestMapping("/login")
    public String Login(HttpSession session) {
        session.setAttribute("userName","admin");
        return "home";
    }
    @RequestMapping("/loginout")
    public String UnLogin(HttpSession session) {

        return "home";
    }

}
