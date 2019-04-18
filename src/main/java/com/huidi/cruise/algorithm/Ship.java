package com.huidi.cruise.algorithm;

import java.sql.Time;

public class Ship {
    private String name;
    private Integer capability;
    private Integer freq;
    private Integer priority;
    private Time lateTime;

    public Ship(String name, Integer capability) {
        this.name = name;
        this.capability = capability;
        this.freq=0;
        this.priority=0;
        this.lateTime = null;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getCapability() {
        return capability;
    }

    public void setCapability(Integer capability) {
        this.capability = capability;
    }

    public Integer getFreq() {
        return freq;
    }

    public void setFreq(Integer freq) {
        this.freq = freq;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public void increaseFreq(){
        this.freq++;
    }

    public Time getLateTime() {
        return lateTime;
    }

    public void setLateTime(Time lateTime) {
        this.lateTime = lateTime;
    }

}
