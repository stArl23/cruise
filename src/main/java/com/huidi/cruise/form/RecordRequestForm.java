
package com.huidi.cruise.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;

@Data
@ApiModel(value = "model of record form")
public class RecordRequestForm {
    @Max(value = 200, message = "200 is maximum")
    private Integer bigShipTraffic;
    @Max(value = 100, message = "100 is maximum")
    private Integer smallShipTraffic;
    private Integer timeForSailing;
    private Integer traffic;
    private String date;
    private String endTime;
    private Integer isGoldenWeek;
    private String startTime;
    private Integer weather;
}
