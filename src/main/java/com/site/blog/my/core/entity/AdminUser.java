package com.site.blog.my.core.entity;

import lombok.Data;

@Data
public class AdminUser {

    private Integer adminUserId;
    private String loginUserName;
    private String loginPassword;
    private String nickName;
    private Byte locked;

}
