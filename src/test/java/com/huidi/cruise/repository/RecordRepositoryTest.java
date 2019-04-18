package com.huidi.cruise.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class RecordRepositoryTest {
    @Autowired
    private RecordRepository recordRepository;

    @Test
    public void test1() {
        Calendar calendar = Calendar.getInstance();
        Date date = new Date(System.currentTimeMillis());
        calendar.setTime(date);
        calendar.add(Calendar.DATE, -3);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        System.out.println(sdf.format(calendar.getTime()));
        int i = recordRepository.countRecordsByDateBetween(new Date(calendar.getTimeInMillis()), date);
        System.out.println(i);
    }
}