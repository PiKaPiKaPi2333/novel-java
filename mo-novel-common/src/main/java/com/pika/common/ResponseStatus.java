package com.pika.common;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 请求响应的消息
 * @author PIKAPIKAPI
 * @since 2023-12-29
 */
@AllArgsConstructor
@Getter
public enum ResponseStatus {

    SUCCESS("success"),
    ERROR("未知异常"),

    // 评论相关错误
    HAS_COMMENT("已经评价过");


    private Integer code;
    private String msg;

    ResponseStatus(String msg)
    {
        this.msg = msg;
    }
}
