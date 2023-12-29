package com.pika.service.impl;

import com.pika.entity.EsBook;
import com.pika.service.EsService;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/22
 */

@Service
public class EsServiceImpl implements EsService {

    @Resource
    private ElasticsearchRestTemplate elasticsearchRestTemplate;
    @Override
    public boolean createIndex(Class<?> classType) {
        if (elasticsearchRestTemplate.indexExists(classType))
            return true;
        boolean index = elasticsearchRestTemplate.createIndex(classType);
        boolean mapping = elasticsearchRestTemplate.putMapping(classType);
        return index && mapping;

    }

    @Override
    public <T> Iterable<T> save(Iterable<T> entities) {
        return elasticsearchRestTemplate.save(entities);
    }


}
