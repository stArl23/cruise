package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum UserEnums {
    USER_NO_FOUND(80, "user no find"),
    LOGIN_ERROR(81,"username or password incorrect");
    private Integer id;
    private String message;

    UserEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
