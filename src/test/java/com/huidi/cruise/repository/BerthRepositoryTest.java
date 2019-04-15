package com.huidi.cruise.repository;

import com.huidi.cruise.constant.BerthConstant;
import com.huidi.cruise.domain.Berth;
import com.huidi.cruise.utils.KeyUtils;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class BerthRepositoryTest {
    @Autowired
    private BerthRepository berthRepository;


    @Test
    public void testAdd() {
        for (int i = 10; i <= 18; i++) {
            Berth berth = new Berth();
            berth.setIsAvailable(Boolean.TRUE);
            berth.setSNumber(i);
            berth.setId(KeyUtils.genUniqueKey());
            berthRepository.save(berth);
        }
    }

    @Test
    public void count() {
        long number = berthRepository.countBerthsByIsAvailable(Boolean.TRUE);
        long number1 = berthRepository.countBerthsBySNumberGreaterThanAndAndIsAvailable(BerthConstant.DEVIDED, Boolean.TRUE);
        Assert.assertEquals(9, number);
        Assert.assertEquals(5, number1);
    }
}