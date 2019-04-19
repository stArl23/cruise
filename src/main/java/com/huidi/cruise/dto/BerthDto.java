package com.huidi.cruise.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;

@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class BerthDto implements Serializable {
    private static final long serialVersionUID = 3061737394742385883L;

    private String id;
    private String name;
    private boolean isAvailable;

    public BerthDto(String id, String name, Boolean isAvailable) {
        this.id = id;
        this.name = name;
        this.isAvailable = isAvailable;
    }
}
