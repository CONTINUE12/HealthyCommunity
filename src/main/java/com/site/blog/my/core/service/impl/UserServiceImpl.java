package com.site.blog.my.core.service.impl;

import com.site.blog.my.core.dao.UserMapper;
import com.site.blog.my.core.entity.User;
import com.site.blog.my.core.service.UserService;
import com.site.blog.my.core.util.PageQueryUtil;
import com.site.blog.my.core.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public PageResult getUsersPage(PageQueryUtil pageUtil) {
        List<User> userList = userMapper.findUserList(pageUtil);
        int total = userMapper.getTotalUsers(pageUtil);
        PageResult pageResult = new PageResult(userList, total, pageUtil.getLimit(), pageUtil.getPage());
        return pageResult;
    }

    @Override
    public User login(String userName, String password) {
        return userMapper.login(userName, password);
    }

    @Override
    public User getUserDetailById(Integer loginUserId) {
        return userMapper.selectByPrimaryKey(loginUserId);
    }

    @Override
    public Boolean updateName(Integer loginUserId, String loginUserName, String nickName) {
        User user = userMapper.selectByPrimaryKey(loginUserId);
        //当前用户非空才可以进行更改
        if (user != null) {
            //修改信息
            user.setLoginUserName(loginUserName);
            user.setNickName(nickName);
            if (userMapper.updateByPrimaryKeySelective(user) > 0) {
                //修改成功则返回true
                return true;
            }
        }
        return false;
    }

    @Override
    public Boolean updatePassword(Integer loginUserId, String originalPassword, String newPassword) {
        User user = userMapper.selectByPrimaryKey(loginUserId);
        //当前用户非空才可以进行更改
        if (user != null) {
            //比较原密码是否正确
            if (originalPassword.equals(user.getLoginPassword())) {
                //设置新密码并修改
                user.setLoginPassword(newPassword);
                if (userMapper.updateByPrimaryKeySelective(user) > 0) {
                    //修改成功则返回true
                    return true;
                }
            }
        }
        return false;
    }
}
