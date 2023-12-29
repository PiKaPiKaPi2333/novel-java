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
public class BookContentUpdateRequest {

    private Long id;

    private String content;

    private String title;
}
