package com.huidi.cruise.handler;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.domain.Berth;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.domain.Ship;
import com.huidi.cruise.domain.User;
import com.huidi.cruise.exception.*;
import com.huidi.cruise.utils.ResultVOUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommonExceptionHandler {

    @ExceptionHandler(value = BerthException.class)
    @ResponseBody
    public ResultVO HandlerException(BerthException ex) {
        return ResultVOUtil.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = ShipException.class)
    @ResponseBody
    public ResultVO HandlerException(ShipException ex) {
        return ResultVOUtil.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = UserException.class)
    @ResponseBody
    public ResultVO HandlerException(UserException ex) {
        return ResultVOUtil.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler(value = RecordException.class)
    @ResponseBody
    public ResultVO HandlerException(RecordException ex) {
        return ResultVOUtil.error(ex.getId(), ex.getMessage());
    }

    @ExceptionHandler
    @ResponseBody
    public ResultVO handlerException(CommonException ex){
        return ResultVOUtil.error(ex.getId(),ex.getMessage());
    }
}
