package com.pika.response;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/21
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class CommentPageResponse {

    private Long id;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private Byte resourceType;

    private Long resourceId;

    private String bookName;

    private String content;

    private String userName;

    private String userAvatar;

    private Byte star;
}
