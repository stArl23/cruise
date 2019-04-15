package com.huidi.cruise.converter;

import com.huidi.cruise.domain.Berth;
import com.huidi.cruise.dto.BerthDto;
import com.huidi.cruise.utils.StringUtil;

import java.util.List;
import java.util.stream.Collectors;


public class Berth2BerthDto {
    public static BerthDto convert(Berth berth) {
        String name = StringUtil.getBerthName(berth.getSNumber());
        return new BerthDto(berth.getId(), name
                , berth.getIsAvailable());
    }


    public static List<BerthDto> convert(List<Berth> berths) {
        return berths.stream().map(e -> convert(e)).collect(Collectors.toList());
    }


}
