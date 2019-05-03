package com.huidi.cruise.algorithm;

import com.huidi.cruise.algorithm.model.Model;
import com.huidi.cruise.constant.AlgorithmConstant;
import com.huidi.cruise.constant.BerthConstant;
import com.huidi.cruise.constant.ShipConstant;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.domain.builder.RecordBuilder;
import com.huidi.cruise.utils.KeyUtils;
import com.huidi.cruise.utils.StringUtils;
import com.huidi.cruise.utils.TimeUtils;

import java.sql.Date;
import java.sql.Time;
import java.util.*;

public class Algorithm {
    private Date date;
    private Integer wait_second;
    private ArrayList<Berth> berths;
    private Map<String, Berth> berthMap;
    private ArrayList<Berth> startBerths;
    private ArrayList<Berth> arriveBerths;
    private ArrayList<Ship> smallShips;
    private ArrayList<Ship> bigShips;
    private Heap<Ship> ships;
    private Heap<Ship> shipsWaiting;
    private Comparator<Ship> shipComparator;
    private Comparator<Record> sortComparator;//fixed

    private Time startTime;
    private Time endTime;
    private Time loopInterval;
    private int back_order;
    private int order;


    public Algorithm(java.sql.Date date, Time startTime, Time endTime, ArrayList<Berth> startBerths, ArrayList<Berth> arriveBerths, ArrayList<Ship> bigShips, ArrayList<Ship> smallShips, Integer wait_second) {
        back_order = 0;
        order = 0;

        berthMap = new HashMap<>();
        berths = new ArrayList<>();
        this.startTime = startTime;
        this.endTime = endTime;
        this.loopInterval = TimeUtils.secondToTime(AlgorithmConstant.LOOP_SECOND);
        this.bigShips = bigShips;
        this.smallShips = smallShips;
        this.startBerths = startBerths;
        this.arriveBerths = arriveBerths;
        this.date = date;
        this.wait_second = wait_second;
        berths.addAll(startBerths);
        berths.addAll(arriveBerths);
        for (Berth berth : startBerths) {
            berthMap.put(berth.getName(), berth);
        }
        for (Berth berth : arriveBerths) {
            berthMap.put(berth.getName(), berth);
        }

        this.shipComparator = (o1, o2) -> {
            if (o1.getFreq() * o1.getPriority() > o2.getFreq() * o2.getPriority()) {
                return 1;
            } else if (o1.getFreq() * o1.getPriority() < o2.getFreq() * o2.getPriority()) {
                return -1;
            } else {
                return StringUtils.getShipId(o1.getName()) > StringUtils.getShipId(o2.getName()) ? 1 : -1;
            }
        };
        this.ships = new Heap<>(this.bigShips.size() + this.smallShips.size(), shipComparator);
        this.shipsWaiting = new Heap<>(this.bigShips.size() + this.smallShips.size(), shipComparator);

        this.sortComparator = (o1, o2) -> o1.getStartTime().after(o2.getStartTime()) ? 1 : -1;
    }

    /**
     * Find the opt berth
     * 寻找最优码头，如果有多个可供选择码头，选择使用次数最少的码头
     * @param berths berth list will be chosen
     * @param earlyBusyTime early bound time
     * @param lateBusyTime  late bound time
     * @return berth
     */
    private Berth findBerth(ArrayList<Berth> berths, Time earlyBusyTime, Time lateBusyTime) {
        Time temp = Time.valueOf("23:59:59");
        Berth tempBerth = null;
        boolean flag = false;
        int i = 0, max_i = berths.size();
        for (Berth berth : berths) {
            // find a berth is available during this period of time
            if (Objects.isNull(berth.getEarlyBusyTime()) || (berth.getLateBusyTime().before(earlyBusyTime) || berth.getEarlyBusyTime().after(lateBusyTime))) {
                if (Objects.isNull(tempBerth) || berth.getFreq() < tempBerth.getFreq()) {
                    tempBerth = berth;
                    flag = true;
                }

            } else {
                //if no berth is available, find a berth which can make ship wait the least time
               /* i++;
                if (flag) continue;
                if (temp.after(berth.getLateBusyTime())) {
                    temp = berth.getLateBusyTime();
                    tempBerth = berth;
                }*/
            }
        }
        if (i == max_i) System.out.println("used");
        return tempBerth;
    }

    //find an available berth or return null
    private Berth findBerth1(ArrayList<Berth> berths, Time earlyBusyTime, Time lateBusyTime) {
        Time temp = Time.valueOf("23:59:59");
        Berth tempBerth = null;
        //boolean flag = false;
        for (Berth berth : berths) {
            // find a berth is available during this period of time
            if (berth.can_book(earlyBusyTime, lateBusyTime)) {
                if (Objects.isNull(tempBerth) || berth.getFreq() < tempBerth.getFreq()) {
                    tempBerth = berth;
                }
            }
        }
        tempBerth.freqAdd();
        return tempBerth;
    }



    private void updateShips(Heap<Ship> ships, double rate) {
        ships.clear();
        updateBigShip(ships, rate);
        updateSmallShip(ships, rate);
    }

    //warming should clear heap before use only bigShips or smallShips
    private void updateBigShip(Heap<Ship> bigShips, double rate) {
        for (Ship ship : this.bigShips) {
            Ship ship1 = new Ship(ship.getName(), (int) (ship.getCapability() * rate));
            ship1.setPriority(1);
            bigShips.add(ship1);
        }
    }

    private void updateSmallShip(Heap<Ship> smallShips, double rate) {
        for (Ship ship : this.smallShips) {
            Ship ship1 = new Ship(ship.getName(), (int) (ship.getCapability() * rate));
            ship1.setPriority(1);
            smallShips.add(ship1);
        }
    }

    private void updateBerths() {
        for (Berth berth : startBerths) {
            berth.setEarlyBusyTime(null);
            berth.setLateBusyTime(null);
            berth.getBusyTime().clear();
            berth.setFreq(0);
            berth.setLastShipName(null);
        }

        for (Berth berth : arriveBerths) {
            berth.setEarlyBusyTime(null);
            berth.setLateBusyTime(null);
            berth.getBusyTime().clear();
            berth.setFreq(0);
            berth.setLastShipName(null);
        }
    }

    private void updateRecords(ArrayList<ArrayList<Record>> records, ArrayList<Record> records1, ArrayList<Record> records2) {
        records.clear();
        records.add(records1);
        records.add(records2);
    }


    /**
     * Second prune
     * 如果两出发码相同且，两出发时间之差小于200s(上下船时间)则排航序列无效
     *
     * @param records
     * @return
     */
    private void timeFilter(ArrayList<ArrayList<Record>> records) {
        for (ArrayList<Record> recordList : records) {
            for (int i = 0; i < recordList.size(); i++) {
                for (int j = i + 1; j < recordList.size(); j++) {
                    if (recordList.get(i).getStartBerth().equals(recordList.get(j).getStartBerth())) {
                        if (recordList.get(i).getStartTime().before(recordList.get(j).getStartTime()) &&
                                TimeUtils.timeOperation("-", recordList.get(j).getStartTime(), recordList.get(i).getStartTime()).before(TimeUtils.secondToTime(wait_second)) ||
                                recordList.get(i).getStartTime().equals(recordList.get(j).getStartTime())) {

                            Record record = recordList.get(j);
                            recordList.remove(record);
                        }
                    }

                }
            }
        }
    }

    private Boolean testTimeFilter(ArrayList<ArrayList<Record>> records) {
        for (ArrayList<Record> recordList : records) {
            for (int i = 0; i < recordList.size(); i++) {
                for (int j = i + 1; j < recordList.size(); j++) {
                    if (recordList.get(i).getStartBerth().equals(recordList.get(j).getStartBerth())) {
                        if (recordList.get(i).getStartTime().before(recordList.get(j).getStartTime()) &&
                                TimeUtils.timeOperation("-", recordList.get(j).getStartTime(), recordList.get(i).getStartTime()).before(TimeUtils.secondToTime(wait_second)) ||
                                recordList.get(i).getStartTime().equals(recordList.get(j).getStartTime())) {

                            return false;
                        }
                    }

                }
            }
        }
        return true;
    }

    private void berthFilter(ArrayList<ArrayList<Record>> records, int wait_second) {
        /*        ArrayList<Record> t_list=new ArrayList<>();*/
        int d_num = 0;
        ArrayList<Record> recordList = new ArrayList<>();
        recordList.addAll(records.get(0));
        recordList.addAll(records.get(1));

        recordList.sort((o1, o2) -> o1.getStartTime().after(o2.getStartTime()) ? 1 : -1);

        /*for (Record record: recordList) {
            System.out.println(record);
        }*/
        Set<String> delete_set = new HashSet<>();
        for (int i = 0; i < berths.size(); i++) {
            ArrayList<Record> tempList = new ArrayList<>();
            for (Record record : recordList) {
                if (record.getStartBerth().equals(Integer.parseInt(berths.get(i).getName()))
                        || record.getArriveBerth().equals(Integer.parseInt(berths.get(i).getName()))) {
                    tempList.add(record);
                }
            }

            for (int j = 0; j < tempList.size(); j++) {
                for (int k = j + 1; k < tempList.size(); k++) {
                    Time t = TimeUtils.timeOperation("-", tempList.get(k).getStartTime(), tempList.get(j).getArriveTime());
                    if (tempList.get(j).getArriveBerth().equals(tempList.get(k).getStartBerth()) && TimeUtils.timeToSecond(t) < wait_second) {
                        d_num++;
                        Record toRecord = tempList.get(j).getStartBerth() <= BerthConstant.DEVIDED ? tempList.get(j) : tempList.get(k);
                        Record backRecord = tempList.get(j).getStartBerth() > BerthConstant.DEVIDED ? tempList.get(j) : tempList.get(k);
                        if (d_num % 2 == 0) {
                            delete_set.add(toRecord.getId());
                        } else {
                            delete_set.add(backRecord.getId());
                        }
                    }
                }
            }
        }

        ArrayList<Record> goIslandList = new ArrayList<>();
        ArrayList<Record> goBackList = new ArrayList<>();
        for (Record record : recordList) {
            if (delete_set.contains(record.getId())) continue;
            if (record.getStartBerth() <= BerthConstant.DEVIDED) {
                goIslandList.add(record);
            } else {
                goBackList.add(record);
            }
        }

        System.out.println("filter size: " + delete_set.size());
        records.set(0, new ArrayList<>(goIslandList));
        records.set(1, new ArrayList<>(goBackList));
    }

    //use new choose policy
    /**
     * Basic findOpt
     * return go island and go back list, 3 small ship and 1 big ship
     * 返回来和回的序列，使用大小船单独堆 3小船1大船确保
     * @param number predict traffic
     * @return return go island and go back list
     */
    //目前最大13300
    //bug 1 最大的问题就是两个 loop之间，如果前面最后一班出发时间和第二个loop的第一班出发时间撞车
    public ArrayList<ArrayList<Record>> findOpt(int number) {
        back_order = 0;
        order = 0;
        //prepare data
        //updateShips(ships, AlgorithmConstant.STANDRATE);
        Heap<Ship> bigShipHeap, smallShipHeap, bigWaitingShipHeap, smallWaitingShipHeap;
        bigShipHeap = new Heap<>(this.bigShips.size(), shipComparator);
        smallShipHeap = new Heap<>(this.smallShips.size(), shipComparator);
        bigWaitingShipHeap = new Heap<>(this.bigShips.size(), shipComparator);
        smallWaitingShipHeap = new Heap<>(this.smallShips.size(), shipComparator);

        updateBigShip(bigShipHeap, AlgorithmConstant.STANDRATE);
        updateSmallShip(smallShipHeap, AlgorithmConstant.STANDRATE);

        updateBerths();
        ArrayList<ArrayList<Record>> records = new ArrayList<>();
        updateRecords(records, new ArrayList<>(), new ArrayList<>());

        //ArrayList<ArrayList<ArrayList<Record>>> recordsList = new ArrayList<>();

        Time loopInterval = this.loopInterval;
        int loopNumber = TimeUtils.timeToSecond(TimeUtils.timeOperation("-", endTime, startTime)) / AlgorithmConstant.LOOP_SECOND;
        int total_back_traffic = 0;
        //generate interval list
        Time start = startTime;
        Time startTimeTemp = start;
        Time backTimeTemp = start;

        for (int i = 0; i < loopNumber; i++) {
            int toNumber = 0;
            int backNumber = 0;
            int toPrediction = i > 19 ? 0 : Model.model(number, i);
            int backPrediction = i <= 1 ? 0 : Model.model(number, i - 2);
            if (i != 0)
                start = TimeUtils.timeOperation("+", start, loopInterval);

            ArrayList<Record> goIslandList = new ArrayList<>();
            ArrayList<Record> goBackList = new ArrayList<>();

            int size = records.get(0).size();
            int start_index = size < 4 ? size : getStartIndex(records.get(0).subList(size - 4, size));
            int number_of_ship = getShipNum(toPrediction, start_index);/*toPrediction % ShipConstant.AVG_SHIP_CUSTOMERS > 0 ? toPrediction / ShipConstant.AVG_SHIP_CUSTOMERS + 1 : toPrediction / ShipConstant.AVG_SHIP_CUSTOMERS;*/
            Time interval = number_of_ship > 0 ? TimeUtils.secondToTime((AlgorithmConstant.LOOP_SECOND / number_of_ship) / 60 * 60 /*- wait_second*/) : TimeUtils.secondToTime(wait_second);//max 1800s

            startTimeTemp = start;
            backTimeTemp = start;
            //generate
            //当客运量满足需求或者船只全部用尽

            Time bound = TimeUtils.timeOperation("+", loopInterval, start);
            //bound = TimeUtils.timeOperation("-", bound, TimeUtils.secondToTime(wait_second));
            while (toNumber < toPrediction && /*!ships.isEmpty()*/(!bigShipHeap.isEmpty() || !smallShipHeap.isEmpty())) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                //Ship ship = (Ship) ships.peek();
                Ship ship = (Ship) d_ship(bigShipHeap, smallShipHeap, false);
              /*  if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                    startTimeTemp = ship.getLateTime();
                }*/
                while (!isAvailableBerth(startTimeTemp, false)) {
                    startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                }
                if (equalOrAfter(bound, startTimeTemp)) break;
                //ship = getShip(ships);
                ship = getShip(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, false);
                //add to wait queue
                addWaitingQueue(ship, bigWaitingShipHeap, smallWaitingShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY);
                //shipsWaiting.add(ship);

                /*startTimeTemp = */
                getGoList1(startTimeTemp, goIslandList, ship, true);

                toNumber += ship.getCapability();

                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
            }

            size = records.get(1).size();
            start_index = size < 4 ? size : getStartIndex(records.get(1).subList(size - 4, size));
            number_of_ship = getShipNum(toPrediction, start_index);
            interval = number_of_ship > 0 ? TimeUtils.secondToTime((AlgorithmConstant.LOOP_SECOND / number_of_ship) / 60 * 60/*- wait_second*/) : TimeUtils.secondToTime(wait_second);
            while (backNumber < backPrediction) {
                Ship ship;

                //考虑岛内没有船 需空跑
                if (/*shipsWaiting.isEmpty()*/bigWaitingShipHeap.isEmpty() && smallWaitingShipHeap.isEmpty()) {
                    //ship = (Ship) ships.peek();
                    ship = d_ship(bigShipHeap, smallShipHeap, false);
                  /*  if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                        startTimeTemp = ship.getLateTime();
                    }*/

                    Time tempTime = TimeUtils.timeOperation("-", backTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
                    while (!isAvailableBerth(backTimeTemp, true) || !isAvailableBerth(tempTime, false)) {
                        backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                        tempTime = TimeUtils.timeOperation("+", tempTime, interval);
                    }
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    /*startTimeTemp = */
                    //调船
                    directGo1(tempTime, goIslandList, ship, bound);
                    //末尾处理
                    //ship = getShip(ships);
                    ship = getShip(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, false);
                    //backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                    //startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                } else {
                    // ship = (Ship) shipsWaiting.peek();
                    ship = d_ship(bigWaitingShipHeap, smallWaitingShipHeap, true);
                    /*if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                        backTimeTemp = ship.getLateTime();
                    }*/
                    //末尾处理
                    while (!isAvailableBerth(backTimeTemp, true)) {
                        backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                    }
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    //ship = getShip(shipsWaiting);
                    ship = getShip(ship, bigWaitingShipHeap, smallWaitingShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, true);
                }

                backNumber += ship.getCapability();
                //total_back_traffic+=ship.getCapability();
                //ships.add(ship);
                addWaitingQueue(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY);
                /*backTimeTemp = */
                getGoList1(backTimeTemp, goBackList, ship, false);
                backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
            }
            sortList(records, goIslandList, goBackList);
        }

        Time bound = Time.valueOf("23:59:59");
        Time interval = TimeUtils.secondToTime(wait_second);
        ArrayList<Record> goBackList = new ArrayList<>();
        ArrayList<Record> goIslandList = new ArrayList<>();
        int num1 = records.get(0).stream().mapToInt(e -> e.getShipTraffic()).sum();
        total_back_traffic = records.get(1).stream().mapToInt(e -> e.getShipTraffic()).sum();
        while (total_back_traffic < num1) {
            Ship ship;
            if (/*shipsWaiting.isEmpty()*/bigWaitingShipHeap.isEmpty() && smallWaitingShipHeap.isEmpty()) {
                //ship = getShip(ships);
                ship = d_ship(bigShipHeap, smallShipHeap, true);
                Time tempTime = TimeUtils.timeOperation("-", backTimeTemp, TimeUtils.secondToTime(wait_second));
                while (!isAvailableBerth(backTimeTemp, true) || !isAvailableBerth(tempTime, false)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                    tempTime = TimeUtils.timeOperation("+", tempTime, interval);
                }


                ship = getShip(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, true);

                /*if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp))
                    startTimeTemp = ship.getLateTime();*/
                /*startTimeTemp = */
                directGo1(tempTime, goIslandList, ship, bound);
                /*backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);*/
            } else {
                //ship = getShip(shipsWaiting);
                ship = d_ship(bigWaitingShipHeap, smallWaitingShipHeap, true);
                while (!isAvailableBerth(backTimeTemp, true)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                }
                ship = getShip(ship, bigWaitingShipHeap, smallWaitingShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, true);
                /*backTimeTemp = */
                //ships.add(ship);
               /* if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }*/
            }
            total_back_traffic += ship.getCapability();

            getGoList1(backTimeTemp, goBackList, ship, false);
            addWaitingQueue(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY);
            backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
        }
        //records.get(0).addAll(goIslandList);
        //records.get(1).addAll(goBackList);
        sortList(records, goIslandList, goBackList);
        //two pruning conditions
        while (!testTimeFilter(records)) {
            //recordsList.add((ArrayList<ArrayList<Record>>) records.clone());
            timeFilter(records);
        }

        berthFilter(records, wait_second);
        return records;
    }

    /***
     * find max，使用大小船堆优化
     * @return go back and go island list
     */
    public ArrayList<ArrayList<Record>> findMax(int number) {
        //prepare data
        updateShips(ships, AlgorithmConstant.OVERCROWDRATE);
        shipsWaiting.clear();
        //updateShips(shipsWaiting, AlgorithmConstant.OVERCROWDRATE);
        updateBerths();
        ArrayList<ArrayList<Record>> records = new ArrayList<>();
        updateRecords(records, new ArrayList<>(), new ArrayList<>());

        Time loopInterval = this.loopInterval;
        int loopNumber = TimeUtils.timeToSecond(TimeUtils.timeOperation("-", endTime, startTime)) / AlgorithmConstant.LOOP_SECOND;
        //generate interval list
        Time start = startTime;
        Time startTimeTemp = start;
        Time backTimeTemp = start;
        Time actual_backTime = TimeUtils.timeOperation("+", startTime, TimeUtils.secondToTime(AlgorithmConstant.LOOP_SECOND * 2));

        for (int i = 0; i < loopNumber; i++) {
            int toNumber = 0;
            int backNumber = 0;
            int numOfEachLoop = (int) Math.ceil((double) number / loopNumber);
            int toPrediction = numOfEachLoop;
            int backPrediction = numOfEachLoop;
            if (i != 0)
                start = TimeUtils.timeOperation("+", start, loopInterval);

            ArrayList<Record> goIslandList = new ArrayList<>();
            ArrayList<Record> goBackList = new ArrayList<>();


            startTimeTemp = start;
            backTimeTemp = start;
            int t = /*AlgorithmConstant.LOOP_SECOND-ShipConstant.IN_SEA_SECOND*/wait_second;
            Time interval = TimeUtils.secondToTime(t /*(numOfEachLoop/ShipConstant.AVG_SHIP_CUSTOMERS)*/);
            //generate
            //当客运量满足需求或者船只全部用尽
            Time bound = TimeUtils.timeOperation("+", loopInterval, start);
            // bound = TimeUtils.timeOperation("-", bound, TimeUtils.secondToTime(wait_second));
            while (toNumber < toPrediction && !ships.isEmpty()) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                Ship ship = (Ship) ships.peek();
              /*  if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                    startTimeTemp = ship.getLateTime();
                }*/
                while (!isAvailableBerth(startTimeTemp, false)) {
                    startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                }
                if (equalOrAfter(bound, startTimeTemp)) break;
                ship = getShip(ships);
                //add to wait queue
                shipsWaiting.add(ship);

                toNumber += ship.getCapability();

                /*startTimeTemp =*/
                getGoList1(startTimeTemp, goIslandList, ship, true);
                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);

            }

            backTimeTemp = start;
            while (backNumber < backPrediction && equalOrAfter(actual_backTime, backTimeTemp)) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                Ship ship;
                //考虑岛内没有船 需空跑
                if (shipsWaiting.isEmpty()) {
                    ship = (Ship) ships.peek();
                 /*   if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                        startTimeTemp = ship.getLateTime();
                    }*/
                    Time tempTime = TimeUtils.timeOperation("-", backTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
                    //startTimeTemp = directGo(backTimeTemp, ship, bound);

                    while (!isAvailableBerth(backTimeTemp, true) || !isAvailableBerth(tempTime, false)) {
                        backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                        tempTime = TimeUtils.timeOperation("+", tempTime, interval);
                    }
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    directGo1(tempTime, goIslandList, ship, bound);
                    //末尾处理

                    ship = getShip(ships);
                    //18分20秒左右 相当于趟海路加上停泊上下船的
                    //backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                    //startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                } else {
                    ship = (Ship) shipsWaiting.peek();
                   /* if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                        backTimeTemp = ship.getLateTime();
                    }*/
                    while (!isAvailableBerth(backTimeTemp, true)) {
                        backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                    }
                    //末尾处理
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    ship = getShip(shipsWaiting);
                }

                backNumber += ship.getCapability();
                //total_back_traffic+=ship.getCapability();
                ships.add(ship);
                /*backTimeTemp = */
                getGoList1(backTimeTemp, goBackList, ship, false);
                backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
            }
            sortList(records, goIslandList, goBackList);
        }

        Time bound = Time.valueOf("23:59:59");
        Time interval = TimeUtils.secondToTime(wait_second);
        ArrayList<Record> goBackList = new ArrayList<>();
        ArrayList<Record> goIslandList = new ArrayList<>();
        int num1 = records.get(0).stream().mapToInt(e -> e.getShipTraffic()).sum();
        int total_back_traffic = records.get(1).stream().mapToInt(e -> e.getShipTraffic()).sum();
        while (total_back_traffic < num1) {
            Ship ship;
            if (shipsWaiting.isEmpty()) {
                ship = getShip(ships);
             /*   if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp))
                    startTimeTemp = ship.getLateTime();*/
                /*startTimeTemp = */
                Time tempTime = TimeUtils.timeOperation("-", backTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
                while (!isAvailableBerth(backTimeTemp, true) || !isAvailableBerth(tempTime, false)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                    tempTime = TimeUtils.timeOperation("-", tempTime, interval);
                }
                directGo1(backTimeTemp, goIslandList, ship, bound);
                //backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND /*+ wait_second*/));//TODO
                //startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
            } else {
                ship = getShip(shipsWaiting);
                while (!isAvailableBerth(backTimeTemp, true)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                }
               /* if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }*/
            }
            total_back_traffic += ship.getCapability();
            ships.add(ship);
            /*backTimeTemp =*/
            getGoList1(backTimeTemp, goBackList, ship, false);
            backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
        }
        //records.get(1).addAll(goBackList);
        sortList(records, goIslandList, goBackList);
        while (!testTimeFilter(records)) {
            timeFilter(records);
        }
        //filter with wait_second
        berthFilter(records, wait_second);
        return records;
    }

    private void addWaitingQueue(Ship ship, Heap<Ship> bigShipWaiting, Heap<Ship> smallShipWaiting, int bigCapability, int smallCapability) {
        if (ship.getCapability().equals(bigCapability)) {
            bigShipWaiting.add(ship);
        } else {
            smallShipWaiting.add(ship);
        }
    }

    /**
     * decide which type ship will be used
     *
     * @param b_ship
     * @param s_ship
     * @param left
     * @return
     */
    private Ship d_ship(Heap<Ship> b_ship, Heap<Ship> s_ship, int left) {
        if (b_ship.isEmpty()) return (Ship) s_ship.peek();
        else if (s_ship.isEmpty()) return (Ship) b_ship.peek();
        else {
            Ship bigShip = (Ship) b_ship.peek();
            Ship smallShip = (Ship) s_ship.peek();
            return Math.abs(left - bigShip.getCapability()) > Math.abs(left - smallShip.getCapability()) ? smallShip : bigShip;
        }
    }

    /**
     * return ship with 3 small ship and 1 big ship
     *
     * @param b_ship  big ship heap
     * @param s_ship  small ship heap
     * @param is_back go back or not go back
     * @return return will be chosen
     */
    private Ship d_ship(Heap<Ship> b_ship, Heap<Ship> s_ship, boolean is_back) {

        if (b_ship.isEmpty()) return (Ship) s_ship.peek();
        else if (s_ship.isEmpty()) return (Ship) b_ship.peek();
        else {
            if (is_back) {
                return (Ship) ((back_order + 1) % 4 == 0 ? b_ship.peek() : s_ship.peek());
            } else {
                return (Ship) ((order + 1) % 4 == 0 ? b_ship.peek() : s_ship.peek());
            }
        }
    }

    private Ship getShip(Ship ship, Heap<Ship> bigShips, Heap<Ship> smallShips, int bigCapability, int smallCapability) {
        Ship ship1;
        if (ship.getCapability().equals(bigCapability)) {
            ship1 = getShip(bigShips);
        } else {
            ship1 = getShip(smallShips);
        }
        return ship1;
    }

    private Ship getShip(Ship ship, Heap<Ship> bigShips, Heap<Ship> smallShips, int bigCapability, int smallCapability, boolean isBack) {
        Ship ship1;
        if (isBack) {
            back_order++;
        } else {
            order++;
        }

        if (ship.getCapability().equals(bigCapability)) {
            ship1 = getShip(bigShips);
        } else {
            ship1 = getShip(smallShips);
        }
        return ship1;
    }


    /**
     * sort go back list and go island list finally add together
     *
     * @param records final result
     * @param goBackList go back list
     * @param goIslandList go island list
     */
    private void sortList(ArrayList<ArrayList<Record>> records, ArrayList<Record> goIslandList, ArrayList<Record> goBackList) {
        goIslandList.sort(sortComparator);
        goBackList.sort(sortComparator);
        records.get(0).addAll(goIslandList);
        records.get(1).addAll(goBackList);
    }

    @Deprecated
    private Time directGo(Time timeTemp, Ship ship, Time bound) {

        Time delayTime1 = timeTemp;
        Time delayTime2 = timeTemp;

        Time earlyStartBusyTime = /*timeTemp*/TimeUtils.timeOperation("-", timeTemp, TimeUtils.secondToTime(wait_second));
        Time lateStartBusyTime = timeTemp;
        Time earlyArriveBusyTime = TimeUtils.timeOperation("+", timeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
        Time lateArriveBusyTime = TimeUtils.timeOperation("+", timeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));
        //find opt berth
        Berth startBerth = findBerth(startBerths, earlyStartBusyTime, lateStartBusyTime);
        Berth arriveBerth = findBerth(arriveBerths, earlyArriveBusyTime, lateArriveBusyTime);

        //功能分离set and getDelayTime
        delayTime1 = getDelayTime(earlyStartBusyTime, lateStartBusyTime, timeTemp, TimeUtils.secondToTime(wait_second), startBerth);
        delayTime2 = getDelayTime(earlyArriveBusyTime, lateArriveBusyTime, timeTemp, TimeUtils.secondToTime(wait_second), arriveBerth);
        if (equalOrAfter(bound, delayTime1) || equalOrAfter(bound, delayTime2) || equalOrAfter(bound, timeTemp))
            return timeTemp;
        setTimeBoundary(earlyStartBusyTime, lateStartBusyTime, timeTemp, TimeUtils.secondToTime(wait_second), startBerth);
        setTimeBoundary(earlyArriveBusyTime, lateArriveBusyTime, timeTemp, TimeUtils.secondToTime(wait_second), arriveBerth);

        if (delayTime1.after(timeTemp) && delayTime1.after(delayTime2)) {
            timeTemp = delayTime1;
        } else if (delayTime2.after(timeTemp)) {
            timeTemp = delayTime2;
            startBerth.setEarlyBusyTime(TimeUtils.timeOperation("-", delayTime2, TimeUtils.secondToTime(wait_second)));
            startBerth.setLateBusyTime(delayTime2);
        }

        return timeTemp;
    }

    private Time directGo1(Time timeTemp, List<Record> goList, Ship ship, Time bound) {
        Time earlyStartBusyTime = /*timeTemp*/TimeUtils.timeOperation("-", timeTemp, TimeUtils.secondToTime(wait_second));
        Time lateStartBusyTime = timeTemp;
        Time earlyArriveBusyTime = TimeUtils.timeOperation("+", timeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
        Time lateArriveBusyTime = TimeUtils.timeOperation("+", timeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));
        //find opt berth
        Berth startBerth = findBerth1(startBerths, earlyStartBusyTime, lateStartBusyTime);
        Berth arriveBerth = findBerth1(arriveBerths, earlyArriveBusyTime, lateArriveBusyTime);

        startBerth.getBusyTime().put(earlyStartBusyTime, lateStartBusyTime);
      /*  startBerth.setEarlyBusyTime(earlyStartBusyTime);
        startBerth.setLateBusyTime(lateStartBusyTime);*/
        //因为arriveBerth 会被作为startBerth 使用，在那个时候设置busyTime time比较好
        //arriveBerth.getBusyTime().put(earlyArriveBusyTime,lateArriveBusyTime);
      /*  arriveBerth.setEarlyBusyTime(earlyArriveBusyTime);
        arriveBerth.setLateBusyTime(lateArriveBusyTime);*/
        Record record = new RecordBuilder().setId(KeyUtils.genUniqueKey()).setStartTime(lateStartBusyTime).setArriveTime(earlyArriveBusyTime)
                .setOnOrOutTime(TimeUtils.secondToTime(wait_second)).setDate(new Date(System.currentTimeMillis()))
                .setShipTraffic(ship.getCapability()).setTotalTime(TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second))
                .setStartBerth(Integer.parseInt(startBerth.getName())).setArriveBerth(Integer.parseInt(arriveBerth.getName()))
                .createRecord();
        goList.add(record);
        return timeTemp;
    }

    /**
     * deal with bug ,11:00 in last loop and 11:00 in first of this loop
     *
     * @param bound
     * @param delayTime1
     * @return
     */
    private boolean equalOrAfter(Time bound, Time delayTime1) {
        return delayTime1.after(bound) || delayTime1.equals(bound);
    }

    /**
     * get go list
     *
     * @param startTimeTemp
     * @param goIslandList
     * @param ship
     * @return
     */
    @Deprecated
    private Time getGoList(Time startTimeTemp, ArrayList<Record> goIslandList, Ship ship, Boolean to_island) {
//        int second = ship.getCapability() * 2;

        //busy time of berth
        //2 interval
        Time earlyStartBusyTime = TimeUtils.timeOperation("-", startTimeTemp, TimeUtils.secondToTime(wait_second));
        Time lateStartBusyTime = startTimeTemp;
        Time earlyArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
        Time lateArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));

        //find opt berth
        Berth startBerth;
        Berth arriveBerth;
        if (to_island) {
            startBerth = findBerth(startBerths, earlyStartBusyTime, lateStartBusyTime);
            arriveBerth = findBerth(arriveBerths, earlyArriveBusyTime, lateArriveBusyTime);
        } else {
            startBerth = findBerth(arriveBerths, earlyStartBusyTime, lateStartBusyTime);
            arriveBerth = findBerth(startBerths, earlyArriveBusyTime, lateArriveBusyTime);
        }

        Time startTimeTemp1 = startTimeTemp;

        Time delayTime1 = getDelayTime(earlyStartBusyTime, lateStartBusyTime, startTimeTemp, TimeUtils.secondToTime(wait_second), startBerth);
        if (delayTime1.after(startTimeTemp)) startTimeTemp = delayTime1;

        Time levelTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
        Time delayTime2 = getDelayTime(earlyArriveBusyTime, lateArriveBusyTime, levelTimeTemp, TimeUtils.secondToTime(wait_second), arriveBerth);
        if (TimeUtils.timeOperation("-", delayTime2, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND)).after(startTimeTemp))
            startTimeTemp = TimeUtils.timeOperation("-", delayTime2, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));

        if (startTimeTemp.after(startTimeTemp1)) {
            earlyStartBusyTime = TimeUtils.timeOperation("-", startTimeTemp, TimeUtils.secondToTime(wait_second));
            lateStartBusyTime = startTimeTemp;
            earlyArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
            lateArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));
        }

        setTimeBoundary(earlyStartBusyTime, lateStartBusyTime, startTimeTemp, TimeUtils.secondToTime(wait_second), startBerth);
        setTimeBoundary(earlyArriveBusyTime, lateArriveBusyTime, startTimeTemp, TimeUtils.secondToTime(wait_second), arriveBerth);

        RecordParams recordParams = new RecordParams(startBerth, arriveBerth, wait_second, ship, ship.getCapability(), delayTime2, startTimeTemp, date);
        Record record1 = new Record(recordParams);
        goIslandList.add(record1);

        ship.setLateTime(lateArriveBusyTime);
        return startTimeTemp;
    }

    private Time getGoList1(Time startTimeTemp, ArrayList<Record> goIslandList, Ship ship, Boolean to_island) {
        Time delayTime2 = startTimeTemp;
        Time earlyStartBusyTime = TimeUtils.timeOperation("-", startTimeTemp, TimeUtils.secondToTime(wait_second));
        Time lateStartBusyTime = startTimeTemp;
        Time earlyArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
        Time lateArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));

        //find opt berth
        Berth startBerth;
        Berth arriveBerth;
        if (to_island) {
            startBerth = findBerth1(startBerths, earlyStartBusyTime, lateStartBusyTime);
            arriveBerth = findBerth1(arriveBerths, earlyArriveBusyTime, lateArriveBusyTime);
        } else {
            startBerth = findBerth1(arriveBerths, earlyStartBusyTime, lateStartBusyTime);
            arriveBerth = findBerth1(startBerths, earlyArriveBusyTime, lateArriveBusyTime);
        }
        startBerth.getBusyTime().put(earlyStartBusyTime, lateStartBusyTime);
    /*    startBerth.setEarlyBusyTime(earlyStartBusyTime);
        startBerth.setLateBusyTime(lateStartBusyTime);*/
        arriveBerth.getBusyTime().put(earlyArriveBusyTime, lateArriveBusyTime);
    /*    arriveBerth.setEarlyBusyTime(earlyArriveBusyTime);
        arriveBerth.setLateBusyTime(lateArriveBusyTime);*/
        //RecordParams recordParams = new RecordParams(startBerth, arriveBerth, wait_second, ship, ship.getCapability(), delayTime2, startTimeTemp, date);
        //Record record1 = new Record(recordParams);
        Record record1 = new RecordBuilder().setId(KeyUtils.genUniqueKey())
                .setStartBerth(Integer.parseInt(startBerth.getName())).setArriveBerth(Integer.parseInt(arriveBerth.getName()))
                .setShipName(ship.getName()).setShipTraffic(ship.getCapability()).setStartTime(lateStartBusyTime).setArriveTime(earlyArriveBusyTime)
                .setOnOrOutTime(TimeUtils.secondToTime(wait_second)).setTotalTime(TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second))
                .setDate(new Date(System.currentTimeMillis())).createRecord();
        goIslandList.add(record1);
        return startTimeTemp;
    }


    /**
     * set berth boundary and return delayTime and add berth freq
     *
     * @param earlyTimeBoundary
     * @param lateTimeBoundary
     * @param startTime
     * @param interval
     * @param berth
     * @return
     */
    @Deprecated
    private void setTimeBoundary(Time earlyTimeBoundary, Time lateTimeBoundary, Time startTime, Time interval, Berth berth) {
        Time delayTime = startTime;
        if (Objects.isNull(berth.getEarlyBusyTime()) && Objects.isNull(berth.getLateBusyTime())) {
            //berth is never be used
            berth.setEarlyBusyTime(earlyTimeBoundary);
            berth.setLateBusyTime(lateTimeBoundary);
        } else if (checkTimeBoundary(berth.getEarlyBusyTime(), berth.getLateBusyTime(), lateTimeBoundary)) {
            // when berth is be used, the ship should wait until the berth is available
            //case A when ship wants to get in berth, the berth has already been used
            //solution: put off the time for getting in berth until the berth is available
            delayTime = TimeUtils.timeOperation("+", TimeUtils.timeOperation("-", berth.getLateBusyTime(), earlyTimeBoundary), delayTime);
            berth.setEarlyBusyTime(berth.getLateBusyTime());
            berth.setLateBusyTime(TimeUtils.timeOperation("+", berth.getLateBusyTime(), interval));
        } else if (checkTimeBoundary(berth.getEarlyBusyTime(), berth.getLateBusyTime(), earlyTimeBoundary)) {
            //case B when ship wants to get in berth, the berth will be used for other ship in plan
            // solution like case A
            delayTime = TimeUtils.timeOperation("+", TimeUtils.timeOperation("-", interval, TimeUtils.timeOperation("-", lateTimeBoundary, berth.getLateBusyTime())), delayTime);
            berth.setEarlyBusyTime(berth.getLateBusyTime());
            berth.setLateBusyTime(TimeUtils.timeOperation("+", berth.getLateBusyTime(), interval));
        } else {
            berth.setEarlyBusyTime(earlyTimeBoundary);
            berth.setLateBusyTime(lateTimeBoundary);
        }
        berth.freqAdd();
        // return delayTime;
    }

    private Time getDelayTime(Time earlyTimeBoundary, Time lateTimeBoundary, Time startTime, Time interval, Berth berth) {
        Time delayTime = startTime;
        if (Objects.isNull(berth.getEarlyBusyTime()) && Objects.isNull(berth.getLateBusyTime())) {
            //berth is never be used
            berth.setEarlyBusyTime(earlyTimeBoundary);
            berth.setLateBusyTime(lateTimeBoundary);
        } else if (checkTimeBoundary(berth.getEarlyBusyTime(), berth.getLateBusyTime(), lateTimeBoundary)) {
            // when berth is be used, the ship should wait until the berth is available
            //case A when ship wants to get in berth, the berth has already been used
            //solution: put off the time for getting in berth until the berth is available
            delayTime = TimeUtils.timeOperation("+", TimeUtils.timeOperation("-", berth.getLateBusyTime(), earlyTimeBoundary), delayTime);
        } else if (checkTimeBoundary(berth.getEarlyBusyTime(), berth.getLateBusyTime(), earlyTimeBoundary)) {
            //case B when ship wants to get in berth, the berth will be used for other ship in plan
            // solution like case A
            delayTime = TimeUtils.timeOperation("+", TimeUtils.timeOperation("-", interval, TimeUtils.timeOperation("-", lateTimeBoundary, berth.getLateBusyTime())), delayTime);
        }
        return delayTime;
    }

    /**
     * get ship and auto sort them
     *
     * @param ships
     * @return
     */
    private Ship getShip(Heap<Ship> ships) {
        Ship ship = (Ship) ships.remove();
        ship.increaseFreq();
//        ships.add(ship);
        return ship;
    }

    /**
     * check the time given is in time interval
     *
     * @param earlyTimeBoundary early Time Boundary
     * @param lateTimeBoundary late Time Boundary
     * @param now current time
     * @return in time interval or not
     */
    private boolean checkTimeBoundary(Time earlyTimeBoundary, Time lateTimeBoundary, Time now) {
        return now.after(earlyTimeBoundary) && now.before(lateTimeBoundary);
    }

    /**
     * calculate how many ship will be used in the loop
     *
     * @param left        remain ship num to send
     * @param start_index ship list go like 100 100 100 200
     * @return ship will be used
     */
    private int getShipNum(int left, int start_index) {
        int add = 0, n = 0;
        while (add < left) {
            n++;
            start_index++;
            add = start_index % 4 == 0 ? add + ShipConstant.BIGSHIPCAPABILITY : add + ShipConstant.SMALLSHIPCAPABILITY;
        }
        return n;
    }

    /***
     *  get start index of
     * @param records records contains 4 elements
     * @return
     */
    private int getStartIndex(List<Record> records) {
        int before_start_index = 0;
        for (int i = 0; i < records.size(); i++) {
            if (records.get(i).getShipTraffic().equals(ShipConstant.BIGSHIPCAPABILITY)) {
                before_start_index = i;
                break;
            }
        }
        return (before_start_index + 1) % 4;
    }

    private boolean isAvailableBerth(Time startTimeTemp, boolean isback) {
        Time earlyStartBusyTime = TimeUtils.timeOperation("-", startTimeTemp, TimeUtils.secondToTime(wait_second));
        Time lateStartBusyTime = startTimeTemp;
        Time earlyArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
        Time lateArriveBusyTime = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));
        int i1 = 0, i2 = 0;
        List<Berth> startBerths, arriveBerths;
        startBerths = isback ? this.arriveBerths : this.startBerths;
        arriveBerths = isback ? this.startBerths : this.arriveBerths;
        for (Berth berth : startBerths) {
            if (berth.can_book(earlyStartBusyTime, lateStartBusyTime)) {
                i1++;
            }
        }

        for (Berth berth : arriveBerths) {
            if (berth.can_book(earlyArriveBusyTime, lateArriveBusyTime)) {
                i2++;
            }
        }
        return i1 != 0 && i2 != 0;
    }
}

