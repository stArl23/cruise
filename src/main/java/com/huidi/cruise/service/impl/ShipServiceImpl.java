package com.huidi.cruise.service.impl;

import com.huidi.cruise.domain.Ship;
import com.huidi.cruise.enums.CommonEnums;
import com.huidi.cruise.enums.ShipEnums;
import com.huidi.cruise.exception.CommonException;
import com.huidi.cruise.exception.ShipException;
import com.huidi.cruise.repository.ShipRepository;
import com.huidi.cruise.service.ShipService;
import com.huidi.cruise.utils.KeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class ShipServiceImpl implements ShipService {
    @Autowired
    private ShipRepository shipRepository;

    @Override
    public void addShip(Ship ship) {
        Ship shiptemp = shipRepository.getBySNumber(ship.getSNumber());
        if (Objects.nonNull(shiptemp)) {
            throw new ShipException(ShipEnums.SHIP_EXISTS.getId()
                    , ShipEnums.SHIP_EXISTS.getMessage());
            //throw exception
        }

        ship.setId(KeyUtils.genUniqueKey());
        shipRepository.save(ship);

    }

    @Override
    public void enableShip(String id) {
        Ship shiptemp = shipRepository.getOne(id);
        if (Objects.isNull(shiptemp)) {
            throw new ShipException(ShipEnums.SHIP_NO_FOUND.getId()
                    , ShipEnums.SHIP_NO_FOUND.getMessage());
        }
        if (!shiptemp.getIsAvailable()) shiptemp.setIsAvailable(Boolean.TRUE);
        shipRepository.save(shiptemp);
    }

    @Override
    public void disableShip(String id) {
        Ship shiptemp = shipRepository.getOne(id);
        if (Objects.isNull(shiptemp)) {
            throw new ShipException(ShipEnums.SHIP_NO_FOUND.getId()
                    , ShipEnums.SHIP_NO_FOUND.getMessage());
        }
        if (shiptemp.getIsAvailable()) shiptemp.setIsAvailable(Boolean.FALSE);
        shipRepository.save(shiptemp);
    }

    @Override
    public void changeShip(Ship ship) {
        if (Objects.isNull(ship)) {
            throw new CommonException(CommonEnums.OBJECT_NULL.getId(), CommonEnums.OBJECT_NULL.getMessage());
        }
        Ship shiptemp = shipRepository.getOne(ship.getId());
        if (Objects.isNull(shiptemp)) {
            throw new ShipException(ShipEnums.SHIP_NO_FOUND.getId(), ShipEnums.SHIP_NO_FOUND.getMessage());
        }
        shipRepository.save(ship);
    }

    @Override
    public Ship showShipDetail(String id) {
        Ship ship = shipRepository.getOne(id);
        if (Objects.isNull(ship)) {
            throw new ShipException(ShipEnums.SHIP_NO_FOUND.getId(), ShipEnums.SHIP_NO_FOUND.getMessage());
        }
        return ship;
    }

    @Override
    public List<Ship> listAllShips() {
        return shipRepository.findAll();
    }

}
