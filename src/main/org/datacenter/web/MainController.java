package org.datacenter.web;

import org.datacenter.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @Author: xiaolong
 * @Date: Created in 下午6:05 18-10-7
 * @Desription:
 */
@Controller
@RequestMapping("/datacenter")
public class MainController {

//    @Autowired
    private UserService userService;
    @RequestMapping("/home")
    public String getStart(Model model, HttpSession session) {
//        String userName = (String) session.getAttribute("userName");
//        if(null == userName) {
//            model.addAttribute("user",null);
//        } else {
//            User user = userService.queryByName(userName);
//            model.addAttribute("user",user);
//        }
        return "home";
    }

}
