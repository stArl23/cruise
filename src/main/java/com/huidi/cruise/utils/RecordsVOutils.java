package com.huidi.cruise.utils;

import com.huidi.cruise.VO.RecordsVO;
import com.huidi.cruise.constant.BerthConstant;
import com.huidi.cruise.constant.ShipConstant;
import com.huidi.cruise.converter.Record2RecordDto;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.dto.RecordDto;
import com.huidi.cruise.form.RecordRequestForm;
import org.springframework.beans.BeanUtils;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class RecordsVOutils {
    public static RecordsVO getRecordsVO(RecordRequestForm form, List<Record> recordList) {
        RecordsVO recordsVO = new RecordsVO();
        BeanUtils.copyProperties(form, recordsVO);
        recordsVO.setPageVO(PageVOUtils.page(Record2RecordDto.convert(recordList)));
        recordsVO.setHours(form.getStartTime() + "-" + form.getEndTime());
        //get wait time
        Integer wait_second = TimeUtils.timeToSecond(recordList.get(0).getOnOrOutTime());
        recordsVO.setBigShipWaitTime(wait_second/*(int) (form.getBigShipTraffic() / ShipConstant.CUSTOMERSPEED)*/);
        recordsVO.setSmallShipWaitTime(wait_second/*(int) (form.getSmallShipTraffic() / ShipConstant.CUSTOMERSPEED)*/);
        //get total traffic
        //replace with reference
        Integer traffic = recordList.stream().mapToInt(Record::getShipTraffic).sum();
        recordsVO.setTraffic(traffic);
        return recordsVO;
    }

    public static void setTempBerth(List<RecordDto> recordDtos) {
        int total_num = ShipConstant.BIG_NUM + ShipConstant.SMALL_NUM;

        ArrayList<ArrayList<RecordDto>> tempRecords = new ArrayList<>();
        for (int i = 0; i <= total_num; i++) {
            tempRecords.add(new ArrayList<>());
        }

        for (RecordDto recordDto : recordDtos) {
            int index = StringUtils.getShipId(recordDto.getShipName());
            tempRecords.get(index).add(recordDto);
        }

        for (int i = 1; i <= total_num; i++) {
            tempRecords.get(i).sort((o1, o2) -> Time.valueOf(o1.getStartTime()).after(Time.valueOf(o2.getStartTime())) ? 1 : -1);
            ArrayList<RecordDto> ts = tempRecords.get(i);
            if (ts.isEmpty()) continue;
            if (ts.size() == 1) {
                ts.get(0).setTempBerth(BerthConstant.NONE_TEMP_BERTH);
            } else {
                for (int j = 1; j < ts.size(); j++) {
                    if (ts.get(j - 1).getArriveBerth().equals(ts.get(j).getStartBerth())) {
                        ts.get(j - 1).setTempBerth(BerthConstant.NONE_TEMP_BERTH);
                    } else {
                        if (ts.get(j - 1).getArriveBerth().contains("In")) {
                            ts.get(j - 1).setTempBerth(BerthConstant.IN_ISLAND_T_BERTH);
                        } else {
                            ts.get(j - 1).setTempBerth(BerthConstant.OFF_ISLAND_T_BERTH);
                        }
                    }
                }
                ts.get(ts.size() - 1).setTempBerth(BerthConstant.NONE_TEMP_BERTH);
            }
        }
    }
}
