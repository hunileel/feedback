package com.hunilee.web;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSONObject;
import com.hunilee.bean.User;
import com.hunilee.handle.UserService;

/**
 * 管理人员的Controller层
 * @author hunilee
 * @date 19-3-21
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    /**
     * 注入service
     */
    @Autowired
    private UserService userService;


    /**
     * 跳转到系统登录首页
     */
    @RequestMapping(value = "/index")
    public String index() {
        return "index";
    }

    /**
     * 登录功能
     */
    @RequestMapping(value = "/login")
    public String login(@RequestParam String device, @RequestParam String mac, Model model, HttpSession session) {
        User user = userService.login(device);
        if (user != null) {
            if (user.getDevice().equals(mac)) {
                session.setAttribute("name", user.getDevice());
                session.setAttribute("id", user.getUser_id());
                return "redirect:/feedback/toText";
            } else {
                model.addAttribute("message", "用户名或密码错误");
                return "view/login/info";
            }
        } else {
            model.addAttribute("message", "登录失败");
            return "view/login/info";
        }
    }

    /**
     * 注册功能
     */
    @RequestMapping(value = "/register")
    public String register(User user, HttpSession session) {
    	userService.insert(user);
        session.setAttribute("name", user.getDevice());
        return "view/page";
    }

    /**
     * 登出登录的功能
     */
    @RequestMapping(value = "/outLogin")
    public String outLogin(HttpSession session) {
        session.invalidate();
        return "index";
    }

    /**
     * 跳转到page首页
     */
    @RequestMapping(value = "/page")
    public String page() {
        return "view/page";
    }

    /**
     * 根据用户名查询
     */
    @ResponseBody
    @RequestMapping(value = "/findByName")
    public String findByName(@RequestBody User user) {
        User info = userService.findByName(user.getDevice());
        return JSONObject.toJSONString(info);
    }
}
