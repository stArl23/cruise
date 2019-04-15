package com.huidi.cruise.controller;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.converter.Berth2BerthDto;
import com.huidi.cruise.dto.BerthDto;
import com.huidi.cruise.service.BerthService;
import com.huidi.cruise.utils.ResultVOUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/berth")
@Api(value="BerthController",description ="the api of berths" )
public class BerthController {
    @Autowired
    private BerthService berthService;

    @GetMapping("/list")
    @ApiOperation(value="list all berths",notes = "list all berths",httpMethod = "GET",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResultVO<List<BerthDto>> list() {
        return ResultVOUtil.success(Berth2BerthDto.convert(berthService.listAllBerth()));
    }

    @GetMapping("/enable")
    @ApiOperation(value="enable a berth",notes = "enable a berth",httpMethod = "GET",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType="String", name = "id", value = "unique id", required = true),
    })
    public ResultVO enable(@RequestParam("id") String id) {
        berthService.enableBerth(id);
        return ResultVOUtil.success();
    }

    @GetMapping("/disable")
    @ApiOperation(value="disable a berth",notes = "disable a berth",httpMethod = "GET",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType="String", name = "id", value = "unique id", required = true),
    })
    public ResultVO disable(@RequestParam("id") String id) {
        berthService.disableBerth(id);
        return ResultVOUtil.success();
    }
}
