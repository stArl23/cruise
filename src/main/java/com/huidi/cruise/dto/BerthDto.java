package com.huidi.cruise.dto;

import lombok.Data;

@Data
public class BerthDto {
    private String id;
    private String name;
    private Boolean isAvailable;

    public BerthDto(String id, String name, Boolean isAvailable) {
        this.id = id;
        this.name = name;
        this.isAvailable = isAvailable;
    }
}
