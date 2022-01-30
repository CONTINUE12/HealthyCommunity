package com.site.blog.my.core.dao;

import com.site.blog.my.core.entity.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRegisterMapper {

    int insertUser(User user);

    int selectByUserName(String userName);

    int selectByNickName(String nickName);

}
