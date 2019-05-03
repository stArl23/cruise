package com.huidi.cruise.domain.builder;

import com.huidi.cruise.domain.Record;

import java.sql.Date;
import java.sql.Time;

public class RecordBuilder {
    private String id;
    private Integer startBerth;
    private Integer arriveBerth;
    private String shipName;
    private Integer shipTraffic;
    private Time startTime;
    private Time arriveTime;
    private Time onOrOutTime;
    private Time totalTime;
    private Date date;

    public RecordBuilder setId(String id) {
        this.id = id;
        return this;
    }

    public RecordBuilder setStartBerth(Integer startBerth) {
        this.startBerth = startBerth;
        return this;
    }

    public RecordBuilder setArriveBerth(Integer arriveBerth) {
        this.arriveBerth = arriveBerth;
        return this;
    }

    public RecordBuilder setShipName(String shipName) {
        this.shipName = shipName;
        return this;
    }

    public RecordBuilder setShipTraffic(Integer shipTraffic) {
        this.shipTraffic = shipTraffic;
        return this;
    }

    public RecordBuilder setStartTime(Time startTime) {
        this.startTime = startTime;
        return this;
    }

    public RecordBuilder setArriveTime(Time arriveTime) {
        this.arriveTime = arriveTime;
        return this;
    }

    public RecordBuilder setOnOrOutTime(Time onOrOutTime) {
        this.onOrOutTime = onOrOutTime;
        return this;
    }

    public RecordBuilder setTotalTime(Time totalTime) {
        this.totalTime = totalTime;
        return this;
    }

    public RecordBuilder setDate(Date date) {
        this.date = date;
        return this;
    }

    public Record createRecord() {
        return new Record(id, startBerth, arriveBerth, shipName, shipTraffic, startTime, arriveTime, onOrOutTime, totalTime, date);
    }
}