
package com.huidi.cruise.form;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotEmpty;

@Data
@ApiModel(value = "model of record form")
public class RecordRequestForm {
    @Max(value = 200, message = "大船运量不得超过限制")
    @ApiModelProperty(value = "maximum traffic of big ship",example = "200")
    private Integer bigShipTraffic;
    @Max(value = 100, message = "小船运量不得超过限制")
    @ApiModelProperty(value = "maximum traffic of small ship",example = "100")
    private Integer smallShipTraffic;
    @ApiModelProperty(value = "flight time",example = "15")
    private Integer timeForSailing;
    @ApiModelProperty(value = "forecasting traffic",example = "10040")
    private Integer traffic;

    @ApiModelProperty(value = "date of the day",example = "2019-02-18")
    private String date;
    @ApiModelProperty(value = "end time",example = "07:15:00")
    private String endTime;
    @ApiModelProperty(value = "is golden week or not",example = "false")
    private Integer isGoldenWeek;
    @ApiModelProperty(value = "start time",example = "07:00:00")
    private String startTime;
    @ApiModelProperty(value = "weather",example = "good weather")
    private Integer weather;
}
