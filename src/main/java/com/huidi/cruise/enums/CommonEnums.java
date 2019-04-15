package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum CommonEnums {
    PARAM_INVALID(50, "参数有误"),
    OBJECT_NULL(51, "对象为空");

    private Integer id;
    private String message;

    CommonEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
