package com.site.blog.my.core.util;

import lombok.Data;

import java.io.Serializable;

/**
 * 返回值工具类
 *
 * @author Sup
 * @email 468685628@qq.com
 * @date 2022.01.11
 */
@Data
public class Result<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    private int resultCode;
    private String message;
    private T data;

    public Result() {
    }

    public Result(int resultCode, String message) {
        this.resultCode = resultCode;
        this.message = message;
    }
}
