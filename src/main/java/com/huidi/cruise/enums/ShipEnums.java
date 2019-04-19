package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum ShipEnums {
    SHIP_NO_FOUND(70, "ship no find"),
    SHIP_EXISTS(71, "ship is already existed");
    private Integer id;
    private String message;

    ShipEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
