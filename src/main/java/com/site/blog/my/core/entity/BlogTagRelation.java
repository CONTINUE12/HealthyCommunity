package com.site.blog.my.core.entity;

import lombok.Data;

import java.util.Date;

@Data
public class BlogTagRelation {

    private Long relationId;

    private Long blogId;

    private Integer tagId;

    private Date createTime;
}
