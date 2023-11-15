package com.pika.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 轮播图
 * @Author PIKAPIKAPI
 * @Date 2023/11/15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("t_carousel")
@ApiModel(value="Carousel对象", description="轮播图信息表")
public class Carousel implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "修改时间")
    private LocalDateTime updateTime;

    @ApiModelProperty(value = "轮播图图片")
    private String img;

    @ApiModelProperty(value = "跳转地址")
    private String url;


}
