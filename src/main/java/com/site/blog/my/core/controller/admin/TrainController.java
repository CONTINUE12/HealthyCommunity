package com.site.blog.my.core.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/train")
public class TrainController {

    @GetMapping("/active")
    public String active(HttpServletRequest request){
        request.setAttribute("path", "activeTrain");
        return "admin/user_activeTrain";
    }

    @GetMapping("/passive")
    public String passive(HttpServletRequest request){
        request.setAttribute("path", "passiveTrain");
        return "admin/user_passiveTrain";
    }

}
