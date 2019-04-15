package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum BerthEnums {
    ONE_SIDE_BERTHS_UNAVAILABLE(60, "一侧码头不能全不可用"),
    BERTH_NO_FOUND(61, "码头未找到");
    private Integer id;
    private String message;

    BerthEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
