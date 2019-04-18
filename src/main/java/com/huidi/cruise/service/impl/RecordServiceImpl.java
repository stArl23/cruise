package com.huidi.cruise.service.impl;

import com.huidi.cruise.algorithm.Algorithm;
import com.huidi.cruise.constant.BerthConstant;
import com.huidi.cruise.converter.Berth2Berth_A;
import com.huidi.cruise.converter.Record2RecordDto;
import com.huidi.cruise.converter.Ship2Ship_A;
import com.huidi.cruise.domain.Berth;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.domain.Ship;
import com.huidi.cruise.dto.RecordDto;
import com.huidi.cruise.enums.RecordEnums;
import com.huidi.cruise.exception.RecordException;
import com.huidi.cruise.form.RecordRequestForm;
import com.huidi.cruise.repository.BerthRepository;
import com.huidi.cruise.repository.RecordRepository;
import com.huidi.cruise.repository.ShipRepository;
import com.huidi.cruise.service.RecordService;
import com.huidi.cruise.utils.ExcelUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
public class RecordServiceImpl implements RecordService {
    @Autowired
    private RecordRepository recordRepository;

    @Autowired
    private BerthRepository berthRepository;

    @Autowired
    private ShipRepository shipRepository;

    //等算法完成后
    @Override
    public ArrayList<ArrayList<Record>> drainage(RecordRequestForm form) {
        //TODO
        ArrayList<Berth> berths= (ArrayList<Berth>) berthRepository.findBerthByIsAvailableTrue();
        ArrayList<Ship> ships= (ArrayList<Ship>) shipRepository.findShipsByIsAvailableIsTrue();
        ArrayList<Ship> bigShips= (ArrayList<Ship>) ships.stream().filter(e->e.getSNumber().contains("B")).collect(Collectors.toList());
        ArrayList<Ship> smallShips= (ArrayList<Ship>) ships.stream().filter(e->e.getSNumber().contains("S")).collect(Collectors.toList());
        ArrayList<Berth> startBerths= (ArrayList<Berth>) berths.stream().filter(e->e.getSNumber()<= BerthConstant.DEVIDED).collect(Collectors.toList());
        ArrayList<Berth> endBerths= (ArrayList<Berth>) berths.stream().filter(e->e.getSNumber()>BerthConstant.DEVIDED).collect(Collectors.toList());

        Algorithm algorithm = new Algorithm(Date.valueOf(form.getDate()), Time.valueOf(form.getStartTime()), Time.valueOf(form.getEndTime()), (ArrayList<com.huidi.cruise.algorithm.Berth>) Berth2Berth_A.convert(startBerths),
                (ArrayList<com.huidi.cruise.algorithm.Berth>) Berth2Berth_A.convert(endBerths),
                (ArrayList<com.huidi.cruise.algorithm.Ship>) Ship2Ship_A.convert(bigShips),
                (ArrayList<com.huidi.cruise.algorithm.Ship>) Ship2Ship_A.convert(smallShips));
        ArrayList<ArrayList<Record>> records;
        if(form.getIsGoldenWeek()==1){
            records=algorithm.findMax();
        }else{
            records=algorithm.findOpt(form.getTraffic());
        }

        return records;
    }

    @Override
    public void saveRecord(List<Record> records) {
        recordRepository.saveAll(records);
    }

    @Override
    public List<Record> listRecords(String date) {
        return recordRepository.findAllByDate(Date.valueOf(date));
    }

    @Override
    public void deleteRecord(String id) {
        Record record = recordRepository.getOne(id);
        if (Objects.isNull(record))
            //数据库中无该记录
            throw new RecordException(RecordEnums.RECORD_NOT_EXIST.getId()
                    , RecordEnums.RECORD_NOT_EXIST.getMessage());
        recordRepository.deleteById(id);
    }

    @Override
    public void getExcel(List<RecordDto> recordDtos, ServletOutputStream outputStream) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String title="Records "+ sdf.format(new Date(System.currentTimeMillis()));
        HSSFWorkbook hssfWorkbook=ExcelUtils.generateHSSFWorkbook(Record2RecordDto.convert2Excel(recordDtos),title);
        try {
            hssfWorkbook.write(outputStream);
            outputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
