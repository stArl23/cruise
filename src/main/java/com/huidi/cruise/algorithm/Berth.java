package com.huidi.cruise.algorithm;

import lombok.Data;

import java.sql.Time;

@Data
public class Berth {
    private String name;
    private boolean isAvailable;
    private int freq;
    private Time earlyBusyTime;
    private Time lateBusyTime;


    public Berth(String name, boolean isAvailable, Time earlyBusyTime, Time lateBusyTime) {
        this.name = name;
        this.isAvailable = isAvailable;
        this.earlyBusyTime = earlyBusyTime;
        this.lateBusyTime = lateBusyTime;
        freq = 0;
    }

    public void freqAdd() {
        this.freq++;
    }
}
