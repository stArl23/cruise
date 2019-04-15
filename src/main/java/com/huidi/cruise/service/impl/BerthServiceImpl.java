package com.huidi.cruise.service.impl;

import com.huidi.cruise.constant.BerthConstant;
import com.huidi.cruise.domain.Berth;
import com.huidi.cruise.enums.BerthEnums;
import com.huidi.cruise.exception.BerthException;
import com.huidi.cruise.repository.BerthRepository;
import com.huidi.cruise.service.BerthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class BerthServiceImpl implements BerthService {
    @Autowired
    private BerthRepository berthRepository;

    @Override
    public List<Berth> listAllBerth() {
        return berthRepository.findAll();
    }

    @Override
    public void enableBerth(String id) {
        Berth berth = berthRepository.getOne(id);
        if (Objects.isNull(berth)) {
            throw new BerthException(BerthEnums.BERTH_NO_FOUND.getId()
                    , BerthEnums.BERTH_NO_FOUND.getMessage());
        }
        if (!berth.getIsAvailable()) berth.setIsAvailable(Boolean.TRUE);
        berthRepository.save(berth);
    }

    @Override
    public void disableBerth(String id) {
        Berth berth = berthRepository.getOne(id);
        if (Objects.isNull(berth)) {
            throw new BerthException(BerthEnums.BERTH_NO_FOUND.getId()
                    , BerthEnums.BERTH_NO_FOUND.getMessage());
        }
        //island berths
        long inEnable = berthRepository.countBerthsBySNumberGreaterThanAndAndIsAvailable(BerthConstant.DEVIDED, Boolean.TRUE);
        //off the island berths
        long outEnable = berthRepository.countBerthsByIsAvailable(Boolean.TRUE) - inEnable;


        if (berth.getSNumber() > BerthConstant.DEVIDED && inEnable <= 1) {
            //throw exception every side should have at least one berth is available
            throw new BerthException(BerthEnums.ONE_SIDE_BERTHS_UNAVAILABLE.getId()
                    , BerthEnums.ONE_SIDE_BERTHS_UNAVAILABLE.getMessage());
        }
        if (berth.getSNumber() < BerthConstant.DEVIDED && outEnable <= 1) {
            throw new BerthException(BerthEnums.ONE_SIDE_BERTHS_UNAVAILABLE.getId()
                    , BerthEnums.ONE_SIDE_BERTHS_UNAVAILABLE.getMessage());
        }

        if (berth.getIsAvailable()) berth.setIsAvailable(Boolean.FALSE);
        berthRepository.save(berth);
    }
}
