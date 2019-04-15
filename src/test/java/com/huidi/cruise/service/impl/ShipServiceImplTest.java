package com.huidi.cruise.service.impl;

import com.huidi.cruise.constant.ShipConstant;
import com.huidi.cruise.domain.Ship;
import com.huidi.cruise.service.ShipService;
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
public class ShipServiceImplTest {

    @Autowired
    private ShipService shipService;

    @Test
    public void enableShip() {
        shipService.enableShip("1546572905323828032");
    }

    @Test
    public void addShip() {
        for (int i = 9; i <= 16; i++) {
            Ship ship = new Ship();
            ship.setIsAvailable(Boolean.TRUE);
            ship.setCapability(ShipConstant.BIGSHIPCAPABILITY);
            ship.setSNumber("B" + i);
            shipService.addShip(ship);
        }

        for (int i = 6; i <= 10; i++) {
            Ship ship = new Ship();
            ship.setIsAvailable(Boolean.TRUE);
            ship.setCapability(ShipConstant.SMALLSHIPCAPABILITY);
            ship.setSNumber("S" + i);
            shipService.addShip(ship);

        }
    }

    @Test
    public void disableShip() {
        shipService.disableShip("1546572905323828032");
    }

    @Test
    public void changeShip() {
        Ship ship = new Ship();
        ship.setId("1546572904937961949");
        ship.setSNumber("22");
        shipService.changeShip(ship);
    }

    @Test
    public void showShipDetail() {
        Assert.assertNotNull(shipService.showShipDetail("1546572905323828032"));
    }
}