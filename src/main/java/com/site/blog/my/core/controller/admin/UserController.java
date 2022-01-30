package com.site.blog.my.core.controller.admin;

import com.site.blog.my.core.entity.User;
import com.site.blog.my.core.service.UerRegisterService;
import com.site.blog.my.core.service.UserService;
import com.site.blog.my.core.util.PageQueryUtil;
import com.site.blog.my.core.util.Result;
import com.site.blog.my.core.util.ResultGenerator;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author Sup
 * @email 468685628@qq.com
 * @date 2022.01.12
 */
@Controller
@RequestMapping("/admin")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private UerRegisterService userRegisterService;

    @GetMapping({"/user_index"})
    public String userIndex(HttpServletRequest request) {
        request.setAttribute("path", "user_index");
        request.setAttribute("passiveTrainCount", 10);
        request.setAttribute("activeTrainCount", 2);
        return "admin/user_index";
    }

    @GetMapping({"/register"})
    public String register() {
        return "admin/register";
    }

    @PostMapping(value = "/register")
    @Transactional
    public String register(@RequestParam("userName") String userName,
                           @RequestParam("password") String password,
                           @RequestParam("nickName") String nickName,
                           HttpSession session) {
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            session.setAttribute("errorMsg", "用户名或密码不能为空");
            return "admin/register";
        }
        int result = userRegisterService.saveUser(userName, password, nickName);
        if (result == 1) {
            session.setAttribute("errorMsg", "注册成功");
            return "admin/login";
        } else {
            if(result == 2){
                session.setAttribute("errorMsg", "注册失败,账号已存在");
                return "admin/register";
            }
            if(result == 3){
                session.setAttribute("errorMsg", "注册失败,昵称已存在");
                return "admin/register";
            }
            return "admin/register";
        }
    }

    @GetMapping("/user_profile")
    public String userProfile(HttpServletRequest request) {
        Integer loginUserId = (int) request.getSession().getAttribute("loginUserId");
        User user = userService.getUserDetailById(loginUserId);
        if (user == null) {
            return "admin/login";
        }
        request.setAttribute("path", "user_profile");
        request.setAttribute("loginUserName", user.getLoginUserName());
        request.setAttribute("nickName", user.getNickName());
        return "admin/user_profile";
    }

    @PostMapping("/user_profile/name")
    @ResponseBody
    public String userNameUpdate(HttpServletRequest request, @RequestParam("loginUserName") String loginUserName,
                                 @RequestParam("nickName") String nickName) {
        if (StringUtils.isEmpty(loginUserName) || StringUtils.isEmpty(nickName)) {
            return "参数不能为空";
        }
        Integer loginUserId = (int) request.getSession().getAttribute("loginUserId");
        if (userService.updateName(loginUserId, loginUserName, nickName)) {
            return "success";
        } else {
            return "修改失败";
        }
    }

    @PostMapping("/user_profile/password")
    @ResponseBody
    public String userPasswordUpdate(HttpServletRequest request, @RequestParam("originalPassword") String originalPassword,
                                     @RequestParam("newPassword") String newPassword) {
        if (StringUtils.isEmpty(originalPassword) || StringUtils.isEmpty(newPassword)) {
            return "参数不能为空";
        }
        Integer loginUserId = (int) request.getSession().getAttribute("loginUserId");
        if (userService.updatePassword(loginUserId, originalPassword, newPassword)) {
            //修改成功后清空session中的数据，前端控制跳转至登录页
            request.getSession().removeAttribute("loginUserId");
            request.getSession().removeAttribute("loginUser");
            request.getSession().removeAttribute("errorMsg");
            return "success";
        } else {
            return "修改失败";
        }
    }

    @GetMapping("/users/list")
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            return ResultGenerator.genFailResult("参数异常！");
        }
        PageQueryUtil pageUtil = new PageQueryUtil(params);
        return ResultGenerator.genSuccessResult(userService.getUsersPage(pageUtil));
    }

    @GetMapping("/users")
    public String list(HttpServletRequest request) {
        request.setAttribute("path", "users");
        return "admin/user";
    }
}
