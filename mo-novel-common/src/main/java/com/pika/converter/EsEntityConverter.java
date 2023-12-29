package com.pika.converter;

import com.pika.entity.Book;
import com.pika.entity.BookIndex;
import com.pika.entity.EsBook;
import com.pika.entity.EsContent;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author yuxin.qiu
 * @Date 2023/12/4
 */

public  class EsEntityConverter {


    /**
     * 将bookIndex转成EsContent
     * @param bookIndex
     */
    public static EsContent toEsContent(BookIndex bookIndex){
        return EsContent.builder()
                .id(bookIndex.getId())
                .title(bookIndex.getTitle())
                .content(bookIndex.getContent())
                .build();
    }

    /**
     * 将esBookList转成bookList
     */
    public static List<Book> toBookList(List<EsBook> esBookList){
        List<Book> bookList = new ArrayList<>();
        esBookList.forEach(esBook -> {
            Book book=Book.builder()
                    .id(esBook.getId())
                    .createTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(esBook.getCreateTime()), ZoneOffset.of("+8")))
                    .updateTime(LocalDateTime.ofInstant(Instant.ofEpochMilli(esBook.getUpdateTime()), ZoneOffset.of("+8")))
                    .title(esBook.getTitle())
                    .authorName(esBook.getAuthorName())
                    .channel(esBook.getChannel())
                    .categoryId(esBook.getCategoryId())
                    .introduction(esBook.getIntroduction())
                    .cover(esBook.getCover())
                    .status(esBook.getStatus())
                    .wordCount(esBook.getWordCount())
                    .visitCount(esBook.getVisitCount())
                    .score(esBook.getScore())
                    .build();
            bookList.add(book);
        });
        return bookList;
    }

    public static List<EsBook> toEsBookList(List<Book> bookList) {
        List<EsBook> esBookList=new ArrayList<>();
        bookList.forEach(book -> {
            EsBook esBook=EsBook.builder()
                    .id(book.getId())
                    .title(book.getTitle())
                    .authorName(book.getAuthorName())
                    .channel(book.getChannel())
                    .categoryId(book.getCategoryId())
                    .introduction(book.getIntroduction())
                    .cover(book.getCover())
                    .status(book.getStatus())
                    .wordCount(book.getWordCount())
                    .visitCount(book.getVisitCount())
                    .score(book.getScore())
                    .updateTime(book.getUpdateTime().toInstant(ZoneOffset.of("+8")).toEpochMilli())
                    .createTime(book.getCreateTime().toInstant(ZoneOffset.of("+8")).toEpochMilli())
                    .build();
            esBookList.add(esBook);
        });
        return esBookList;
    }

    public static List<EsContent> toEsContentList(List<BookIndex> bookIndexs) {
        List<EsContent> esContentList = new ArrayList<>();
        bookIndexs.forEach(bookIndex -> {
            EsContent esContent = EsContent.builder()
                    .id(bookIndex.getId())
                    .title(bookIndex.getTitle())
                    .content(bookIndex.getContent())
                    .build();
            esContentList.add(esContent);
        });
        return esContentList;
    }
}
