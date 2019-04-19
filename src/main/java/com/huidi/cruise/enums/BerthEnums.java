package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum BerthEnums {
    ONE_SIDE_BERTHS_UNAVAILABLE(60, "one side berth is unavailable"),
    BERTH_NO_FOUND(61, "berth no find");
    private Integer id;
    private String message;

    BerthEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
