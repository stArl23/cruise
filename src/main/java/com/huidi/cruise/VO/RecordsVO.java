
package com.huidi.cruise.VO;

import com.huidi.cruise.dto.RecordDto;
import lombok.Data;

@Data
public class RecordsVO {

    private String date;
    private Boolean weather;
    private Boolean isGoldenWeek;
    //营业时间
    private String hours;
    private Integer traffic;
    private Integer timeForSailing;

    private Integer bigShipNumber;
    private Integer bigShipTraffic;
    private Integer bigShipWaitTime;
    private Integer smallShipTraffic;
    private Integer smallShipNumber;
    private Integer smallShipWaitTime;

    private PageVO<RecordDto> pageVO;

}
