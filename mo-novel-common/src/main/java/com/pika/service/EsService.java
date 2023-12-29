package com.pika.service;

import com.pika.entity.EsBook;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/22
 */

public interface EsService {
    boolean createIndex(Class<?> classType);

    <T> Iterable<T> save(Iterable<T> entities);

}
