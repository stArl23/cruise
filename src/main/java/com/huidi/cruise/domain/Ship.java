package com.huidi.cruise.domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class Ship {
    @Id
    private String id;
    private String sNumber;
    private Integer capability;
    private Boolean isAvailable;
}
