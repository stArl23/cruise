package com.huidi.cruise.utils;

import com.huidi.cruise.VO.RecordsVO;
import com.huidi.cruise.converter.Record2RecordDto;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.form.RecordRequestForm;
import org.springframework.beans.BeanUtils;

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
}
