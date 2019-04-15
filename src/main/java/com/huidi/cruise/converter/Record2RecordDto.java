package com.huidi.cruise.converter;

import com.huidi.cruise.domain.Record;
import com.huidi.cruise.dto.RecordDto;
import com.huidi.cruise.utils.StringUtil;
import com.huidi.cruise.utils.interfaces.Excelable;

import java.util.List;
import java.util.stream.Collectors;

public class Record2RecordDto {

    public static RecordDto convert(Record record) {
        //use toIntExact to convert long to int safely
        return new RecordDto(record.getId(),record.getArriveTime(), record.getShipName()
                , StringUtil.getBerthName(record.getStartBerth())
                ,StringUtil.getBerthName(record.getArriveBerth())
                , record.getStartTime(), record.getTotalTime().toString()
                , record.getTotalTime().toString());
    }

    public static Excelable convert2Excel(RecordDto recordDto){
        return (Excelable)recordDto;
    }


    public static List<RecordDto> convert(List<Record> records) {
        return records.stream().map(e -> convert(e)).collect(Collectors.toList());
    }

    public static List<Excelable> convert2Excel(List<RecordDto> recordDtos){
        return recordDtos.stream().map(e -> convert2Excel(e)).collect(Collectors.toList());
    }
}
