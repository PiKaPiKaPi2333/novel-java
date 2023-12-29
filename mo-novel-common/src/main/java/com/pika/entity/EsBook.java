package com.pika.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import javax.validation.constraints.NotBlank;
import java.time.LocalDateTime;

/**
 * 存储在es的Book对象
 * @Author PIKAPIKAPI
 * @Date 2023/11/21
 */

@Document(indexName = "rice_novel_book")
@Data
@Builder
public class EsBook {
    @Id
    private Long id;

    @Field(type = FieldType.Text)
    private String title;

    @Field(type = FieldType.Text)
    private String authorName;

    @Field(type = FieldType.Long)
    private Long categoryId;

    @Field(type = FieldType.Text)
    private String introduction;

    @Field(type = FieldType.Text)
    private String cover;

    @Field(type = FieldType.Long)
    private Long createTime;

    @Field(type = FieldType.Long)
    private Long updateTime;

    @Field(type = FieldType.Keyword)
    private Byte channel;

    @Field(type = FieldType.Keyword)
    private Byte status;

    @Field(type = FieldType.Long)
    private Long wordCount;

    @Field(type = FieldType.Long)
    private Long visitCount;

    @Field(type = FieldType.Float)
    private Float score;

}
