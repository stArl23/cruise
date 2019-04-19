package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum CommonEnums {
    PARAM_INVALID(50, "parameters invalid"),
    OBJECT_NULL(51, "object is null");

    private Integer id;
    private String message;

    CommonEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
