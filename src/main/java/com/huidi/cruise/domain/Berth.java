package com.huidi.cruise.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
public class Berth {
    @Id
    private String id;
    private Integer sNumber;
    private Boolean isAvailable;

    public Berth() {
    }
}
