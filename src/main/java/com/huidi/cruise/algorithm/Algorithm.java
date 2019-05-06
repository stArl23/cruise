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
        this.loopInterval = TimeUtils.secondToTime(AlgorithmConstant.LOOP_SECOND * 2);
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
     * 寻找最优码头，如果有多个可供选择码头，选择使用次数最少的码头(注意需要和isAvailableBerthNum一起使用)
     * @param berths berth list will be chosen
     * @param earlyBusyTime early bound time
     * @param lateBusyTime  late bound time
     * @return berth
     */
    private Berth findBerth(ArrayList<Berth> berths, Time earlyBusyTime, Time lateBusyTime) {
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
        if (Objects.nonNull(tempBerth))
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
     * @param records list of go back list and go island list
     */
    @Deprecated
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

    @Deprecated
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
        for (Berth berth : berths) {
            ArrayList<Record> tempList = new ArrayList<>();
            for (Record record : recordList) {
                if (record.getStartBerth().equals(Integer.parseInt(berth.getName()))
                        || record.getArriveBerth().equals(Integer.parseInt(berth.getName()))) {
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
    //bug 1 最大的问题就是两个 loop之间，如果前面最后一班出发时间和第二个loop的第一班出发时间撞车 fixed
    //bug 2 时间段拉长后有些时间段有将近一半没有利用
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
        int loopNumber = TimeUtils.timeToSecond(TimeUtils.timeOperation("-", endTime, startTime)) / TimeUtils.timeToSecond(loopInterval);
        int total_back_traffic;
        //generate interval list
        Time start = startTime;
        Time startTimeTemp = start;
        Time backTimeTemp = start;

        for (int i = 0; i < loopNumber; i++) {
            int toNumber = 0;
            int backNumber = 0;
            int toPrediction = 0/*i > 19 ? 0 : Model.model(number, i)*/;
            int backPrediction = 0/*i <= 1 ? 0 : Model.model(number, i - 2)*/;
            //必须为整数
            int rate_l = TimeUtils.timeToSecond(this.loopInterval) / AlgorithmConstant.LOOP_SECOND;
            for (int j = 0; j < rate_l && i * rate_l + j < Model.size(); j++) {
                int index = i * rate_l + j;
                toPrediction += index > 19 ? 0 : Model.model(number, index);
                backPrediction = index <= 1 ? 0 : Model.model(number, index - 2);
            }
            if (i != 0)
                start = TimeUtils.timeOperation("+", start, loopInterval);

            ArrayList<Record> goIslandList = new ArrayList<>();
            ArrayList<Record> goBackList = new ArrayList<>();

            int size = records.get(0).size();
            int start_index = size < 4 ? size : getStartIndex(records.get(0).subList(size - 4, size));
            int number_of_ship = getShipNum(toPrediction, start_index);/*toPrediction % ShipConstant.AVG_SHIP_CUSTOMERS > 0 ? toPrediction / ShipConstant.AVG_SHIP_CUSTOMERS + 1 : toPrediction / ShipConstant.AVG_SHIP_CUSTOMERS;*/
            Time interval = number_of_ship > 0 ? TimeUtils.secondToTime((TimeUtils.timeToSecond(loopInterval) / number_of_ship) / 60 * 60 /*- wait_second*/) : TimeUtils.secondToTime(wait_second);//max 1800s

            startTimeTemp = start;
            backTimeTemp = start;
            //generate
            //当客运量满足需求或者船只全部用尽

            Time bound = TimeUtils.timeOperation("+", loopInterval, start);
            //bound = TimeUtils.timeOperation("-", bound, TimeUtils.secondToTime(wait_second));
            while (toNumber < toPrediction /*&& !ships.isEmpty()*//*(!bigShipHeap.isEmpty() || !smallShipHeap.isEmpty())*/) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                //Ship ship = (Ship) ships.peek();
                Ship ship;
                if (bigShipHeap.isEmpty() && smallShipHeap.isEmpty()) {
                    ship = (Ship) d_ship(bigWaitingShipHeap, smallWaitingShipHeap, true);
                    Time tempTime = TimeUtils.timeOperation("-", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
                    while (isAvailableBerth(startTimeTemp, false) || isAvailableBerth(tempTime, true)) {
                        startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                        tempTime = TimeUtils.timeOperation("+", tempTime, interval);
                    }
                    if (equalOrAfter(bound, startTimeTemp)) break;
                    /*startTimeTemp = */
                    //调船
                    directGo(tempTime, goBackList, ship, true);
                    //末尾处理
                    ship = getShip(ship, bigWaitingShipHeap, smallWaitingShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, true);
                } else {
                    ship = (Ship) d_ship(bigShipHeap, smallShipHeap, false);
                    while (isAvailableBerth(startTimeTemp, false)) {
                        startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                    }
                    if (equalOrAfter(bound, startTimeTemp)) break;
                    //ship = getShip(ships);
                    ship = getShip(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, false);
                }

                //add to wait queue
                addWaitingQueue(ship, bigWaitingShipHeap, smallWaitingShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY);
                //shipsWaiting.add(ship);

                /*startTimeTemp = */
                getGoList(startTimeTemp, goIslandList, ship, true);

                toNumber += ship.getCapability();

                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
            }

            size = records.get(1).size();
            start_index = size < 4 ? size : getStartIndex(records.get(1).subList(size - 4, size));
            number_of_ship = getShipNum(backPrediction, start_index);
            interval = number_of_ship > 0 ? TimeUtils.secondToTime((TimeUtils.timeToSecond(loopInterval) / number_of_ship) / 60 * 60/*- wait_second*/) : TimeUtils.secondToTime(wait_second);
            while (backNumber < backPrediction) {
                Ship ship;

                //考虑岛内没有船 需空跑
                if (bigWaitingShipHeap.isEmpty() && smallWaitingShipHeap.isEmpty()) {
                    ship = d_ship(bigShipHeap, smallShipHeap, false);

                    Time tempTime = TimeUtils.timeOperation("-", backTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
                    while (isAvailableBerth(backTimeTemp, true) || isAvailableBerth(tempTime, false)) {
                        backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                        tempTime = TimeUtils.timeOperation("+", tempTime, interval);
                    }
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    /*startTimeTemp = */
                    //调船
                    directGo(tempTime, goIslandList, ship, false);
                    //末尾处理
                    ship = getShip(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, false);
                } else {
                    ship = d_ship(bigWaitingShipHeap, smallWaitingShipHeap, true);
                    /*if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                        backTimeTemp = ship.getLateTime();
                    }*/
                    //末尾处理
                    while (isAvailableBerth(backTimeTemp, true)) {
                        backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                    }
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    //ship = getShip(shipsWaiting);
                    ship = getShip(ship, bigWaitingShipHeap, smallWaitingShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, true);
                }

                backNumber += ship.getCapability();
                addWaitingQueue(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY);
                getGoList(backTimeTemp, goBackList, ship, false);
                backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
            }
            sortList(records, goIslandList, goBackList);
        }

        Time bound = Time.valueOf("23:59:59");
        Time interval = TimeUtils.secondToTime(wait_second);
        ArrayList<Record> goBackList = new ArrayList<>();
        ArrayList<Record> goIslandList = new ArrayList<>();
        int num1 = records.get(0).stream().mapToInt(Record::getShipTraffic).sum();
        total_back_traffic = records.get(1).stream().mapToInt(Record::getShipTraffic).sum();
        while (total_back_traffic < num1) {
            Ship ship;
            if (bigWaitingShipHeap.isEmpty() && smallWaitingShipHeap.isEmpty()) {
                ship = d_ship(bigShipHeap, smallShipHeap, true);
                Time tempTime = TimeUtils.timeOperation("-", backTimeTemp, TimeUtils.secondToTime(wait_second));
                while (isAvailableBerth(backTimeTemp, true) || isAvailableBerth(tempTime, false)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                    tempTime = TimeUtils.timeOperation("+", tempTime, interval);
                }


                ship = getShip(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, true);

                directGo(tempTime, goIslandList, ship, false);
            } else {
                ship = d_ship(bigWaitingShipHeap, smallWaitingShipHeap, true);
                while (isAvailableBerth(backTimeTemp, true)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                }
                ship = getShip(ship, bigWaitingShipHeap, smallWaitingShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY, true);
            }
            total_back_traffic += ship.getCapability();

            getGoList(backTimeTemp, goBackList, ship, false);
            addWaitingQueue(ship, bigShipHeap, smallShipHeap, ShipConstant.BIGSHIPCAPABILITY, ShipConstant.SMALLSHIPCAPABILITY);
            backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
        }
        sortList(records, goIslandList, goBackList);
        //two pruning conditions
     /*   while (!testTimeFilter(records)) {
            timeFilter(records);
        }*/

//        berthFilter(records, wait_second);
        return records;
    }

    /***
     * find max，不使用大小船堆优化
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
        int loopNumber = TimeUtils.timeToSecond(TimeUtils.timeOperation("-", endTime, startTime)) / TimeUtils.timeToSecond(this.loopInterval);
        //generate interval list
        Time start = startTime;
        Time startTimeTemp;
        Time backTimeTemp = start;
        Time actual_backTime = TimeUtils.timeOperation("+", startTime, this.loopInterval);

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
            int t = wait_second;
            Time interval = TimeUtils.secondToTime(t);
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
                while (isAvailableBerth(startTimeTemp, false)) {
                    startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                }
                if (equalOrAfter(bound, startTimeTemp)) break;
                ship = getShip(ships);
                //add to wait queue
                shipsWaiting.add(ship);

                toNumber += ship.getCapability();

                /*startTimeTemp =*/
                getGoList(startTimeTemp, goIslandList, ship, true);
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

                    while (isAvailableBerth(backTimeTemp, true) || isAvailableBerth(tempTime, false)) {
                        backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                        tempTime = TimeUtils.timeOperation("+", tempTime, interval);
                    }
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    directGo(tempTime, goIslandList, ship, false);
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
                    while (isAvailableBerth(backTimeTemp, true)) {
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
                getGoList(backTimeTemp, goBackList, ship, false);
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
                while (isAvailableBerth(backTimeTemp, true) || isAvailableBerth(tempTime, false)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                    tempTime = TimeUtils.timeOperation("-", tempTime, interval);
                }
                directGo(backTimeTemp, goIslandList, ship, false);
                //backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND /*+ wait_second*/));//TODO
                //startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
            } else {
                ship = getShip(shipsWaiting);
                while (isAvailableBerth(backTimeTemp, true)) {
                    backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                }
               /* if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }*/
            }
            total_back_traffic += ship.getCapability();
            ships.add(ship);
            /*backTimeTemp =*/
            getGoList(backTimeTemp, goBackList, ship, false);
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

    /**
     * ship direct go to the out of island
     *
     * @param timeTemp start time
     * @param goList   go island list
     * @param ship     ship is be selected
     * @param isBack go back or not
     */
    private void directGo(Time timeTemp, List<Record> goList, Ship ship, boolean isBack) {
        Time earlyStartBusyTime = /*timeTemp*/TimeUtils.timeOperation("-", timeTemp, TimeUtils.secondToTime(wait_second));
        Time lateStartBusyTime = timeTemp;
        Time earlyArriveBusyTime = TimeUtils.timeOperation("+", timeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND));
        Time lateArriveBusyTime = TimeUtils.timeOperation("+", timeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));
        //find opt berth
        Berth startBerth;
        Berth arriveBerth;
        if (!isBack) {
            startBerth = findBerth(startBerths, earlyStartBusyTime, lateStartBusyTime);
            arriveBerth = findBerth(arriveBerths, earlyArriveBusyTime, lateArriveBusyTime);
        } else {
            startBerth = findBerth(arriveBerths, earlyStartBusyTime, lateStartBusyTime);
            arriveBerth = findBerth(startBerths, earlyArriveBusyTime, lateArriveBusyTime);
        }


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
                .setShipName(ship.getName()).createRecord();
        goList.add(record);
    }

    /**
     * deal with bug ,11:00 in last loop and 11:00 in first of this loop
     *
     * @param bound time bound can later than
     * @param currentTime current time
     * @return agree with conditions or not
     */
    private boolean equalOrAfter(Time bound, Time currentTime) {
        return currentTime.after(bound) || currentTime.equals(bound);
    }

    /**
     * set go list and berth status
     *
     * @param startTimeTemp time of ship set off from start berth
     * @param goIslandList record list of ship go to island
     * @param ship ship is selected
     */
    private void getGoList(Time startTimeTemp, ArrayList<Record> goIslandList, Ship ship, Boolean to_island) {
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
    }


    /**
     * get ship and auto sort them
     *
     * @param ships ship heap
     * @return ship will be selected
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
     * @return index of start ship(100:0 100:1 100:2 200:3)
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
        return i1 == 0 || i2 == 0;
    }
}

