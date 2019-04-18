package com.huidi.cruise.domain;

import com.huidi.cruise.algorithm.RecordParams;
import com.huidi.cruise.utils.KeyUtils;
import com.huidi.cruise.utils.TimeUtils;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.Objects;

@Data
@Entity
public class Record implements Serializable{
    private static final long serialVersionUID=42L;
    @Id
    private String id;
    // ship start from which berth
    private Integer startBerth;
    //ship arrive which berth
    private Integer arriveBerth;

    private String shipName;

    private Integer shipTraffic;
    //start time
    private Time startTime;
    //arrive time
    private Time arriveTime;
    //get in or out of ship time
    private Time onOrOutTime;
    //total time need;
    private Time totalTime;
    //date
    private Date date;

    public Record() {
    }

    public Record(RecordParams recordParams) {
        this.id= KeyUtils.genUniqueKey();
        this.startBerth = Integer.valueOf(recordParams.getStartBerth().getName());
        this.arriveBerth = Integer.valueOf(recordParams.getArriveBerth().getName());
        this.shipName=recordParams.getShip().getName();
        this.shipTraffic=recordParams.getShipTraffic();
        this.startTime=recordParams.getDelayTime().after(recordParams.getStartTime())?recordParams.getDelayTime():recordParams.getStartTime();
        //this.arriveTime=Algorithm.timeOperation("-",recordParams.getArriveBerthAlgorithm().getEarlyBusyTime(),Algorithm.secondToTime(recordParams.getSecond()));
        this.arriveTime = recordParams.getArriveBerth().getEarlyBusyTime();
        this.totalTime = TimeUtils.timeOperation("+", TimeUtils.timeOperation("-", this.arriveTime, this.startTime), TimeUtils.secondToTime(recordParams.getSecond()));
        this.onOrOutTime = TimeUtils.secondToTime(recordParams.getSecond());
        this.date=recordParams.getDate();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Record)) return false;
        Record record = (Record) o;
        return getId().equals(record.getId()) &&
                getStartBerth().equals(record.getStartBerth()) &&
                getArriveBerth().equals(record.getArriveBerth()) &&
                getShipName().equals(record.getShipName()) &&
                getShipTraffic().equals(record.getShipTraffic()) &&
                getStartTime().equals(record.getStartTime()) &&
                getArriveTime().equals(record.getArriveTime()) &&
                getOnOrOutTime().equals(record.getOnOrOutTime()) &&
                getTotalTime().equals(record.getTotalTime()) &&
                getDate().equals(record.getDate());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getStartBerth(), getArriveBerth(), getShipName(), getShipTraffic(), getStartTime(), getArriveTime(), getOnOrOutTime(), getTotalTime(), getDate());
    }
}
