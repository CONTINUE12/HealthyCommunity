package com.site.blog.my.core;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author Sup
 * @email 468685628@qq.com
 * @date 2022.01.11
 */
@MapperScan("com.site.blog.my.core.dao")
@SpringBootApplication
public class RireeAppApplication { // 生成war包时使用extends SpringBootServletInitializer

    public static void main(String[] args) {
        SpringApplication.run(RireeAppApplication.class, args);
    }

    //生成war包时使用
    /*@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(RireeAppApplication.class);
    }*/

}
