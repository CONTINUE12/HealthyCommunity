package com.site.blog.my.core.service;

import com.site.blog.my.core.entity.User;
import com.site.blog.my.core.util.PageQueryUtil;
import com.site.blog.my.core.util.PageResult;

public interface UserService {

    PageResult getUsersPage(PageQueryUtil pageUtil);

    User login(String userName, String password);

    User getUserDetailById(Integer loginUserId);

    Boolean updateName(Integer loginUserId, String loginUserName, String nickName);

    Boolean updatePassword(Integer loginUserId, String originalPassword, String newPassword);
}
