package com.huidi.cruise.schedule;

import com.huidi.cruise.constant.RecordConstant;
import com.huidi.cruise.utils.CacheUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;

@Component
public class CacheScheduleTask {
    //每天0点清除缓存
    @Scheduled(cron = "0 0 12 * * ?")
    public void saveAndClearRecords(){
        CacheUtils.setObject(RecordConstant.GOISLANDRECORDS, new ArrayList<>());
        CacheUtils.setObject(RecordConstant.GOBACKRECORDS, new ArrayList<>());
    }
}
