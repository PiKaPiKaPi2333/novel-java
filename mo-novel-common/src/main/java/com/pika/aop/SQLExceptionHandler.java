package com.pika.aop;

import com.pika.common.ResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 * @author PIKAPIKAPI
 * @since 2023-05-05
 */
@ControllerAdvice
@ResponseBody
@Slf4j
public class SQLExceptionHandler {
    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public ResponseDTO SQLIntegrityConstraintViolationExceptionHandler(SQLIntegrityConstraintViolationException e)
    {
        e.printStackTrace();
        return ResponseDTO.fail("该条目已存在");
    }

    @ExceptionHandler(SQLException.class)
    public ResponseDTO SQLExceptionHandler(SQLException e)
    {
        e.printStackTrace();
        return ResponseDTO.fail("SQL操作失败");
    }
}
