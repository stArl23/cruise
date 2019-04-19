package com.huidi.cruise.controller;

import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.converter.Berth2BerthDto;
import com.huidi.cruise.dto.BerthDto;
import com.huidi.cruise.service.BerthService;
import com.huidi.cruise.utils.ResultVOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/berth")
public class BerthController {
    @Autowired
    private BerthService berthService;

    @GetMapping("/list")
    public ResultVO<List<BerthDto>> list() {
        return ResultVOUtils.success(Berth2BerthDto.convert(berthService.listAllBerth()));
    }

    @GetMapping("/enable")
    public ResultVO enable(@RequestParam("id") String id) {
        berthService.enableBerth(id);
        return ResultVOUtils.success();
    }

    @GetMapping("/disable")
    public ResultVO disable(@RequestParam("id") String id) {
        berthService.disableBerth(id);
        return ResultVOUtils.success();
    }
}
