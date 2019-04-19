
package com.huidi.cruise.VO;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.huidi.cruise.dto.RecordDto;
import lombok.Data;

import java.io.Serializable;

@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class RecordsVO implements Serializable {

    private static final long serialVersionUID = 3068737394742385883L;

    private String date;
    private boolean weather;
    private boolean isGoldenWeek;
    //营业时间
    private String hours;
    private int traffic;
    private int timeForSailing;

    private Integer bigShipNumber;
    private Integer bigShipTraffic;
    private Integer bigShipWaitTime;
    private Integer smallShipTraffic;
    private Integer smallShipNumber;
    private Integer smallShipWaitTime;

    private PageVO<RecordDto> pageVO;

}
