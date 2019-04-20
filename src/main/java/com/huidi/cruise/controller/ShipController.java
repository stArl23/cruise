package com.huidi.cruise.controller;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.domain.Ship;
import com.huidi.cruise.form.ShipForm;
import com.huidi.cruise.service.ShipService;
import com.huidi.cruise.utils.ResultVOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/ship")
public class ShipController {

    @Autowired
    private ShipService shipService;

    //update or saveRecord
    @PostMapping("/save")
    public ResultVO create(ShipForm shipForm) {
        Ship ship = new Ship();
        BeanUtils.copyProperties(shipForm, ship);
        if (Objects.isNull(ship.getId())) {
            shipService.addShip(ship);
        } else {
            shipService.changeShip(ship);
        }
        return ResultVOUtils.success();
    }

    @GetMapping("/list")
    public ResultVO<List<Ship>> list() {
        return ResultVOUtils.success(shipService.listAllShips());
    }

    @GetMapping("/enable")
    public ResultVO enable(@RequestParam("id") String id) {
        shipService.enableShip(id);
        return ResultVOUtils.success();
    }

    @GetMapping("/disable")
    public ResultVO disable(@RequestParam("id") String id) {
        shipService.disableShip(id);
        return ResultVOUtils.success();
    }
}
