package com.pika.vo;

import com.pika.common.BaseQuery;
import lombok.Data;

/**
 * @author PIKAPIKAPI
 * @since 2023-05-05
 */
@Data
public class UserQueryVo extends BaseQuery {
    private String username;
    private String mobile;
    private String email;
    private Byte sex;
    private Long roleId;
}
