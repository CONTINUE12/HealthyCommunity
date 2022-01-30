package com.site.blog.my.core.dao;

import com.site.blog.my.core.entity.BlogConfig;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogConfigMapper {

    List<BlogConfig> selectAll();

    BlogConfig selectByPrimaryKey(String configName);

    int updateByPrimaryKeySelective(BlogConfig record);
}
