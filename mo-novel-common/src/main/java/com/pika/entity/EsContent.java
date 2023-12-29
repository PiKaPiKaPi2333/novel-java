package com.pika.entity;

import lombok.Builder;
import lombok.Data;
import org.elasticsearch.action.admin.indices.template.post.SimulateIndexTemplateRequest;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

/**
 * 存储在es的BookContent对象
 * @Author PIKAPIKAPI
 * @Date 2023/11/21
 */

@Document(indexName = "rice_novel_content")
@Data
@Builder
public class EsContent {
    @Id
    private Long id;

    @Field(type = FieldType.Keyword)
    private String title;

    @Field(type = FieldType.Text)
    private String content;


}
