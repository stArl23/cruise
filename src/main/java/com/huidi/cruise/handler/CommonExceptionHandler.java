package com.huidi.cruise.handler;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.enums.RecordEnums;
import com.huidi.cruise.exception.*;
import com.huidi.cruise.service.RecordService;
import com.huidi.cruise.utils.ResultVOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Date;


@ControllerAdvice
public class CommonExceptionHandler {
    @Autowired
    private RecordService recordService;

    @ExceptionHandler(value = BerthException.class)
    @ResponseBody
    public ResultVO HandlerException(BerthException ex) {
        return ResultVOUtils.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = ShipException.class)
    @ResponseBody
    public ResultVO HandlerException(ShipException ex) {
        return ResultVOUtils.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = UserException.class)
    @ResponseBody
    public ResultVO HandlerException(UserException ex) {
        return ResultVOUtils.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = RecordException.class)
    @ResponseBody
    public ResultVO HandlerException(RecordException ex) {
        if (RecordEnums.RECORD_ALREADY_PUBLISH.getId().equals(ex.getId())) {
            return ResultVOUtils.success(recordService.listRecords(new Date(System.currentTimeMillis()).toString()));
        }
        return ResultVOUtils.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = CommonException.class)
    @ResponseBody
    public ResultVO handlerException(CommonException ex){
        return ResultVOUtils.error(ex.getId(), ex.getMessage());
    }
}
