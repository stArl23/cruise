package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum RecordEnums {
    RECORD_NOT_EXIST(80, "记录不存在"),
    RECORD_NOT_CREATE(81,"记录未被创建，请先排航");
    private Integer id;
    private String message;

    RecordEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
