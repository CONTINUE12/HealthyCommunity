package com.site.blog.my.core.entity;

import lombok.Data;

import java.util.Date;

@Data
public class BlogConfig {

    private String configName;

    private String configValue;

    private Date createTime;

    private Date updateTime;
}
