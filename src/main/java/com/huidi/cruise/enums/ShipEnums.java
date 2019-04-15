package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum ShipEnums {
    SHIP_NO_FOUND(70, "找不到船只"),
    SHIP_EXISTS(71, "船只已存在");
    private Integer id;
    private String message;

    ShipEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
