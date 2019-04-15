package com.huidi.cruise.schedule;

import com.huidi.cruise.constant.RecordConstant;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.repository.RecordRepository;
import com.huidi.cruise.utils.CacheUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Component
public class CacheScheduleTask {
    //每天0点清除缓存
    @Scheduled(cron = "0 0 12 * * ?")
    public void saveAndClearRecords(){

        CacheUtils.setObject(RecordConstant.RECORDS,new ArrayList<>());
    }
}
