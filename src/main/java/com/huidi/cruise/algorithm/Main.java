package com.huidi.cruise.algorithm;

import com.huidi.cruise.constant.AlgorithmConstant;
import com.huidi.cruise.constant.ShipConstant;
import com.huidi.cruise.domain.Record;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        ArrayList<Berth> startBerths = new ArrayList<>();
        ArrayList<Berth> arriveBerths = new ArrayList<>();
        ArrayList<Ship> smallShips = new ArrayList<>();
        ArrayList<Ship> bigShips = new ArrayList<>();
        Time startTime = Time.valueOf("07:00:00");
        Time endTime = Time.valueOf("18:00:00");
        Time loopTime = Time.valueOf("00:30:00");
        //准备码头数据
        for (int i = 1; i <= 4; i++) {
            Berth berth = new Berth(String.valueOf(i), true, null, null);
            startBerths.add(berth);
        }

        for (int i = 5; i <= 7; i++) {
            Berth berth = new Berth(String.valueOf(i), true, null, null);
            arriveBerths.add(berth);
        }
        //准备船只数据
        for (int i = 1; i <= 8; i++) {
            Ship ship = new Ship(String.valueOf(i), 100);
            smallShips.add(ship);
        }

        for (int i = 9; i <= 14; i++) {
            Ship ship = new Ship(String.valueOf(i), 200);
            bigShips.add(ship);
        }

        Algorithm m = new Algorithm(new Date(System.currentTimeMillis()), startTime, endTime, startBerths, arriveBerths, bigShips, smallShips, (int) ((int) ShipConstant.WAIT_SECOND * AlgorithmConstant.DELAYRATE));

        ArrayList<ArrayList<Record>> recordsList = m.findMax(30000)/*m.findOpt(5500)*/;


        for (Record backRecord : recordsList.get(1)) {
            System.out.println(backRecord);
        }
        //仅仅来或者回的客流量

        //统计来回船的工作量
        System.out.println(recordsList.get(0).size() + recordsList.get(1).size());
        int result[] = new int[20];
        for (Record record : recordsList.get(0)) {
            result[Integer.parseInt(record.getShipName())] += 1;
        }

        int result1[] = new int[8];
        for (Berth berth : startBerths) {
            result1[Integer.parseInt(berth.getName())] = berth.getFreq();
        }

        for (Berth berth : arriveBerths) {
            result1[Integer.parseInt(berth.getName())] = berth.getFreq();
        }

        for (Record record : recordsList.get(1)) {
            result[Integer.parseInt(record.getShipName())] += 1;
        }
        for (int i = 1; i < 14; i++) {
            if (i % 9 == 0) System.out.println();
            System.out.print("ship " + i + ":" + result[i] + "     ");
        }

        System.out.println();
        for (int i = 1; i < 8; i++) {
            System.out.print("berth " + i + ":" + result1[i] + "     ");
            if (i % 4 == 0) System.out.println();
        }
        System.out.println();
        System.out.println("qian:" + recordsList.get(1).stream().mapToInt(e -> e.getShipTraffic()).sum());


//        System.out.println("hou:"+newRecords2.stream().mapToInt(e -> e.getShipTraffic()).sum());

    }
}

