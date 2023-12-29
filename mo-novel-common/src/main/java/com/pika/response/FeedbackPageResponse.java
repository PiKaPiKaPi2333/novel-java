package com.pika.response;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.time.LocalDateTime;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/28
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class FeedbackPageResponse {

    private Long id;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private String userName;

    private String content;

    private Byte done;
}
