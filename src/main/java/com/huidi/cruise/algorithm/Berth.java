package com.huidi.cruise.algorithm;

import lombok.Data;

import java.sql.Time;
import java.util.Objects;
import java.util.TreeMap;

@Data
public class Berth {
    private String name;
    private boolean isAvailable;
    private int freq;
    private Time earlyBusyTime;
    private Time lateBusyTime;
    private String lastShipName;

    //TODO 完成全局busy 状态的维持 估计setBusyTime 函数也需要修改
    private TreeMap<Time, Time> busyTime;


    public Berth(String name, boolean isAvailable, Time earlyBusyTime, Time lateBusyTime) {
        this.name = name;
        this.isAvailable = isAvailable;
        this.earlyBusyTime = earlyBusyTime;
        this.lateBusyTime = lateBusyTime;
        this.freq = 0;
        this.busyTime = new TreeMap<>((o1, o2) -> o1.after(o2) ? 1 : (o1.equals(o2) ? 0 : -1));
    }

    public boolean can_book(Time earlyBusyBoundary, Time lateBusyBoundary) {
        Time previous = busyTime.floorKey(earlyBusyBoundary), next = busyTime.ceilingKey(earlyBusyBoundary);
        // early time boundary and late time boundary can be added in busyTime map
        // doesn't add into map
        if ((Objects.isNull(previous) || busyTime.get(previous).before(earlyBusyBoundary))
                && (Objects.isNull(next) || lateBusyBoundary.before(next))) {
            return true;
        }
        return false;
    }

    public void freqAdd() {
        this.freq++;
    }
}
