package org.datacenter.web;

import org.datacenter.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

/**
 * @Author: xiaolong
 * @Date: Created in 下午4:59 18-10-8
 * @Desription:
 */
@Controller
public class AccountManager {

    @Autowired
    private UserService userService;
    Logger logger = LoggerFactory.getLogger(this.getClass());
    @RequestMapping(value = "/accounts/login",method = RequestMethod.POST)
    public String Login(@RequestParam("account") String account,
                        @RequestParam("password") String password,
                        Model model, HttpSession session) {
        logger.info("account = {},password = {}",account,password);
        boolean checkAccount = userService.queryByNamePassword(account, password);

        model.addAttribute("userName",account);
        session.setAttribute("userName",account);
        session.setMaxInactiveInterval(60);
        return checkAccount ? "success/login_success" : "error/login_error";
    }
    @RequestMapping("/accounts/loginout")
    public String UnLogin(HttpSession session) {
        session.setAttribute("userName",null);
        return "home";
    }

}
