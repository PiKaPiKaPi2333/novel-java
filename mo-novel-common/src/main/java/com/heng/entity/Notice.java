package com.heng.entity;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;

@Data
@TableName("t_notice")
public class Notice {
	private Long id;
	private String title;
	private String content;
}
