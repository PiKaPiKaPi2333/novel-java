package com.pika.request.content;

import lombok.*;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/4
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class BookContentSaveRequest {
    private String content;

    private String title;
}
