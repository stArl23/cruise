package com.huidi.cruise.controller;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.domain.Ship;
import com.huidi.cruise.form.ShipForm;
import com.huidi.cruise.service.ShipService;
import com.huidi.cruise.utils.ResultVOUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/ship")
@Api(value="ShipController",description ="the api of ships" )
public class ShipController {

    @Autowired
    private ShipService shipService;

    //update or saveRecord
    @PostMapping("/save")
    @ApiOperation(value=" saveRecord information of a ship",notes = " saveRecord information of a ship",httpMethod = "POST",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
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
    @ApiOperation(value="list all ships",notes = "list all ships",httpMethod = "GET",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResultVO<List<Ship>> list() {
        return ResultVOUtils.success(shipService.listAllShips());
    }

    @GetMapping("/enable")
    @ResponseBody
    @ApiOperation(value="enable a ship",notes = "enable a ship",httpMethod = "GET",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType="String", name = "id", value = "unique id", required = true),
    })
    public ResultVO enable(@RequestParam("id") String id) {
        shipService.enableShip(id);
        return ResultVOUtils.success();
    }

    @GetMapping("/disable")
    @ApiOperation(value="disable a ship",notes = "disable a ship",httpMethod = "GET",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType="String", name = "id", value = "unique id", required = true),
    })
    public ResultVO disable(@RequestParam("id") String id) {
        shipService.disableShip(id);
        return ResultVOUtils.success();
    }
}
