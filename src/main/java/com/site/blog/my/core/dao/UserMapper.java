package com.site.blog.my.core.dao;

import com.site.blog.my.core.entity.User;
import com.site.blog.my.core.util.PageQueryUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    List<User> findUserList(PageQueryUtil pageUtil);

    int getTotalUsers(PageQueryUtil pageUtil);

    User login(@Param("userName") String userName, @Param("password") String password);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

}
