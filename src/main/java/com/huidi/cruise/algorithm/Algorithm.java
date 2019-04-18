package com.huidi.cruise.algorithm;

import com.huidi.cruise.algorithm.model.Model;
import com.huidi.cruise.constant.AlgorithmConstant;
import com.huidi.cruise.constant.ShipConstant;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.utils.TimeUtils;

import java.sql.Date;
import java.sql.Time;
import java.util.*;

public class Algorithm {
    //平均每趟走130人（大小船发船均次）
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


    public Algorithm(java.sql.Date date, Time startTime, Time endTime, ArrayList<Berth> startBerths, ArrayList<Berth> arriveBerths, ArrayList<Ship> bigShips, ArrayList<Ship> smallShips, Integer wait_second) {
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

        this.shipComparator = Comparator.comparingInt(o -> o.getPriority() * o.getFreq());
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

    //bug 选择码头时多次选择最后一个码头， 要区别优先级，可用码头要先选而不是选延迟码头
    private Berth findBerth(ArrayList<Berth> berths, Time earlyBusyTime, Time lateBusyTime) {
        Time temp = Time.valueOf("23:59:59");
        Berth tempBerth = null;
        Boolean flag = false;
        for (Berth berth : berths) {
            // find a berth is available during this period of time
            if (Objects.isNull(berth.getEarlyBusyTime()) || (berth.getLateBusyTime().before(earlyBusyTime) || berth.getEarlyBusyTime().after(lateBusyTime))) {
                if (Objects.isNull(tempBerth) || berth.getFreq() < tempBerth.getFreq()) {
                    tempBerth = berth;
                    flag = true;
                }

            } else {
                //if no berth is available, find a berth which can make ship wait the least time
                if (flag) continue;
                if (temp.after(berth.getLateBusyTime())) {
                    temp = berth.getLateBusyTime();
                    tempBerth = berth;
                }
            }
        }
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
            berth.setFreq(0);
        }

        for (Berth berth : arriveBerths) {
            berth.setEarlyBusyTime(null);
            berth.setLateBusyTime(null);
            berth.setFreq(0);
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

    /**
     * Basic findOpt
     * 返回来和回的序列，使用共同堆
     * @param number
     * @return
     */
    //目前最大13300
    //bug 1 最大的问题就是两个 loop之间，如果前面最后一班出发时间和第二个loop的第一班出发时间撞车
    public ArrayList<ArrayList<Record>> findOpt(int number) {
        //prepare data
        updateShips(ships, AlgorithmConstant.STANDRATE);
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

            int number_of_ship = toPrediction % ShipConstant.AVG_SHIP_CUSTOMERS > 0 ? toPrediction / ShipConstant.AVG_SHIP_CUSTOMERS + 1 : toPrediction / ShipConstant.AVG_SHIP_CUSTOMERS;
            Time interval = number_of_ship > 0 ? TimeUtils.secondToTime(AlgorithmConstant.LOOP_SECOND / number_of_ship - wait_second) : TimeUtils.secondToTime(wait_second);//max 1800s

            startTimeTemp = start;
            backTimeTemp = start;
            //generate
            //当客运量满足需求或者船只全部用尽
            Time bound = TimeUtils.timeOperation("+", loopInterval, start);
            bound = TimeUtils.timeOperation("-", bound, TimeUtils.secondToTime(wait_second));
            while (toNumber < toPrediction && !ships.isEmpty()) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                Ship ship = (Ship) ships.peek();
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                    startTimeTemp = ship.getLateTime();
                }
                if (equalOrAfter(bound, startTimeTemp)) break;
                ship = getShip(ships);
                //add to wait queue
                shipsWaiting.add(ship);

                startTimeTemp = getGoList(startTimeTemp, goIslandList, ship, true);

                toNumber += ship.getCapability();

                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);

            }

            while (backNumber < backPrediction) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                Ship ship;
                //考虑岛内没有船 需空跑
                if (shipsWaiting.isEmpty()) {
                    ship = (Ship) ships.peek();
                    if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                        startTimeTemp = ship.getLateTime();
                    }
                    startTimeTemp = directGo(backTimeTemp, ship, bound);
                    //末尾处理
                    if (equalOrAfter(bound, startTimeTemp)) break;
                    ship = getShip(ships);
                    //18分20秒左右 相当于趟海路加上停泊上下船的
                    backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                    startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                } else {
                    ship = (Ship) shipsWaiting.peek();
                    if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                        backTimeTemp = ship.getLateTime();
                    }
                    //末尾处理
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    ship = getShip(shipsWaiting);
                }

                backNumber += ship.getCapability();
                //total_back_traffic+=ship.getCapability();
                ships.add(ship);
                backTimeTemp = getGoList(backTimeTemp, goBackList, ship, false);
                backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
            }
            sortList(records, goIslandList, goBackList);
        }

        Time bound = Time.valueOf("23:59:59");
        Time interval = Time.valueOf("00:05:00");
        ArrayList<Record> goBackList = new ArrayList<>();
        int num1 = records.get(0).stream().mapToInt(e -> e.getShipTraffic()).sum();
        total_back_traffic = records.get(1).stream().mapToInt(e -> e.getShipTraffic()).sum();
        while (total_back_traffic < num1) {
            Ship ship;
            if (shipsWaiting.isEmpty()) {
                ship = getShip(ships);
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp))
                    startTimeTemp = ship.getLateTime();
                startTimeTemp = directGo(backTimeTemp, ship, bound);
                backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
            } else {
                ship = getShip(shipsWaiting);
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }
            }
            total_back_traffic += ship.getCapability();
            ships.add(ship);
            backTimeTemp = getGoList(backTimeTemp, goBackList, ship, false);
            backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
        }
        records.get(1).addAll(goBackList);
        //two pruning conditions
        while (!testTimeFilter(records)) {
            //recordsList.add((ArrayList<ArrayList<Record>>) records.clone());
            timeFilter(records);
        }
        return records;
    }

    /***
     * find max，使用大小船堆优化
     * @return
     */
    /*public ArrayList<ArrayList<Record>> findMax() {
        //prepare data
        Heap<Ship> bigShips, smallShips, bigWaitingShips, smallWaitingShips;
        bigShips = new Heap<>(this.bigShips.size(), this.shipComparator);
        smallShips = new Heap<>(this.smallShips.size(), this.shipComparator);
        smallWaitingShips = new Heap<>(this.smallShips.size(), this.shipComparator);
        bigWaitingShips = new Heap<>(this.bigShips.size(), this.shipComparator);
        updateBigShip(bigShips, AlgorithmConstant.OVERCROWDRATE);
        updateSmallShip(smallShips, AlgorithmConstant.OVERCROWDRATE);
        updateBerths();
        ArrayList<ArrayList<Record>> records = new ArrayList<>();
        updateRecords(records, new ArrayList<>(), new ArrayList<>());
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

            int toPrediction = i > 19 ? 0 : Model.model(13000, i);
            int backPrediction = i <= 1 ? 0 : Model.model(13000, i - 2);
            if (i != 0)
                start = TimeUtils.timeOperation("+", start, loopInterval);

            ArrayList<Record> goIslandList = new ArrayList<>();
            ArrayList<Record> goBackList = new ArrayList<>();
            //int number_of_ship=toPrediction%ShipConstant.AVG_SHIP_CUSTOMERS>0?toPrediction/ShipConstant.AVG_SHIP_CUSTOMERS+1:toPrediction/ShipConstant.AVG_SHIP_CUSTOMERS;
            //Time interval = number_of_ship>0?TimeUtils.secondToTime(1800 /number_of_ship-wait_second):TimeUtils.secondToTime(wait_second);//max 1800s
            Time interval = TimeUtils.secondToTime(wait_second);//fixed

            startTimeTemp = start;
            //generate
            //当客运量满足需求或者船只全部用尽
            Time bound = TimeUtils.timeOperation("+", loopInterval, start);
            bound = TimeUtils.timeOperation("-", bound, TimeUtils.secondToTime(wait_second));
            //大小船均不空
            toPrediction = toPrediction > 1000 ? 1000 : toPrediction;
            while (toNumber < toPrediction) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                Ship ship;
                if (bigShips.isEmpty() && smallShips.isEmpty()) {
                    ship = d_ship(bigWaitingShips, smallWaitingShips, toPrediction - toNumber);
                    if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                        startTimeTemp = ship.getLateTime();
                    }
                    startTimeTemp = directGo(startTimeTemp, ship, bound);
                    if (equalOrAfter(bound, startTimeTemp)) break;
                    ship = getShip(ship, bigWaitingShips, smallWaitingShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
                    //backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));
                    startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                } else {
                    ship = d_ship(bigShips, smallShips, toPrediction - toNumber);
                    if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                        startTimeTemp = ship.getLateTime();
                    }
                    if (equalOrAfter(bound, startTimeTemp)) break;
                    //add to wait queue
                    ship = getShip(ship, bigShips, smallShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
                }
                addWaitingQueue(ship, bigWaitingShips, smallWaitingShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
                toNumber += ship.getCapability();
                startTimeTemp = getGoList(startTimeTemp, goIslandList, ship, true);
                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
            }

            backTimeTemp = start;
            while (backNumber < backPrediction && (!bigWaitingShips.isEmpty() || !smallWaitingShips.isEmpty())) {
                Ship ship = d_ship(bigWaitingShips, smallWaitingShips, backPrediction - backNumber);
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }
                //末尾处理
                if (equalOrAfter(bound, backTimeTemp)) break;
                ship = getShip(ship, bigWaitingShips, smallWaitingShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
                backNumber += ship.getCapability();
                //total_back_traffic+=ship.getCapability();
                addWaitingQueue(ship, bigShips, smallShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
                backTimeTemp = getGoList(backTimeTemp, goBackList, ship, false);
                backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
            }
            sortList(records, goIslandList, goBackList);
        }

        Time bound = TimeUtils.secondToTime(TimeUtils.timeToSecond(endTime) + AlgorithmConstant.LOOP_SECOND * 4);
        Time interval = TimeUtils.secondToTime(wait_second);
        ArrayList<Record> goBackList = new ArrayList<>();
        total_back_traffic = records.get(1).stream().mapToInt(e -> e.getShipTraffic()).sum();
        int number = records.get(0).stream().mapToInt(e -> e.getShipTraffic()).sum();

        while (total_back_traffic < number && backTimeTemp.before(bound)) {
            Ship ship;
            if (bigWaitingShips.isEmpty() && smallWaitingShips.isEmpty()) {
                ship = d_ship(bigShips, smallShips, number - total_back_traffic);
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }
                backTimeTemp = directGo(backTimeTemp, ship, bound);
                //backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                //backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
                ship = getShip(ship, bigShips, smallShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
            } else {
                ship = d_ship(bigWaitingShips, smallWaitingShips, number - total_back_traffic);
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }
                ship = getShip(ship, bigWaitingShips, smallWaitingShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
            }
            total_back_traffic += ship.getCapability();
            addWaitingQueue(ship, bigShips, smallShips, (int) (200 * AlgorithmConstant.OVERCROWDRATE), (int) (100 * AlgorithmConstant.OVERCROWDRATE));
            backTimeTemp = getGoList(backTimeTemp, goBackList, ship, false);
            backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
        }
        records.get(1).addAll(goBackList);
        //two pruning conditions
        while (!testTimeFilter(records)) {
            //recordsList.add((ArrayList<ArrayList<Record>>) records.clone());
            timeFilter(records);
        }
        return records;
    }*/
    public ArrayList<ArrayList<Record>> findMax(int number) {
        //prepare data
        updateShips(ships, AlgorithmConstant.OVERCROWDRATE);
        updateShips(shipsWaiting, AlgorithmConstant.OVERCROWDRATE);
        updateBerths();
        ArrayList<ArrayList<Record>> records = new ArrayList<>();
        updateRecords(records, new ArrayList<>(), new ArrayList<>());

        Time loopInterval = this.loopInterval;
        int loopNumber = TimeUtils.timeToSecond(TimeUtils.timeOperation("-", endTime, startTime)) / AlgorithmConstant.LOOP_SECOND;
        //generate interval list
        Time start = startTime;
        Time startTimeTemp = start;
        Time backTimeTemp = start;
        Time actuall_backTime = TimeUtils.timeOperation("+", startTime, TimeUtils.secondToTime(AlgorithmConstant.LOOP_SECOND * 2));

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
            int t = (AlgorithmConstant.LOOP_SECOND / (numOfEachLoop / 100)) / 60 * 60;
            Time interval = TimeUtils.secondToTime(t > 60 ? t : 60);
            //generate
            //当客运量满足需求或者船只全部用尽
            Time bound = TimeUtils.timeOperation("+", loopInterval, start);
            bound = TimeUtils.timeOperation("-", bound, TimeUtils.secondToTime(wait_second));
            while (toNumber < toPrediction && !ships.isEmpty()) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                Ship ship = (Ship) ships.peek();
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                    startTimeTemp = ship.getLateTime();
                }
                if (equalOrAfter(bound, startTimeTemp)) break;
                ship = getShip(ships);
                //add to wait queue
                shipsWaiting.add(ship);

                startTimeTemp = getGoList(startTimeTemp, goIslandList, ship, true);

                toNumber += ship.getCapability();

                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);

            }

            backTimeTemp = start;
            while (backNumber < backPrediction && equalOrAfter(actuall_backTime, backTimeTemp)) {
                //保证正确性，最后一艘出发时间超过下一个loop开始时间的航班直接取消
                Ship ship;
                //考虑岛内没有船 需空跑
                if (shipsWaiting.isEmpty()) {
                    ship = (Ship) ships.peek();
                    if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp)) {
                        startTimeTemp = ship.getLateTime();
                    }
                    startTimeTemp = directGo(backTimeTemp, ship, bound);
                    //末尾处理
                    if (equalOrAfter(bound, startTimeTemp)) break;
                    ship = getShip(ships);
                    //18分20秒左右 相当于趟海路加上停泊上下船的
                    backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                    startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
                } else {
                    ship = (Ship) shipsWaiting.peek();
                    if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                        backTimeTemp = ship.getLateTime();
                    }
                    //末尾处理
                    if (equalOrAfter(bound, backTimeTemp)) break;
                    ship = getShip(shipsWaiting);
                }

                backNumber += ship.getCapability();
                //total_back_traffic+=ship.getCapability();
                ships.add(ship);
                backTimeTemp = getGoList(backTimeTemp, goBackList, ship, false);
                backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
            }
            sortList(records, goIslandList, goBackList);
        }

        Time bound = Time.valueOf("23:59:59");
        Time interval = TimeUtils.secondToTime(wait_second);
        ArrayList<Record> goBackList = new ArrayList<>();
        int num1 = records.get(0).stream().mapToInt(e -> e.getShipTraffic()).sum();
        int total_back_traffic = records.get(1).stream().mapToInt(e -> e.getShipTraffic()).sum();
        while (total_back_traffic < num1) {
            Ship ship;
            if (shipsWaiting.isEmpty()) {
                ship = getShip(ships);
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(startTimeTemp))
                    startTimeTemp = ship.getLateTime();
                startTimeTemp = directGo(backTimeTemp, ship, bound);
                backTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, TimeUtils.secondToTime(ShipConstant.IN_SEA_SECOND + wait_second));//TODO
                startTimeTemp = TimeUtils.timeOperation("+", startTimeTemp, interval);
            } else {
                ship = getShip(shipsWaiting);
                if (!Objects.isNull(ship.getLateTime()) && ship.getLateTime().after(backTimeTemp)) {
                    backTimeTemp = ship.getLateTime();
                }
            }
            total_back_traffic += ship.getCapability();
            ships.add(ship);
            backTimeTemp = getGoList(backTimeTemp, goBackList, ship, false);
            backTimeTemp = TimeUtils.timeOperation("+", backTimeTemp, interval);
        }
        records.get(1).addAll(goBackList);

        while (!testTimeFilter(records)) {
            timeFilter(records);
        }
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

    private Ship getShip(Ship ship, Heap<Ship> bigShips, Heap<Ship> smallShips, int bigCapability, int smallCapability) {
        Ship ship1;
        if (ship.getCapability().equals(bigCapability)) {
            ship1 = getShip(bigShips);
        } else {
            ship1 = getShip(smallShips);
        }
        return ship1;
    }


    /**
     * sort gobacklist and goislandlist
     *
     * @param records
     * @param goBackList
     * @param goIslandList
     */
    private void sortList(ArrayList<ArrayList<Record>> records, ArrayList<Record> goIslandList, ArrayList<Record> goBackList) {
        goIslandList.sort(sortComparator);
        goBackList.sort(sortComparator);
        records.get(0).addAll(goIslandList);
        records.get(1).addAll(goBackList);
    }

    private Time directGo(Time timeTemp, Ship ship, Time bound) {

        Time delayTime1 = timeTemp;
        Time delayTime2 = timeTemp;

        Time earlyStartBusyTime = timeTemp;
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

        Time delayTime1 = getDelayTime(earlyStartBusyTime, lateStartBusyTime, startTimeTemp, TimeUtils.secondToTime(wait_second), startBerth);
        setTimeBoundary(earlyStartBusyTime, lateStartBusyTime, startTimeTemp, TimeUtils.secondToTime(wait_second), startBerth);
        Time delayTime2 = getDelayTime(earlyArriveBusyTime, lateArriveBusyTime, startTimeTemp, TimeUtils.secondToTime(wait_second), arriveBerth);
        setTimeBoundary(earlyArriveBusyTime, lateArriveBusyTime, startTimeTemp, TimeUtils.secondToTime(wait_second), arriveBerth);

        if (delayTime1.after(startTimeTemp) && delayTime1.after(delayTime2)) {
            startTimeTemp = delayTime1;
        } else if (delayTime2.after(startTimeTemp)) {
            startTimeTemp = delayTime2;
            startBerth.setEarlyBusyTime(TimeUtils.timeOperation("-", delayTime2, TimeUtils.secondToTime(wait_second)));
            startBerth.setLateBusyTime(delayTime2);
        }

        RecordParams recordParams = new RecordParams(startBerth, arriveBerth, wait_second, ship, ship.getCapability(), delayTime2, startTimeTemp, date);
        Record record1 = new Record(recordParams);
        goIslandList.add(record1);

        ship.setLateTime(lateArriveBusyTime);
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
     * @param earlyTimeBoundary
     * @param lateTimeBoundary
     * @param now
     * @return
     */
    private boolean checkTimeBoundary(Time earlyTimeBoundary, Time lateTimeBoundary, Time now) {
        return now.after(earlyTimeBoundary) && now.before(lateTimeBoundary);
    }
}

