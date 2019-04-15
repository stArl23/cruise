package com.huidi.cruise.exception;

import com.huidi.cruise.enums.CommonEnums;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CommonException extends RuntimeException {
    private String message;
    private Integer id;

    public CommonException(Integer id, String message) {
        super(message);
        this.id = id;
    }

    public CommonException(CommonEnums commonEnums) {
        super(commonEnums.getMessage());
        this.message = commonEnums.getMessage();
        this.id = commonEnums.getId();
    }
}
