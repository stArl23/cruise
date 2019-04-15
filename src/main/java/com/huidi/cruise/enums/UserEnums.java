package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum UserEnums {
    USER_NO_FOUND(80, "用户未找到");
    private Integer id;
    private String message;

    UserEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
