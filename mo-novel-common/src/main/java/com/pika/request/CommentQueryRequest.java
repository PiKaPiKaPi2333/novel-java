package com.pika.request;

import com.pika.common.BaseQuery;

import lombok.Data;

@Data
public class CommentQueryRequest extends BaseQuery {
	private Long resourceId;
}
