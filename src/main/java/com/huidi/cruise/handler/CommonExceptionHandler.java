package com.huidi.cruise.handler;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.exception.*;
import com.huidi.cruise.utils.ResultVOUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


@ControllerAdvice
public class CommonExceptionHandler {

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
        return ResultVOUtils.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = CommonException.class)
    @ResponseBody
    public ResultVO handlerException(CommonException ex){
        return ResultVOUtils.error(ex.getId(), ex.getMessage());
    }
}
