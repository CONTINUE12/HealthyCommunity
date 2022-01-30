package com.site.blog.my.core.service.impl;

import com.site.blog.my.core.dao.UserRegisterMapper;
import com.site.blog.my.core.entity.User;
import com.site.blog.my.core.service.UerRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRegisterServiceImpl implements UerRegisterService {

    @Autowired
    private UserRegisterMapper userRegisterMapper;


    @Override
    public int saveUser(String userName, String password, String nickName) {
        if(userRegisterMapper.selectByUserName(userName) > 0){
            return 2;
        }
        if(userRegisterMapper.selectByNickName(nickName) > 0){
            return 3;
        }
        User user = new User();
        user.setLoginUserName(userName);
        user.setLoginPassword(password);
        user.setNickName(nickName);
        return userRegisterMapper.insertUser(user);
    }
}
