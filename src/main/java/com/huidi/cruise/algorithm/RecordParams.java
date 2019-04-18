package com.huidi.cruise.algorithm;

import lombok.Data;

import java.sql.Date;
import java.sql.Time;

@Data
public class RecordParams {

    private Berth startBerth;
    private Berth arriveBerth;
    private int second;
    private Ship ship;
    private int shipTraffic;
    private Time delayTime;
    private Time startTime;
    private Date date;

    public RecordParams(Berth startBerth, Berth arriveBerth, int second, Ship ship, int shipTraffic, Time delayTime, Time startTime, Date date) {
        this.startBerth = startBerth;
        this.arriveBerth = arriveBerth;
        this.second = second;
        this.ship = ship;
        this.shipTraffic=shipTraffic;
        this.delayTime = delayTime;
        this.startTime = startTime;
    }
}

