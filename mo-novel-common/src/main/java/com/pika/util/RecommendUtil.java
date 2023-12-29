package com.pika.util;

import com.pika.entity.User;
import com.pika.entity.Book;
import com.pika.mapper.UserMapper;
import com.pika.service.BookHistoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * @Author PIKAPIKAPI
 * @Date 2023/11/21
 */
@Slf4j
@Component
public class RecommendUtil {
    /**
     * 在给定userId的情况下，计算其他用户和它的距离并排序
     * @param userId
     * @return
     */
    @Resource
    private UserMapper userMapper;

    @Resource
    private BookHistoryService bookHistoryService;

    private Map<Double, Long> computeNearestNeighbor(Long userId) {
        Map<Double, Long> distances = new TreeMap<>();
        User u1=userMapper.selectById(userId);

        List<User> users = userMapper.selectList(null);
        for (int i = 0; i < users.size(); i++) {
            User u2 = users.get(i);
            if (u2.getId() !=userId) {
                double distance = calculateDistance(bookHistoryService.listUserReadHistory(u2.getId()), bookHistoryService.listUserReadHistory(u1.getId()));
                distances.put(distance, u2.getId());
            }

        }
        return distances;
    }


    /**
     * 计算2个小说列表的相似度
     */
    public static double calculateDistance(List<Book> bookList1, List<Book> bookList2) {
        Set set1 = new HashSet<>(bookList1);
        Set set2 = new HashSet<>(bookList2);

        // 计算交集
        Set intersection = new HashSet<>(set1);
        intersection.retainAll(set2);

        // 计算并集
        Set<Book> union = new HashSet<>(set1);
        union.addAll(set2);

        // 计算相似度
        double similarity = (double) intersection.size() / union.size();

        return 1 - similarity; // 这里返回的是距离，所以是1-相似度
    }


    public List<Book> recommend(Long userId) {
        //找到最近邻
        Map<Double, Long> distances = computeNearestNeighbor(userId);
        Long nearestUserId = distances.values().iterator().next();

        //最近邻看过的小说
        List<Book> nearestUserReadBooks = bookHistoryService.listUserReadHistory(nearestUserId);
        //该用户看过的小说
        List<Book> userReadBooks = bookHistoryService.listUserReadHistory(userId);

        //将最近邻看过但是用户没看过的小说添加到推荐列表
        List<Book> recommendationBooks = new ArrayList<>();
        for (Book book :  nearestUserReadBooks) {
            if (!userReadBooks.contains(book)) {
                recommendationBooks.add(book);
            }
        }
        return recommendationBooks;
    }

}
