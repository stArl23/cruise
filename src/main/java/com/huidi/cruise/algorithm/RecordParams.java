package com.huidi.cruise.algorithm;

import java.sql.Date;
import java.sql.Time;

public class RecordParams {

    private Berth startBerthAlgorithm;
    private Berth arriveBerthAlgorithm;
    private int second;
    private Ship ship;
    private int shipTraffic;
    private Time delayTime;
    private Time startTime;
    private Date date;

    public RecordParams(Berth startBerthAlgorithm, Berth arriveBerthAlgorithm, int second, Ship ship, int shipTraffic, Time delayTime, Time startTime,Date date) {
        this.startBerthAlgorithm = startBerthAlgorithm;
        this.arriveBerthAlgorithm = arriveBerthAlgorithm;
        this.second = second;
        this.ship = ship;
        this.shipTraffic=shipTraffic;
        this.delayTime = delayTime;
        this.startTime = startTime;
        this.date=date;
    }

    public Berth getStartBerthAlgorithm() {
        return startBerthAlgorithm;
    }

    public void setStartBerthAlgorithm(Berth startBerthAlgorithm) {
        this.startBerthAlgorithm = startBerthAlgorithm;
    }

    public Berth getArriveBerthAlgorithm() {
        return arriveBerthAlgorithm;
    }

    public void setArriveBerthAlgorithm(Berth arriveBerthAlgorithm) {
        this.arriveBerthAlgorithm = arriveBerthAlgorithm;
    }

    public int getSecond() {
        return second;
    }

    public void setSecond(int second) {
        this.second = second;
    }

    public Ship getShip() {
        return ship;
    }

    public void setShip(Ship ship) {
        this.ship = ship;
    }

    public Time getDelayTime() {
        return delayTime;
    }

    public void setDelayTime(Time delayTime) {
        this.delayTime = delayTime;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public int getShipTraffic() {
        return shipTraffic;
    }

    public void setShipTraffic(int shipTraffic) {
        this.shipTraffic = shipTraffic;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}

