
package com.huidi.cruise.dto;

import com.huidi.cruise.utils.interfaces.Excelable;
import lombok.Data;

import java.io.Serializable;
import java.sql.Time;

@Data
public class RecordDto implements Excelable, Serializable {
    private static final long serialVersionUID = 3068737394742385813L;
    private String id;
    private String arriveBerthTime;
    private String arriveTime;
    private String shipName;
    private String startBerth;
    private String arriveBerth;
    private String startTime;
    private String timeForSailing;
    private String waitTime;

    public RecordDto(String id,Time arriveTime, String shipName, String startBerth, String arriveBerth,Time startTime, String travelTime, String waitTime) {
        this.id=id;
        this.arriveBerthTime = arriveTime.toString();
        this.arriveTime = arriveTime.toString();
        this.shipName = shipName;

        this.startBerth = startBerth;
        this.arriveBerth=arriveBerth;
        this.startTime = startTime.toString();
        this.timeForSailing = travelTime;
        this.waitTime = waitTime;
    }
}
