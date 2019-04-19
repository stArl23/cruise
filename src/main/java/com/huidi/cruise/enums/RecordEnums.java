package com.huidi.cruise.enums;

import lombok.Getter;

@Getter
public enum RecordEnums {
    RECORD_NOT_EXIST(90, "record not exist"),
    RECORD_NOT_CREATE(91, "records are not created and run the create method firstly");
    private Integer id;
    private String message;

    RecordEnums(Integer id, String message) {
        this.id = id;
        this.message = message;
    }
}
