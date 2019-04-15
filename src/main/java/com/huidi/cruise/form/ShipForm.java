package com.huidi.cruise.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(value = "model of Ship")
public class ShipForm {
    @ApiModelProperty(value = "unique id",example = "1549955049683998275")
    private String id;
    @ApiModelProperty(value = "ship name",example = "1")
    private Integer sNumber;
    @ApiModelProperty(value = "ship is available or not",example = "true")
    private Boolean isAvailable;
}
