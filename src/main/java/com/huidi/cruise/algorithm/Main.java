package com.huidi.cruise.algorithm;

import com.huidi.cruise.domain.Record;

import java.sql.Date;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Berth> startBerthAlgorithms =new ArrayList<>();
        ArrayList<Berth> arriveBerthAlgorithms =new ArrayList<>();
        ArrayList<Ship> smallShips=new ArrayList<>();
        ArrayList<Ship> bigShips=new ArrayList<>();

        for (int i = 1; i <=4 ; i++) {
            Berth berthAlgorithm =new Berth(String.valueOf(i),true,null,null);
            startBerthAlgorithms.add(berthAlgorithm);
        }

        for (int i = 5; i <=7 ; i++) {
            Berth berthAlgorithm =new Berth(String.valueOf(i),true,null,null);
            arriveBerthAlgorithms.add(berthAlgorithm);
        }

        for (int i = 1; i <=13 ; i++) {
            Ship ship=new Ship(String.valueOf(i),100);
            smallShips.add(ship);
        }

        for (int i = 14; i <=18 ; i++) {
            Ship ship=new Ship(String.valueOf(i),200);
            bigShips.add(ship);
        }

        Algorithm m = new Algorithm(startBerthAlgorithms, arriveBerthAlgorithms,bigShips,smallShips, Date.valueOf("2019-02-22"));
       /* Time time1=Time.valueOf("7:10:10");
        Time time2=Time.valueOf("6:50:10");
        System.out.println(m.timeOperation("-",time1,time2));*/
        ArrayList<com.huidi.cruise.domain.Record> records=m.findOpt(10040);/*m.findMax();*/

        for (Record record: records) {
            System.out.println(record);
        }

        System.out.println(records.stream().mapToInt(e->e.getShipTraffic()).sum()/2);
        //System.out.print("1");
    }
}

