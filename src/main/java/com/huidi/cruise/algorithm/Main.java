package com.huidi.cruise.algorithm;

import com.huidi.cruise.constant.AlgorithmConstant;
import com.huidi.cruise.constant.ShipConstant;
import com.huidi.cruise.converter.Record2RecordDto;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.dto.RecordDto;
import com.huidi.cruise.utils.ExcelUtils;
import com.huidi.cruise.utils.RecordsVOutils;
import com.huidi.cruise.utils.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        ArrayList<Berth> startBerths = new ArrayList<>();
        ArrayList<Berth> arriveBerths = new ArrayList<>();
        ArrayList<Ship> smallShips = new ArrayList<>();
        ArrayList<Ship> bigShips = new ArrayList<>();
        Time startTime = Time.valueOf("07:00:00");
        Time endTime = Time.valueOf("18:00:00");
        Time loopTime = Time.valueOf("02:00:00");
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
        for (int i = 1; i <= 5; i++) {
            Ship ship = new Ship("B" + i, 200);
            bigShips.add(ship);
        }

        for (int i = 6; i <= 18; i++) {
            Ship ship = new Ship("S" + (i - 5), 100);
            smallShips.add(ship);
        }

        Algorithm m = new Algorithm(new Date(System.currentTimeMillis()), startTime, endTime, startBerths, arriveBerths, bigShips, smallShips, (int) ((int) ShipConstant.WAIT_SECOND * AlgorithmConstant.DELAYRATE));

        ArrayList<ArrayList<Record>> recordsList = /*m.findMax(30000)*/m.findOpt(18000);

        int res = recordsList.get(0).stream().mapToInt(e -> e.getShipTraffic()).sum();

        System.out.println(res);
        ArrayList<RecordDto> recordDtos = (ArrayList<RecordDto>) Record2RecordDto.convert(recordsList.get(0));
        RecordsVOutils.setTempBerth(recordDtos);
        for (RecordDto r : recordDtos) {
            System.out.println(r);
        }
        //仅仅来或者回的客流量

        //统计来回船的工作量
        System.out.println(recordsList.get(0).size() + recordsList.get(1).size());
        int result[] = new int[30];
        for (Record record : recordsList.get(0)) {
            result[StringUtils.getShipId(record.getShipName())] += 1;
        }

        int result1[] = new int[8];
        for (Berth berth : startBerths) {
            result1[Integer.parseInt(berth.getName())] = berth.getFreq();
        }

        for (Berth berth : arriveBerths) {
            result1[Integer.parseInt(berth.getName())] = berth.getFreq();
        }

        for (Record record : recordsList.get(1)) {
            result[StringUtils.getShipId(record.getShipName())] += 1;
        }
        for (int i = 1; i < 19; i++) {
            if (i == 6) System.out.println();
            System.out.print("ship " + i + ":" + result[i] + "     ");
        }

        System.out.println();
        for (int i = 1; i < 8; i++) {
            System.out.print("berth " + i + ":" + result1[i] + "     ");
            if (i % 4 == 0) System.out.println();
        }

        System.out.println();
        System.out.println("qian:" + recordsList.get(0).stream().mapToInt(e -> e.getShipTraffic()).sum());


        List<Record> recordList1 = new ArrayList<>();
        recordList1.addAll(recordsList.get(0));
        recordList1.addAll(recordsList.get(1));

        recordList1.sort((o1, o2) -> o1.getStartTime().after(o2.getStartTime()) ? 1 : -1);

        System.out.println("\n\n");
        for (int i = 1; i <= 18; i++) {
            List<Record> tempList = new ArrayList<>();
            String shipName = i <= ShipConstant.DEVIDED ? "B" + i : "S" + (i - ShipConstant.DEVIDED);
            for (Record record : recordList1) {
                if (record.getShipName().equals(shipName)) {
                    tempList.add(record);
                }
            }

            System.out.println(shipName);
            for (Record record : tempList) {
                System.out.println(record);
            }
            System.out.println();

           /* int num = 0;
            for (int j = 0; j < tempList.size(); j++) {
                for (int k = j + 1; k < tempList.size(); k++) {
                    Time t = TimeUtils.timeOperation("-", tempList.get(k).getStartTime(), tempList.get(j).getArriveTime());
                    if (tempList.get(j).getArriveBerth().equals(tempList.get(k).getStartBerth()) && TimeUtils.timeToSecond(t) < (int) ((int) ShipConstant.WAIT_SECOND * AlgorithmConstant.DELAYRATE)) {
                        System.out.println("dup found!");
                        System.out.println(tempList.get(j));
                        System.out.println(tempList.get(k));
                        System.out.println();
                        num++;
                    }
                }
            }


            System.out.println(num);*/
        }

        /*for (Record record : recordList1) {
            record.setShipName(StringUtils.getShipId(record.getShipName())< 6 ? "B" + record.getShipName() : "S" + (Integer.parseInt(record.getShipName()) - 5));
        }*/
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String title = "Records " + sdf.format(new Date(System.currentTimeMillis()));
        recordList1.clear();
        recordList1.addAll(recordsList.get(0));
        recordList1.addAll(recordsList.get(1));
        HSSFWorkbook hssfWorkbook = ExcelUtils.generateHSSFWorkbook(Record2RecordDto.convert2Excel(Record2RecordDto.convert(recordList1)), title);

        HSSFSheet sheet = hssfWorkbook.createSheet("统计数据分析");
        HSSFRow row = sheet.createRow(0);
        HSSFCell cell1 = row.createCell(2);
        cell1.setCellValue("码头使用情况：");
        row = sheet.createRow(1);

        for (int i = 1; i < 8; i++) {
            HSSFCell cell = row.createCell((i - 1) * 2);
            cell.setCellValue(i <= 4 ? "岛外" + i + "号码头" : "岛内" + (i - 4) + "号码头");
        }

        row = sheet.createRow(2);
        for (int i = 1; i < 8; i++) {
            HSSFCell cell = row.createCell((i - 1) * 2);
            cell.setCellValue(result1[i]);
        }

        row = sheet.createRow(4);
        cell1 = row.createCell(2);
        cell1.setCellValue("船只使用情况：");

        row = sheet.createRow(5);
        for (int i = 1; i < 19; i++) {
            HSSFCell cell = row.createCell((i - 1) * 2);
            cell.setCellValue(i < 6 ? "B" + i : "S" + (i - 5));
        }

        row = sheet.createRow(6);
        for (int i = 1; i < 19; i++) {
            HSSFCell cell = row.createCell((i - 1) * 2);
            cell.setCellValue(result[i]);
        }

      /*  try {
            File file=new File("."+File.separatorChar+"doc"+File.separatorChar + "findOpt(11000)"+new Date(System.currentTimeMillis()).toString() + ".xls");
            file.createNewFile();
            hssfWorkbook.write(file);
        } catch (IOException e) {
            e.printStackTrace();
        }*/

//        System.out.println("hou:"+newRecords2.stream().mapToInt(e -> e.getShipTraffic()).sum());

    }
}

