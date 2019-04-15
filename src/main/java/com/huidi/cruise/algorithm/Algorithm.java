package com.huidi.cruise.algorithm;

import java.sql.Time;
import java.sql.Date;
import java.util.*;
import com.huidi.cruise.domain.Record;

public class Algorithm {
    private static final double OVERCROWDINGRATE=1.3;
    private ArrayList<Berth> berthAlgorithms;
    private Map<String, Berth> berthMap;
    private ArrayList<Berth> startBerthAlgorithms;
    private ArrayList<Berth> arriveBerthAlgorithms;
    private ArrayList<Ship> smallShips;
    private ArrayList<Ship> bigShips;
    private Heap<Ship> ships;
    private Date date;
    private Comparator<Record> sortComparator;

     public Algorithm(ArrayList<Berth> startBerthAlgorithms, ArrayList<Berth> arriveBerthAlgorithms, ArrayList<Ship> bigShips, ArrayList<Ship> smallShips,Date date) {
        berthMap=new HashMap<>();
        berthAlgorithms = new ArrayList<>();
        this.bigShips=bigShips;
        this.smallShips=smallShips;
        this.startBerthAlgorithms = startBerthAlgorithms;
        this.arriveBerthAlgorithms = arriveBerthAlgorithms;
        this.date=date;
        berthAlgorithms.addAll(startBerthAlgorithms);
        berthAlgorithms.addAll(arriveBerthAlgorithms);
         for (Berth berthAlgorithm : startBerthAlgorithms) {
             berthMap.put(berthAlgorithm.getName(), berthAlgorithm);
         }
         for (Berth berthAlgorithm : arriveBerthAlgorithms) {
             berthMap.put(berthAlgorithm.getName(), berthAlgorithm);
         }

         this.ships=new Heap<>(18, new Comparator<Ship>() {
             @Override
             public int compare(Ship o1, Ship o2) {
                 // the priority higher, freq low
                 return o1.getPriority()*o1.getFreq()-o2.getPriority()*o2.getFreq();
             }
         });

        this.sortComparator= new Comparator<Record>() {
            @Override
            public int compare(Record o1, Record o2) {
                return o1.getStartTime().after(o2.getStartTime())?1:-1;
            }
        };
    }

    /**
     * Find the opt berth
     * @param berthAlgorithms all berthAlgorithms used in this schedule
     * @param earlyBusyTime the most early time berth will be used
     * @param lateBusyTime the most last time berth will be used
     * @return list of record
     */
    private Berth findBerth(ArrayList<Berth> berthAlgorithms, Time earlyBusyTime, Time lateBusyTime){
        Time temp = Time.valueOf("23:59:59");
        Berth tempBerthAlgorithm = null;
        for(Berth berthAlgorithm : berthAlgorithms){
            // find a berthAlgorithm is available during this period of time
            if(berthAlgorithm.getEarlyBusyTime() == null || (berthAlgorithm.getLateBusyTime().before(earlyBusyTime) || berthAlgorithm.getEarlyBusyTime().after(lateBusyTime))){
                return berthAlgorithm;
            }
            else{
                //if no berthAlgorithm is available, find a berthAlgorithm which can make ship wait the least time
                if(temp.after(berthAlgorithm.getLateBusyTime())) {
                    temp = berthAlgorithm.getLateBusyTime();
                    tempBerthAlgorithm = berthAlgorithm;
                }
            }
        }
        return tempBerthAlgorithm;
    }

    /**
     * Basic findOpt , find a record list with opt time interval
     * @param number
     * @return list of records
     */
    public ArrayList<Record> findOpt(int number){
        //prepare data
        HashMap<String,Ship> shipMap=new HashMap<>();
        ships.clear();
        for (Ship ship: this.smallShips) {
            Ship ship1=new Ship(ship.getName(), ship.getCapability());
            ship1.setPriority(this.bigShips.size());
            ships.add(ship1);
            shipMap.put(ship1.getName(),ship1);
        }

        for (Ship ship: this.bigShips) {
            Ship ship1=new Ship(ship.getName(), ship.getCapability());
            ship1.setPriority(this.smallShips.size());
            ships.add(ship1);
            shipMap.put(ship1.getName(),ship1);
        }

        ArrayList<Record> records = new ArrayList<>();
        Time startTime = Time.valueOf("7:00:00");
        Time endTime=Time.valueOf("16:30:00");
        Time loopInterval=Time.valueOf("00:50:00");
        int secondLoopInterval=timeToSecond(loopInterval);
        int loopNumber=timeToSecond(timeOperation("-",endTime,startTime))/secondLoopInterval;
        //the smallest capability is 100
        int numOfEachLoop= (int) Math.ceil((double)number/loopNumber);

        //Time bias = Time.valueOf("0:2:0"); // for accidents
        //first calculate people needed for each loop
        //one loop is two schedule of one ship gone to and gone back
        for (int i = 0; i <loopNumber ; i++) {
            int num = 0;
            int t=(secondLoopInterval/(numOfEachLoop/100))/60*60;
            Time interval = secondToTime(t>60?t:60);

            //if(startTime.after(endTime))break;
            if(i!=0)
                startTime = timeOperation("+", startTime, loopInterval);
            //后推半个小时开始回程
            Time startTimeTemp=startTime;
            //Time goBackTime=timeOperation("+",startTime,halfLoopInterval);
            ArrayList<Record> goBackList=new ArrayList<>();
            ArrayList<Record> goIslandList=new ArrayList<>();
            //generate
            while(num < numOfEachLoop) {
                //get ship
                Ship ship = getShip(ships);
                // time need for up and down time
                startTimeTemp = getGoIslandList(startTimeTemp, goIslandList, ship);

                num += ship.getCapability();
                startTimeTemp=timeOperation("+",startTimeTemp,interval);
                //if startTime
                //if(startTimeTemp.after(timeOperation("+",startTime,halfLoopInterval)))break;
            }
            getGoBackList(shipMap, interval, goBackList, goIslandList);
            sortList(records, goBackList, goIslandList);
        }

        return records;
    }

    //尽量提高运量

    /***
     * find the record list with the maximum passenger traffic
     * @return the list of record
     */
    public ArrayList<Record> findMax(){
        //TODO 明天实现变化时间间隔
        HashMap<String,Ship> shipMap=new HashMap<>();
        ships.clear();

        for (Ship ship: this.smallShips) {
            Ship ship1=new Ship(ship.getName(), (int) (ship.getCapability()*OVERCROWDINGRATE));
            ship1.setPriority(this.smallShips.size());
            ships.add(ship1);
            shipMap.put(ship1.getName(),ship1);
        }

        for (Ship ship: this.bigShips) {
            Ship ship1=new Ship(ship.getName(), (int) (ship.getCapability()*OVERCROWDINGRATE));
            ship1.setPriority(this.bigShips.size());
            ships.add(ship1);
            shipMap.put(ship1.getName(),ship1);
        }

        ArrayList<Record> records = new ArrayList<>();
        Time startTime = Time.valueOf("7:00:00");
        Time endTime=Time.valueOf("16:30:00");
        int loopNumber=timeToSecond(timeOperation("-",endTime,startTime))/3000;
        Time loopInterval=Time.valueOf("00:50:00");

        //Time bias = Time.valueOf("0:2:0"); // for accidents
        //划分区间，50分钟算一个大轮回,一直发船，根据record发回船
        //first calculate people needed for each loop
        //one loop is two schedule of one ship gone to and gone back
        for (int i = 0; i <loopNumber ; i++) {
            int num = 0;
            Time interval = Time.valueOf("00:01:00");//50/18
            if(startTime.after(endTime))break;
            if(i!=0)
                startTime = timeOperation("+", startTime, loopInterval);
            Time startTimeTemp=startTime;
            //Time goBackTime=timeOperation("+",startTime,secondToTime(1500));
            ArrayList<Record> goBackList=new ArrayList<>();
            ArrayList<Record> goIslandList=new ArrayList<>();
            //generate
            for (int j = 0; j <ships.size() ; j++) {
                Ship ship = getShip(ships);
                // time need for up and down time
                int second = ship.getCapability() * 2;

                startTimeTemp=getGoIslandList(startTimeTemp,goIslandList,ship);
                num += ship.getCapability();
                startTimeTemp=timeOperation("+",startTimeTemp,interval);
                if(startTimeTemp.after(endTime)){
                    startTime=startTimeTemp;
                    break;
                }
            }

            getGoBackList(shipMap, interval, goBackList, goIslandList);
            sortList(records, goBackList, goIslandList);
        }

        return records;
    }

    /**
     * sort gobacklist and goislandlist
     * @param records
     * @param goBackList
     * @param goIslandList
     */
    private void sortList(ArrayList<Record> records, ArrayList<Record> goBackList, ArrayList<Record> goIslandList) {
        goIslandList.sort(sortComparator);
        goBackList.sort(sortComparator);
        records.addAll(goIslandList);
        records.addAll(goBackList);
    }

    /**
     * get go island list
     * @param startTimeTemp
     * @param goIslandList
     * @param ship
     * @return
     */
    private Time getGoIslandList(Time startTimeTemp, ArrayList<Record> goIslandList, Ship ship) {
        int second = ship.getCapability() * 2;
        Time delayTime = startTimeTemp;

        //busy time of berth
        //2 interval
        //只需要等一个上船时间即可
        Time earlyStartBusyTime = timeOperation("-", startTimeTemp, secondToTime(second));
        Time lateStartBusyTime = startTimeTemp;
        Time earlyArriveBusyTime = timeOperation("+", startTimeTemp, secondToTime(15 * 60));
        Time lateArriveBusyTime = timeOperation("+", startTimeTemp, secondToTime(15 * 60 + second * 2));

        //find opt berth
        Berth startBerthAlgorithm = findBerth(startBerthAlgorithms, earlyStartBusyTime, lateStartBusyTime);
        Berth arriveBerthAlgorithm = findBerth(arriveBerthAlgorithms, earlyArriveBusyTime, lateArriveBusyTime);
        //2 conditions
        //go island
        delayTime=setTimeBoundary(earlyStartBusyTime,lateStartBusyTime,startTimeTemp,secondToTime(second), startBerthAlgorithm);
        //2 conditions
        delayTime=setTimeBoundary(earlyArriveBusyTime,lateArriveBusyTime,startTimeTemp,secondToTime(second*2), arriveBerthAlgorithm);
        //if startTime delay then startBerthAlgorithm lateBusyTime should be delay too
        if(delayTime.after(startTimeTemp)){
            startTimeTemp=delayTime;
            //startBerthAlgorithm.setEarlyBusyTime(delayTime);
            startBerthAlgorithm.setLateBusyTime(delayTime);
        }
        //startTimeTemp=delayTime.after(startTimeTemp)?delayTime:startTimeTemp;
        RecordParams recordParams=new RecordParams(startBerthAlgorithm, arriveBerthAlgorithm,second,ship,ship.getCapability(),delayTime,startTimeTemp,date);
        //Record record1 = new Record(Integer.valueOf(startBerthAlgorithm.getName()), Integer.valueOf(arriveBerthAlgorithm.getName()), ship.getName(), ship.getCapability(), delayTime.after(startTimeTemp)?delayTime:startTimeTemp, timeOperation("-",arriveBerthAlgorithm.getEarlyBusyTime(),secondToTime(second)), secondToTime(second * 2), timeOperation("+",secondToTime(15*60),secondToTime(second)), new Date(System.currentTimeMillis()));
        Record record1=new Record(recordParams);
        goIslandList.add(record1);
        return startTimeTemp;
    }

    private void getGoBackList(HashMap<String, Ship> shipMap, Time interval, ArrayList<Record> goBackList, ArrayList<Record> goIslandList) {
        for (Record record : goIslandList) {
            Ship ship = shipMap.get(record.getShipName());
            int second = ship.getCapability() * 2;
            Time goBackTime = timeOperation("+", record.getArriveTime(), secondToTime(second * 2));
            Time earlyArriveBusyTime = timeOperation("+", goBackTime, secondToTime(15 * 60));
            Time lateArriveBusyTime = timeOperation("+", goBackTime, secondToTime(15 * 60 + second * 2));

            Berth startBerthAlgorithm = berthMap.get(Integer.toString(record.getArriveBerth()));
            Berth arriveBerthAlgorithm = findBerth(startBerthAlgorithms, earlyArriveBusyTime, lateArriveBusyTime);

            Time delayTime = setTimeBoundary(earlyArriveBusyTime, lateArriveBusyTime, goBackTime, secondToTime(second * 2), arriveBerthAlgorithm);
            RecordParams recordParams = new RecordParams(startBerthAlgorithm, arriveBerthAlgorithm, second, ship, ship.getCapability(), delayTime, goBackTime,date);
            Record record1 = new Record(recordParams);
            //goBackTime = timeOperation("+", goBackTime, interval);
            goBackList.add(record1);
        }
    }

    /**
     * Time calculation
     * @param time1
     * @param time2
     * @return
     */
    //bug2 ignore case like 7:20-6:50
    public static Time timeOperation(String sign, Time time1, Time time2){
        Time result;
        switch (sign){
            case "+":
                result=secondToTime(timeToSecond(time1)+ timeToSecond(time2));
                break;
            case "-":
                result=secondToTime(timeToSecond(time1)- timeToSecond(time2));
                break;
             default:
                 result=new Time(0);
        }
        return result;
    }

    /**
     * Convert int second to Time type
     * format hour:minute:second
     * @param second
     * @return
     */
    public static Time secondToTime(int second){
        int hour=second/3600;
        second%=3600;
        int minute = second/60;
        second = second % 60;
        Time time = Time.valueOf(hour + ":" + minute + ":" + second);
        return time;
    }

    /**
     * convert time to second
     * format hour:minute:second
     * @param time
     * @return
     */
    public static int timeToSecond(Time time){
        String[] times=time.toString().split(":");
        return Integer.valueOf(times[0])*3600+Integer.valueOf(times[1])*60+Integer.valueOf(times[2]);
    }

    /**
     * set berthAlgorithm boundary and return delayTime
     * @param earlyTimeBoundary
     * @param lateTimeBoundary
     * @param startTime
     * @param interval
     * @param berthAlgorithm
     * @return
     */
    private Time setTimeBoundary(Time earlyTimeBoundary, Time lateTimeBoundary, Time startTime, Time interval, Berth berthAlgorithm){
        Time delayTime=startTime;
        if(Objects.isNull(berthAlgorithm.getEarlyBusyTime())&&Objects.isNull(berthAlgorithm.getLateBusyTime())){
            //berthAlgorithm is never be used
            berthAlgorithm.setEarlyBusyTime(earlyTimeBoundary);
            berthAlgorithm.setLateBusyTime(lateTimeBoundary);
        }else if(checkTimeBoundary(berthAlgorithm.getEarlyBusyTime(), berthAlgorithm.getLateBusyTime(),lateTimeBoundary)){
            // when berthAlgorithm is be used, the ship should wait until the berthAlgorithm is available
            //case A when ship wants to get in berthAlgorithm, the berthAlgorithm has already been used
            //solution: put off the time for getting in berthAlgorithm until the berthAlgorithm is available
            delayTime=timeOperation("+",timeOperation("-", berthAlgorithm.getLateBusyTime(),earlyTimeBoundary),delayTime);
            berthAlgorithm.setEarlyBusyTime(berthAlgorithm.getLateBusyTime());
            berthAlgorithm.setLateBusyTime(timeOperation("+", berthAlgorithm.getLateBusyTime(), interval));
        }else if(checkTimeBoundary(berthAlgorithm.getEarlyBusyTime(), berthAlgorithm.getLateBusyTime(),earlyTimeBoundary)){
            //TODO
            //case B when ship wants to get in berthAlgorithm, the berthAlgorithm will be used for other ship in plan
            // solution like case A
            delayTime = timeOperation("+", timeOperation("-", interval, timeOperation("-", lateTimeBoundary, berthAlgorithm.getLateBusyTime())), delayTime);
            berthAlgorithm.setEarlyBusyTime(berthAlgorithm.getLateBusyTime());
            berthAlgorithm.setLateBusyTime(timeOperation("+", berthAlgorithm.getLateBusyTime(), interval));
        }else{
            berthAlgorithm.setEarlyBusyTime(earlyTimeBoundary);
            berthAlgorithm.setLateBusyTime(lateTimeBoundary);
        }

        return delayTime;
    }

    /**
     * get ship and auto sort them
     * @param ships
     * @return
     */
    private Ship getShip(Heap<Ship> ships) {
        Ship ship = (Ship) ships.remove();
        ship.increaseFreq();
        ships.add(ship);
        return ship;
    }

    /**
     * check the time given is in time interval
     * @param earlyTimeBoundary
     * @param lateTimeBoundary
     * @param now
     * @return
     */
    private boolean checkTimeBoundary(Time earlyTimeBoundary,Time lateTimeBoundary,Time now){
        return now.after(earlyTimeBoundary)&&now.before(lateTimeBoundary);
    }
}

